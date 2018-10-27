class FormMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.form_mailer.contact.subject
  #
  default from: "sushma@peppermintymarketing.co.uk"
  def contact
    @greeting = "Hi"

    mail to: "sushma@peppermintymarketing.co.uk", subject: "Contact Form"
  end
end
