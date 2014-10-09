class SearchController < ApplicationController
  def printvals
  	@cityname= params[:city]
#  	render :text => cityname
	render :text => @cityname.inspect
  end
end
