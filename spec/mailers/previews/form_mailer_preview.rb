# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/form_mailer/contact
  def contact
    FormMailerMailer.contact
  end

end
