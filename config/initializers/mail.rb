ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :domain => 'cganatomy.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }