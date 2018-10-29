# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/form_mailer/contact
  def contact
    params = {name: "John Doe", email: "john.doe@example.com", company_name:"Company Name", phone:"07440090909",
              category:"SEO", message: "Message goes here"}
    FormMailer.contact(params)
  end

end
