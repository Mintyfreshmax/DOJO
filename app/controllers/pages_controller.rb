class PagesController < ApplicationController
  def home
    redirect_to activities_path if user_signed_in?
  end
end
