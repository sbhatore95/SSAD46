from django.contrib import admin # type: ignore
from django.urls import path # type: ignore
from django.conf.urls import include # type: ignore
from .  import views

app_name = 'CFMaps'

urlpatterns = [
    path('CFMaps/index.html', views.index, name="index")
]