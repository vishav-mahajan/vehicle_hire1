from django.shortcuts import render,HttpResponse,redirect
from front_app .forms import MySiteUserForm
from front_app .models import MySiteUser,User_role

def index(request):

    return  render(request, "index.html")

def login(request) :
    if ( request.method == "POST" ):
        useremail = request.POST['user_email']
        userpassword = request.POST['user_password']

        try:
            userdata = MySiteUser.objects.get(user_email=useremail)

            dp = userdata.user_password

            if (dp == userpassword):
                # return render(request,"login1.html")
                return redirect("/about/")

        except:
            return render(request,"404.html")
    return render(request,"login.html")
def admin_login(request) :
    if ( request.method == "POST" ):
        useremail = request.POST['user_email']
        userpassword = request.POST['user_password']

        try:
            userdata = MySiteUser.objects.get(user_email=useremail)

            dp = userdata.user_password

            if (dp == userpassword):
                # return render(request,"login1.html")
                return redirect("/about/")

        except:
            return render(request,"404.html")
    return render(request,"admin_login.html")

def signup(request):
    if (request.method == "POST"):
            form = MySiteUserForm(request.POST)
            f1 = form.save(commit=False)
            f1.user_name = request.POST['user_name']
            f1.user_email = request.POST['user_email']
            f1.user_mobile = request.POST['user_mobile']
            f1.user_password = request.POST['user_password']
            f1.site_role_id_id=1
            f1.save()

            return render(request, "login.html", {'inserted': True})

    return render(request, "signup.html")



def page_not_found(request):
    return render(request,"404.html")

def about(request):
    return render(request,"about.html")


def contact(request):
    return render(request,"contact.html")

def driver_page(request):
    return render(request,"driver.html")

def faq(request):
    return render(request,"faq.html")


def register(request):
    return render(request,"register.html")

def package(request):
    return render(request,"package.html")



def help(request):
    return render(request,"help-desk.html")

def gallery(request):
    return render(request,"gallery.html")

def master(request):
    return render (request,"master.html")
def car_detail(request):
    return render (request,"car-details.html")

