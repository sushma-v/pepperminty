class PagesController < ApplicationController

  CATEGORIES = [["Website Design & Development", "1"],
                ["Search Engine Optimisation", "2"],
                ["Advertising", "3"],
                ["Social Media", "4"],
                ["Others", "5"]]

  def home
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

  def advertising
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
      FormMailer.contact(format_params).deliver
      flash[:notice] = "Your Query has been submitted, we will be in touch with you shortly"
    rescue StandardError => ex
      flash[:error] = ex.message
    end
    redirect_to contact_path
  end

  private

  def query_params
    params.permit(:name, :email, :company_name, :phone, :category, :message)
  end

  def format_params
    format_params = query_params
    format_params[:category] = CATEGORIES.to_h.key( query_params[:category] )
    format_params
  end
end
