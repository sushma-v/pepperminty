require "rails_helper"

RSpec.describe FormMailer, type: :mailer do
  describe "contact" do
    let(:message) { 'Please provide info on SEO?' }
    let(:params) { {name: 'John Doe', company_name: 'JD Limited', email: 'john@pm.co.uk', phone: '1111100000',
                    category: 'SEO', message: message} }
    let(:mail) { FormMailer.contact(params) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pepperminty Limited: Contact Form")
      expect(mail.to).to eq(["info@pepperminty.co.uk"])
      expect(mail.from).to eq( Array(params[:email]) )
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Contact Form details")
      expect(mail.body.encoded).to match("Message: #{message}")
    end
  end

end
