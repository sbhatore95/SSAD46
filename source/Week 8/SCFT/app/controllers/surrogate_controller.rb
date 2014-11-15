class SurrogateController < ApplicationController
	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	def displaySurrogateInfo
	end
	
	def download 		
 		send_file "#{Rails.root}/public/EpwFiles/EGYPT.epw"
	end
end

