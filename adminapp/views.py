from django.shortcuts import render,HttpResponse,redirect
from adminapp .forms import MySite_AdminForm
from adminapp .models import MySite_Admin
from django.core.files.storage import FileSystemStorage
# Create your views here.

def index(request):
    return render(request,"index.html")


def signup(request):
    exobj=MySite_AdminForm()
    if (request.method=="POST"):
        user_image=None
        if request.FILES:

            myfile= request.FILES['image']
            fs=FileSystemStorage()
            filename= fs.save( myfile.name,myfile)
            fs.url(filename)
            user_image=myfile.name

        form=MySite_Admin(request.POST)
        if form.is_valid():

            f=form.save(commit=False)
            f.admin_email = request.POST['email']
            f.admin_image=user_image
            f.admin_name= request.POST['name']
            f.admin_password= request.POST['password']
            f.save()
            return render(request,"exclude_signup.html",{'inserted':True})

    return render(request,"exclude_signup.html",{'dictionary':exobj})

def signin(request):
    exobj=MySite_AdminForm()
    if (request.method=="POST"):
        user_image=None
        if request.FILES:

            myfile= request.FILES['image']
            fs=FileSystemStorage()
            filename= fs.save( myfile.name,myfile)
            fs.url(filename)
            user_image=myfile.name

        form=MySite_Admin(request.POST)
        if form.is_valid():

            f=form.save(commit=False)
            f.admin_email = request.POST['email']
            f.admin_image=user_image
            f.admin_name= request.POST['name']
            f.admin_password= request.POST['password']
            f.save()
            return render(request,"exclude_signin.html",{'inserted':True})

    return render(request,"exclude_signin.html",{'dictionary':exobj})

