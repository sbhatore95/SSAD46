class SearchController < ApplicationController
  def printvals
  	cityname= params[:city]
  	render :text => cityname
  end
end
