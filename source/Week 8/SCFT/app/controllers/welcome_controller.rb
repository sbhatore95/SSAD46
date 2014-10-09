class WelcomeController < ApplicationController
  def index
	   @results = Location.where(City: params[:city])
	   render: none

  end
end
