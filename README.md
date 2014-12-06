SSAD46
======

Monsoon 14


The Project name is Surrogate City Finder Tool. It is made as a part of SSAD(Structured Systems Analysis and Design)
course in IIIT Hyderabad. The project is essentially made for 'building science engineers and researchers' and for 
construction site planners. This web application helps in approximation of weather of any city based on the existing weather
data files.
    A 'weather data file' for a particular city contains extensive information about the weather of that city. Currently,
there are data files for over 2500 cities. User gives an input city and search parameters such as Latitude range, Altitude
range, Radius range, etc. Our application searches the database for the existence of weather data file of the input city.
It marks the searched cities on the map in an interactive manner. The searched cities are the ones which satisfy the 
input ranges and have weather datafiles. We provide the option for the user to download the file for the cities searched.
This way, the User uses the weather data file of the surrogate city to determine the weather of the city in question.
    Our application extensively uses Google Maps API to mark the cities on the map. We have used Ruby on Rails framework 
for the application.
