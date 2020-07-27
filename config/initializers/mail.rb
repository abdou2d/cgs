ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => ENV["SEND_KEY"],
    :domain => 'cganatomy.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }