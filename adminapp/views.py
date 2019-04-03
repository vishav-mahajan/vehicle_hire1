from django.shortcuts import render,HttpResponse,redirect
from adminapp .forms import MySite_AdminForm
from adminapp .models import MySite_Admin
from django.core.files.storage import FileSystemStorage
# Create your views here.

def index(request):
    return render(request,"managerindex.html")




