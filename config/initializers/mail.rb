ActionMailer::Base.smtp_settings = {
    :address =>              ENV["SMTP_SERVER"] ,
    :port =>                 587,
    :user_name =>            ENV["SMTP_USERNAME"],
    :password =>             ENV["SMTP_PASSWORD"],
    :authentication => :login,
    :enable_starttls_auto => true
    
     }