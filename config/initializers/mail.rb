ActionMailer::Base.smtp_settings = { 
    :address => "smtp.zoho.com",
    :port => 587,
    :user_name => 'mail@cganatomy.com',
    :password => ENV["SMTP_ZOHO_PASSWORD"],
    :authentication => :login,
    :enable_starttls_auto => true
  }