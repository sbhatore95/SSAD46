class SurrogateController < ApplicationController
	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	def displaySurrogateInfo
	end
	
	#quality report
	def download 		
 		send_file "#{Rails.root}/public/EpwFiles/EGYPT.epw"
	end

	#epw files 
	def download1
		@link = Cities.find_by_sql("SELECT link FROM cities WHERE city = 'PUNTA ARENAS'" )
		render :text => @link
		

	end
end

