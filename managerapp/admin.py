from django.contrib import admin
from managerapp.models import VehicleCompany,VehiclesDetails,VehicleCategories
# Register your models here.
admin.site.register(VehiclesDetails)
admin.site.register(VehicleCategories)
admin.site.register(VehicleCompany)