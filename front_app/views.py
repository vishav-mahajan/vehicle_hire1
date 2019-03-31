from django.shortcuts import render,HttpResponse,redirect
from front_app .forms import MySiteUserForm
from front_app .models import MySiteUser,User_role

def index(request):
    if (request.method == "POST"):
        useremail = request.POST['user_email']
        userpassword = request.POST['user_password']

        try:
            userdata = MySiteUser.objects.get(user_email=useremail)

            dp = userdata.user_password

            if (dp == userpassword):
                # return render(request,"login1.html")
                return redirect("/about/")

        except:
            return render(request,"login.html")
    return  render(request, "home_content.html")

def login(request):
    return render(request,"login.html")

def signup(request):
    if (request.method == "POST"):
            form = MySiteUserForm(request.POST)
            f1 = form.save(commit=False)
            f1.user_name = request.POST['user_name']
            f1.user_email = request.POST['user_email']
            f1.user_mobile = request.POST['user_mobile']
            f1.user_password = request.POST['user_password']

            f1.save()

            return render(request, "signup.html", {'inserted': True})

    return render(request, "signup.html")



def page_not_found(request):
    return render(request,"404.html")

def about(request):
    return render(request,"about.html")

def article(request):
    return render(request,"article.html")

def contact(request):
    return render(request,"contact.html")

def driver_page(request):
    return render(request,"driver.html")

def faq(request):
    return render(request,"faq.html")



def articled(request):
    return render(request,"article-details.html")

def index2(request):
    return render(request,"index2.html")

def index3(request):
    return render(request,"index3.html")

def register(request):
    return render(request,"register.html")

def package(request):
    return render(request,"package.html")

def services(request):
    return render(request,"services.html")

def help(request):
    return render(request,"help-desk.html")

def gallery(request):
    return render(request,"gallery.html")

