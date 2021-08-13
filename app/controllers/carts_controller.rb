class CartsController < ApplicationController
    before_action :authenticate_user!

    def update
        parking_id = params[:cart][:parking_id]
        current_order.add_parking(parking_id)
        redirect_to root_path,  notice: "parking added seccessfuly"
    end
    
    def show
    @order = current_order
    end

    def mercado_pago
        #puts "++++++llegando a pagar con id: #{params}" 
        @order = Order.find(params[:id])
        # SDK de Mercado Pago
        require 'mercadopago'
        # Agrega credenciales
        sdk = Mercadopago::SDK.new('#')
        # Crea un objeto de preferencia
        preference_data = {
                items: [
                {
                    #puedes incluir datos que tenga el @order
                    title: "Pago de orden: #{@order.number}",
                    unit_price: @order.total,
                    description: "description del item",
                    quantity: 1
                }
                ],
                
                back_urls: {
                     success: 'http://localhost:3000/payment_success',
                     failure: 'http://localhost:3000',
                     pending: 'http://localhost:3000'
                 },
                 auto_return: 'approved'
                
            }
        preference_response = sdk.preference.create(preference_data)
        preference = preference_response[:response]
        #puts "+++response:#{preference}"
        url_pay = preference["sandbox_init_point"]
        # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
        @preference_id = preference['id']

        redirect_to url_pay
    end

    def payment_success
        @status = params[:status]
        @payment_id = params[:payment_id]
        @type = params[:payment_type]
    end
end
