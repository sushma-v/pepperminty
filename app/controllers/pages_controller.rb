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
end
