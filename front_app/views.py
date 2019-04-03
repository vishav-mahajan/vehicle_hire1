from django.shortcuts import render,HttpResponse,redirect
from front_app .forms import MySiteUserForm
from front_app .models import MySiteUser,User_role

def index(request):

    return  render(request, "index.html")

def login(request):
    if(request.method == "POST"):
        useremail = request.POST['user_email']
        userpassword = request.POST['user_password']
        try:
            userdata = MySiteUser.objects.get(user_email=useremail)
            dp = userdata.user_password
            get_id = userdata.site_role_id_id
            if (dp == userpassword):
                if get_id==1:
                    return redirect("/manager/")
                if get_id==4:
                    return redirect("/contact/")
                if get_id==3:
                    return redirect("/package/")
                if get_id==2:
                    return redirect("/master/")
            else:
                return render(request, "login.html",{"pass2":True})
        except:
            return render(request, "login.html", {"pass1": True})
    return render(request,"login.html")


def signup(request):
    if (request.method == "POST"):
            form = MySiteUserForm(request.POST)
            if form.is_valid():
                f1 = form.save(commit=False)
                f1.user_name = request.POST['user_name']
                f1.user_email = request.POST['user_email']
                f1.user_mobile = request.POST['user_mobile']
                f1.user_password = request.POST['user_password']
                f1.site_role_id_id=request.POST['sel']
                f1.save()
                return render(request, "login.html", {'valid': True})
            else:
                return render(request, "register.html", {'invalid': True})
    return render(request, "register.html")


def page_not_found(request):
    return render(request,"404.html")

def about(request):
    return render(request,"about.html")

def contact(request):
    return render(request,"contact.html")

def faq(request):
    return render(request,"faq.html")

def register(request):
    return render(request,"register.html")

def help(request):
    return render(request,"help-desk.html")

def master(request):
    return render (request,"master.html")
def car_detail(request):
    return render (request,"car-details.html")

