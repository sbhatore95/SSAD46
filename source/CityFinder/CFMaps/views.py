from django.shortcuts import render
from .models import City

class CFMaps:
  flag = True

  def __init__(self):
    pass
  
  def getLatLong(self, cityname):
     dictLL = {}
     city1 = City.objects.get(cityname=cityname)
     dictLL['lat'] = city1.lat
     dictLL['lng'] = city1.long
     return dictLL
  
  def parse_csv(self):
    if flag:
        f = open('./static/files/cities.csv', 'r')
        line = f.readline()
        line = f.readline()
        cityname = ""
        lat = ""
        long = ""
        while line != "":
            lineSplit = line.split(',')
            cityname = lineSplit[1]
            lat = lineSplit[9]
            long = lineSplit[10]
            if (flag):
                q = City.objects.create(lat=lat, long=long, cityname=cityname)
                q.save()
            line = f.readline()
        f.close()
        if (flag):
            flag = False
    else:
       pass
    return


def get_params(request, keys):
  params = {}
  for key in keys:
    params[key] = request.GET.get(key)
  return params


def check_empty(params, key):
  return ((params[key] == None) or (params[key] == ""))


def index(request):
  if request.method == "GET":
    cfmap1 = CFMaps()
    cfmap1.parse_csv()
    params = get_params(request, ['cityname', 'lat_range', 'alt'])
    context = {}
    latlng = {}
    if check_empty(params, 'cityname'):
        pass
    else:
        latlng = cfmap1.getLatLong(params['cityname'])
        context = {'data': params, 'latlng': latlng}
    return render(request, 'CFMaps/index.html', {})
