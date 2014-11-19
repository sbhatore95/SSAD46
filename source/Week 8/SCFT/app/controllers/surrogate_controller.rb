class SurrogateController < ApplicationController
#	@EPW_PATH = File.join(Rails.root, "public", "EpwFiles")
	@LINK = " "
	$icity = ""
	
	def displaySurrogateInfo
		$icity = params[:rmscity]
		$city = params[:city]
		$lat = params[:lat]
		$lon = params[:lon]
		$elev = params[:elev]
		#render :text => $city

		@arr ||= []
        require 'nokogiri'
        require 'open-uri'
        vari = $icityname.gsub(' ', '_')
      	@wikilink='http://en.wikipedia.org/wiki/' + vari
        doc = Nokogiri::HTML(open(@wikilink))
        doc.xpath("//table[@class='wikitable collapsible']").each do |row|
            @arr << row.text
        end
        
        $hello=$icity
        @any = Weatherdata.where('lower(city) = ?' , $hello.downcase).first
        any = @any
		@matter = [any.city,any.mjan,any.mfeb,any.mmar,any.mapr,any.mmay,any.mjun,any.mjul,any.maug,any.msep,any.moct,any.mnov,any.mdec,any.njan,any.nfeb,any.nmar,any.napr,any.nmay,any.njun,any.njul,any.naug,any.nsep,any.noct,any.nnov,any.ndec]
	end
	
	#quality report
	def QualityReport
		name = Weatherdata.where("lower(city)=?",$icity.downcase).first

		@rms = "#{Rails.root}/public/Qualityfiles/" + name.city + ".txt"
		send_file @rms
	end

	#epw files 
	def EPWfile
		@some = $icity
		@link = Cities.where("lower(city) =?", @some.downcase)
		@LINK = @link[0].link
		redirect_to @LINK
#	render :text => @link[0].link
		

	end
end

