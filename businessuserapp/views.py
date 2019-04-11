from django.shortcuts import render,redirect,HttpResponse
import authorize as au
from managerapp.models import VehicleCompany,VehiclesDetails,VehicleCategories
from managerapp.forms import VehicleCategoryForm,VehicleCompanyForm,VehicleDetailsForm
from django.core.files.storage import FileSystemStorage

# Create your views here.



