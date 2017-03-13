class ReviewMailer < ApplicationMailer
  def new_review(review, admin)
    @review = review
    @admin = admin
    mail(
      to: @admin.email,
      subject: "New Review for #{review.bar.name}"
    )
  end
end
