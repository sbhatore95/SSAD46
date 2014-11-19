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
		
		$latitude = 0
		$longitude = 0
		
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
        @any1 = Cities.where('lower(city) = ?' , $icity.downcase).first
        $latitude = @any1.latitude
        $longitude = @any1.longitude
        require 'net/http'
			require 'json'
			@url = 'https://maps.googleapis.com/maps/api/elevation/json?locations=' + $latitude.to_s + ',' + $longitude.to_s
			url = URI.parse(@url)
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			request = Net::HTTP::Get.new(url.request_uri)
			res = http.request(request)
			res = JSON.parse(res.body)
			$elevation = res['results'][0]['elevation']
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

