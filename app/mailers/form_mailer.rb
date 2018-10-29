class FormMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.form_mailer.contact.subject
  #
  default to: "sushma@peppermintymarketing.co.uk"
  def contact(params)
    @name = params.fetch(:name, nil)
    @company_name = params.fetch(:email, nil)
    @email_id = params.fetch(:company_name, nil)
    @phone = params.fetch(:phone, nil)
    @category = params.fetch(:category, nil)
    @message = params.fetch(:message, nil)

    mail from: @email_id, subject: "Pepperminty Marketing: Contact Form"
  end
end
