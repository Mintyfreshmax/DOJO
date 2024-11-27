class ClubsController < ApplicationController
  def show
    @clubs = Club.all
    @markers = @clubs.geocoded.map do |club|
      {
        lat: club.latitude,
        lng: club.longitude
      }
    end
  end
end
