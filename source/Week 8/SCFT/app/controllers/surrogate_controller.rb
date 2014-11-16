class SurrogateController < ApplicationController
	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	def displaySurrogateInfo
	end
	
	#quality report
	def download 
		@rms = "#{Rails.root}/public/Qualityfiles/" + ":params[rms]" +".txt"
		#@file = Weatherdata.find_by upper(city): $rmscity
 		send_file @rms
	end

	#epw files 
	def download1

		@link = Cities.where("lower(city) =?" ,$icityname.downcase)
		
		render :text => @link.link
		

	end
end

