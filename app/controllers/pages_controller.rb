class PagesController < ApplicationController
  before_action :set_categories, except: [:privacy_policy, :cookie_policy, :submit_query]

  CATEGORIES = [["Website Design & Development", "1"],
                ["Search Engine Optimisation", "2"],
                ["Paid Search", "3"],
                ["Social Media", "4"],
                ["Others", "5"]]

  def home
    #user_id = "9484770394"
    #@instagram = Instagram.user_recent_media(user_id, {:count => 5})
  end

  def about
  end

  def website
    @service = __method__.to_s
  end

  def seo
    @service = __method__.to_s
  end

  def paid_search
    @service = __method__.to_s
  end

  def social
    @service = __method__.to_s
  end

  def contact
  end

  def privacy_policy
  end

  def cookie_policy
  end

  def submit_query
    begin
      if verify_recaptcha
        FormMailer.contact(format_params).deliver
        MailingList.subscribe(format_params[:email],
                              format_params[:name]) if params.fetch(:mailing_list, false)
        @message = "Thanks for your form submission a member of our team will be in touch soon!"
      end
    rescue StandardError => ex
      @message = ex.message
    end
  end

  private

  def query_params
    params.permit(:name, :email, :company_name, :phone, :category, :message, :mailing_list, "g-recaptcha-response")
  end

  def format_params
    format_params = query_params
    format_params[:category] = CATEGORIES.to_h.key( query_params[:category] )
    format_params
  end

  def set_categories
    @categories = CATEGORIES
  end
end
