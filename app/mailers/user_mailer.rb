class UserMailer < ApplicationMailer
  def notify_user_created(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome To QuizzBuzz, #{@user&.full_name}"
    )
  end
end
