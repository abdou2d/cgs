class WelcomeMailer < ApplicationMailer
    def welcome(user)
        @user = user
        mail(to: user.email, subject: "Welcome to - CG ANATOMY")
    end
end
