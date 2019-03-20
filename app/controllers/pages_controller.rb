class PagesController < ApplicationController

  CATEGORIES = [["Website Design & Development", "1"],
                ["Search Engine Optimisation", "2"],
                ["Paid Search", "3"],
                ["Social Media", "4"],
                ["Others", "5"]]

  def home
    @categories = CATEGORIES
    #user_id = "9484770394"
    #@instagram = Instagram.user_recent_media(user_id, {:count => 5})
  end

  def about
    @categories = CATEGORIES
  end

  def website
    @service = __method__.to_s
    @categories = CATEGORIES
  end

  def seo
    @service = __method__.to_s
    @categories = CATEGORIES
  end

  def paid_search
    @service = __method__.to_s
    @categories = CATEGORIES
  end

  def social
    @service = __method__.to_s
    @categories = CATEGORIES
  end

  def contact
    @categories = CATEGORIES
  end

  def privacy_policy
  end

  def cookie_policy
  end

  def submit_query
    begin
      if verify_recaptcha
        FormMailer.contact(format_params).deliver
        subscribe_to_mailing_list(format_params[:email], format_params[:name], format_params[:phone]) if params.fetch(:mailing_list, false)
        flash[:notice] = "Your Query has been submitted, we will be in touch with you shortly"
      end
    rescue StandardError => ex
      flash[:error] = ex.message
    end
    redirect_to contact_path
  end

  private

  def subscribe_to_mailing_list(email, name, phone)
    fname = name.split(' ').first
    lname = name.split[1..-1].join(' ')
    list_id = ENV["MAILCHIMP_LIST_ID"]

    @gb = Gibbon::Request.new
    @gb.lists(list_id).members.create(body: { email_address: email, status: 'subscribed',
                                                          merge_fields: {FNAME: fname, LNAME: lname, PHONE: phone}})
  end

  def query_params
    params.permit(:name, :email, :company_name, :phone, :category, :message, :mailing_list, "g-recaptcha-response")
  end

  def format_params
    format_params = query_params
    format_params[:category] = CATEGORIES.to_h.key( query_params[:category] )
    format_params
  end
end
