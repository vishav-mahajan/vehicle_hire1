from django.shortcuts import render,HttpResponse,redirect
from front_app .forms import MySiteUserForm,ContactForm,LoginDetailsForm
from front_app .models import MySiteUser,User_role,contact_us,login_details
from managerapp.models import VehiclesDetails,VehicleCategories,VehicleCompany
from django.core.files.storage import FileSystemStorage
from emailSend import email_send,otp_send
import authorize, otp_generation
import datetime as dt
from datetime import timedelta

def index(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    companydata = VehicleCompany.objects.all()
    companycategorydata = VehicleCategories.objects.all()
    userdata=VehiclesDetails.objects.all()
    return render(request,'index.html',{"ud":userdata,"cd":companydata,"ccd":companycategorydata,'su':siteuserdata})

def login(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    if(request.method == "POST"):
        useremail = request.POST['user_email']
        userpassword = request.POST['user_password']
        try:
            userdata = MySiteUser.objects.get(user_email=useremail)
            dp = userdata.user_password
            get_id = userdata.site_role_id_id
            if (dp == userpassword):
                request.session['authenticate'] = True
                request.session['email'] = useremail
                request.session['role_id'] = get_id
                form=LoginDetailsForm(request.POST)
                if form.is_valid():
                    f1 = form.save(commit=False)
                    f1.user_email = request.session['email']
                    f1.login_time = dt.datetime.now().strftime("%H:%M:%S")
                    f1.save()


                if get_id==1:
                    return redirect("/")
                if get_id==4:
                    return redirect("/")
                if get_id==3:
                    return redirect("/")
                if get_id==2:
                    return redirect("/master")
            else:
                return render(request, "login.html",{"pass2":True})
        except:
            return render(request, "login.html", {"pass1": True})
    return render(request,"login.html")

def logout(request):
    data=login_details.objects.latest("login_id")
    data.logout_time=dt.datetime.now().strftime( "%H:%M:%S")
    data.save()
    request.session['authenticate']=False
    return redirect("/login")


def signup(request):
    if (request.method == "POST"):
        user_image = None
        if request.FILES:
            myfile = request.FILES['user_image']  # type of file control name ??
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            fs.url(filename)
            user_image = myfile.name

        form = MySiteUserForm(request.POST)
        if form.is_valid():
            f1 = form.save(commit=False)
            f1.user_fname = request.POST['user_fname']
            f1.user_lname = request.POST['user_lname']
            f1.user_email = request.POST['user_email']
            f1.user_mobile = request.POST['user_mobile']
            f1.user_password = request.POST['user_password']
            f1.site_role_id_id=request.POST['select']
            f1.registered_on=dt.datetime.now().date()
            f1.user_image=user_image
            f1.user_gender=request.POST['user_gender']
            f1.user_dob=request.POST['user_dob']
            email_send(f1.user_email, f1.user_password)
            f1.save()

            return redirect("/login")
        else:
            return render(request, "register.html", {'invalid': True})
    return render(request, "register.html")


def page_not_found(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)

    return render(request,"404.html",{'su':siteuserdata})

def about(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    return render(request,"about.html",{'su':siteuserdata})

def contact(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    if (request.method == "POST"):
            form = ContactForm(request.POST)
            if form.is_valid():
                f1 = form.save(commit=False)
                f1.user_name = request.POST['user_name']
                f1.user_email = request.POST['user_email']
                f1.user_mobile = request.POST['user_mobile']
                f1.user_subject= request.POST['user_subject']
                f1.user_message=request.POST['user_message']
                f1.save()
                return render(request, "contact.html", {'valid': True},{'su':siteuserdata})
            else:
                return render(request, "contact.html", {'invalid': True},{'su':siteuserdata})
    return render(request, "contact.html",{'su':siteuserdata})


def faq(request):
    return render(request,"faq.html")


def help(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    return render(request,"help-desk.html",{'su':siteuserdata})

def master(request):
    return render (request,"master.html")
def car_detail(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    return render (request,"car-details.html",{'su':siteuserdata})

def updatepassword(request):
    if request.session['authenticate'] == True:
        email = request.session['email']
        userdata = MySiteUser.objects.get(user_email=email)
        if request.method=="POST":
            timedb = userdata.otp_time_generation
            get_time = dt.datetime.strptime(timedb, '%H:%M:%S').time()
            curr_time = dt.datetime.now().strftime("%H:%M:%S")
            get_otp = userdata.otp
            pw = userdata.user_password
            current_password=request.POST["password"]
            curr_otp=request.POST['curr_otp']
            interval= curr_time - get_time
            check="04:00:00"
            check=dt.datetime.now().strptime(check,"%H:%M:%S").time()
            if pw==current_password and get_otp==curr_otp and interval <= check:
                new_password=request.POST['new_password']
                update=MySiteUser(user_email=email,user_password=new_password)
                update.save(update_fields=["user_password"])
                return redirect("/logout")
            else:

                return render(request, "passwordupdate.html",{'valid':True} )
        else:
            otp, time = otp_generation.otpgenerate()
            update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
            update.save(update_fields=["otp", "otp_time_generation"])
            otp_send(email, otp, "Change Password", "Change Password")

    else:
        return redirect("/login")
    return render(request,"passwordupdate.html")
