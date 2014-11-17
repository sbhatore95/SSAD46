class SurrogateController < ApplicationController
#	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	@LINK = " "
	def displaySurrogateInfo

	end
	
	#quality report
	def QualityReport
		
		@rms = "#{Rails.root}/public/Qualityfiles/" + params[:value] +".txt"
		#render :text => params[:value]
		#@ = Weatherdata.find_by upper(city): $rmscity
 		send_file @rms
	end

	#epw files 
	def EPWfile
		@some = params[:value]
		@link = Cities.where("city =?", @some)
		@LINK = @link[0].link
		redirect_to @LINK
#	render :text => @link[0].link
		

	end
end

