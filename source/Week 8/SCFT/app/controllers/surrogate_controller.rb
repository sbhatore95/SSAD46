class SurrogateController < ApplicationController
#	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	def displaySurrogateInfo

	end
	
	#quality report
	def QualityReport
		
#		@rms = "#{Rails.root}/public/Qualityfiles/" + params[:rmscity] +".txt"
		render :text => params[:rmscity]
		#@ = Weatherdata.find_by upper(city): $rmscity
# 		send_file @rms
	end

	#epw files 
	def EPWfile

		@link = Cities.where("lower(city) =?" ,$icityname.downcase)
		
		render :text => @link.link
		

	end
end

