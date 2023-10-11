class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to categories_path
    else
      puts "Not signed in - redirecting to root_url"
    end
  end
end
