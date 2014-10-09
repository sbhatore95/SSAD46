class SearchController < ApplicationController
  def printvals
  	@cityname= params[:city]
	@lat= params[:latitude_range]
	@ele= params[:elevation_range]
	@rad= params[:radius_range]
	@results = Location.where(City: params[:city])
#  	render :text => cityname
#	render :text => @results.inspect
  end
end
