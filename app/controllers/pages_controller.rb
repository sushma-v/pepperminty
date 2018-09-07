class PagesController < ApplicationController
  def home
  end

  def services
  end

  def contact
    @categories = [["Website Design & Development", 1],
                   ["Search Engine Optimisation", 2],
                   ["Advertising", 3],
                   ["Social Media", 4],
                   ["Others", 5]]
  end

  def submit_query
    Rails.logger.info("params #{query_params.to_json}")

    flash[:notice] = "Your Query has been submitted, we will be in touch with you shortly"
    redirect_to contact_path
  end

  private

  def query_params
    params.permit(:name, :email, :company_name, :phone, :category, :message)
  end
end
