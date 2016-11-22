class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @places = Place.all
    @user = current_user
  end
end
