Sentry.init do |config|
    config.dsn = 'https://317ea5f11b2948e8b309a01546742f14@o963320.ingest.sentry.io/5911554'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end