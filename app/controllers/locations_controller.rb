require 'faraday'

class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
    query = search_params[:address].gsub(' ', '+')
    conn = Faraday.new(:url => 'https://maps.googleapis.com')
    response = conn.get "maps/api/geocode/json?address=#{query}&key=#{ENV["GOOGLE_API"]}"
    response = JSON.parse(response.body)

    unless response["results"].empty?
      address = response["results"][0]["formatted_address"]
      longitude = response["results"][0]["geometry"]["location"]["lng"].to_f
      latitude = response["results"][0]["geometry"]["location"]["lat"].to_f

      @location = Location.new(address: address, longitude: longitude, latitude: latitude)

      if @location.save
        redirect_to locations_path
      end
    else
      flash[:error] = response["status"] if response["status"] == "ZERO RESULTS"
      flash[:error] = response["error_message"] if response["status"] == "INVALID_REQUEST"

      redirect_to locations_path
    end
  end

  private

  def search_params
    params.require(:location)
  end
end
