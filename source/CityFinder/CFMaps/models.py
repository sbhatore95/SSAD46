from django.db import models


class City(models.Model):
    uid = models.IntegerField(auto_created=True, unique=True)
    lat = models.CharField(max_length=10)
    long = models.CharField(max_length=10)
    cityname = models.CharField(max_length=20)
