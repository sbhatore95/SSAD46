from django.shortcuts import render
from .models import City

class CFMaps:
  flag = True

  def __init__(self):
    pass
  
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


def check_empty(params):
  return ((params["cityname"] == None) or (params["cityname"] == ""))


def index(request):
  if request.method == "GET":
    cfmap1 = CFMaps()
    cfmap1.parse_csv()
    params = get_params(request, ['cityname', 'lat_range', 'alt'])
    context = {}
    if check_empty(params):
        pass
    else:
        context = {'data': params}
    return render(request, 'CFMaps/index.html', context)
