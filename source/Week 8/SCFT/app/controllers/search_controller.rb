class SearchController < ApplicationController

	$found = 0
	$lat= ""
	$long = ""
	$ilatitude_range= 0
	$ielevation_range= 0
	$imax = 0
	$imin = 0
	$iradius_range= 0
	$icityname = " "
	$ilatitude_mycity = 0
	$ilongitude_mycity = 0
	$ielevation_mycity = 1000
	

	def getsearchdata
	
			redirect_to :action => 'findSurrogateCity' ,:city => params[:city] ,:latitude_range => params[:latitude_range], :elevation_range => params[:elevation_range] ,:radius_range => params[:radius_range]
			
	end

	def findSurrogateCity


			
			$icityname= params[:city]
			$ilatitude_range= params[:latitude_range]
			$ielevation_range= params[:elevation_range]
			$iradius_range= params[:radius_range]

			$ilatitude_mycity = params[:latitude_mycity]
			$ilongitude_mycity = params[:longitude_mycity]

			require 'net/http'
			require 'json'
			@url = 'https://maps.googleapis.com/maps/api/elevation/json?locations=' + $ilatitude_mycity + ',' + $ilongitude_mycity
			url = URI.parse(@url)
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			request = Net::HTTP::Get.new(url.request_uri)
			res = http.request(request)
			res = JSON.parse(res.body)
			$ielevation_mycity = res['results'][0]['elevation']

		
		if Cities.exists?(city: $icityname)
 	
		 	#redirect_to :action => 'weather' ,:city => params[:city] ,:latitude_range => params[:lat], :elevation_range => params[:altrange] ,:radius => params[:radrange]
			$found = 1
		#If the city  exist in database 
		
		else
			#redirect_to :action => 'exists', :city => params[:city]
			$found = 0

		end 


		#get data from JS code of geocoder
			

			@city = $icityname
			@lat_range = $ilatitude_range
			@rad_range = $iradius_range
			@elev_range = $ielevation_range
	
		#set range
			@latitude_Range_Start = $ilatitude_mycity.to_f - $ilatitude_range.to_f
			@latitude_Range_End = $ilatitude_mycity.to_f + $ilatitude_range.to_f

		#@latresults = Location.where('Latitude > ? AND Latitude < ?',@latitude_Range_Start,@latitude_Range_End)

			@elevation_Range_Start = $ielevation_mycity.to_f - $ielevation_range.to_f
			@elevation_Range_End = $ielevation_mycity.to_f + $ielevation_range.to_f

			@results = Cities.where('latitude > ? AND latitude < ? AND elevation > ? AND elevation < ?',@latitude_Range_Start,@latitude_Range_End,@elevation_Range_Start, @elevation_Range_End)

	end

	def weather

		$icityname= params[:city]
		$ilatitude_range= params[:latitude_range]
		$ielevation_range= params[:elevation_range]
		$iradius_range= params[:radius_range]
		$ilatitude_mycity = params[:latitude_mycity]
		$ilongitude_mycity = params[:longitude_mycity]

		require 'net/http'
		require 'json'
		@url = 'https://maps.googleapis.com/maps/api/elevation/json?locations=' + $ilatitude_mycity + ',' + $ilongitude_mycity
		url = URI.parse(@url)
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url.request_uri)
		res = http.request(request)
		res = JSON.parse(res.body)
		$ielevation_mycity = res['results'][0]['elevation']

	end

=begin
	def exists
		@ecity = Cities.find_by(city: params[:city])
		@cityname = @ecity.city
		@citycountry = @ecity.country
		@cityelev = @ecity.elevation

		

	end
=end
end
			
			
