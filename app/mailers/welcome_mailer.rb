class WelcomeMailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for your participation')
  end
end
