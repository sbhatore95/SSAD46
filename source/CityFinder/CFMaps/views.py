from django.shortcuts import render


def index(request):
  render(request, 'CFMaps/index.html')
