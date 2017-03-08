class UserMailer < ApplicationMailer
  def new_user(user)
    @user = user

    mail(
      to: user.email,
      subject: "You have successfully signed up"
    )
  end
end
