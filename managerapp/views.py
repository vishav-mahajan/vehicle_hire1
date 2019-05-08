from django.shortcuts import render,redirect
import datetime as dt
import authorize as au
from managerapp.models import VehicleCompany,VehicleCategories,VehiclesDetails
from front_app.models import MySiteUser,booking_details
from front_app.forms import BookingForm
from django.core.files.storage import FileSystemStorage
from managerapp.forms import VehicleCategoryForm, VehicleCompanyForm, VehicleDetailsForm
import math
from django.db.models import Sum
from django.db.models import Q

# Create your views here.
def manager_index(request):

    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        return render(request,"manager.html",{"su":siteuserdata})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def business_index(request):
    try:

        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        return render(request,"manager.html",{'su':siteuserdata})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})









def vehicle_company(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
            try:
                if (request.method == "POST"):
                    form = VehicleCompanyForm(request.POST)
                    if form.is_valid():
                        f1 = form.save(commit=False)
                        f1.company_name = (request.POST['company_name']).capitalize()
                        f1.save()
                        return render(request, "vehiclecompanies.html", {'valid': True})
                    else:
                        return render(request, "vehiclecompanies.html", {'invalid': True})
                return render(request, "vehiclecompanies.html")
            except:
                return render(request, "vehiclecompanies.html", {'exist': True})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})





def vehicle_details(request):


    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        year = int(dt.datetime.now().strftime(" %Y "))
        get_role = request.session['role_id']
        get_email = request.session['email']
        companydata = VehicleCompany.objects.all()
        companycategorydata = VehicleCategories.objects.all()
        userdata = VehiclesDetails.objects.all()
        if get_role == 4:
            for i in userdata:
                if get_email == i.u_email:
                    return redirect("/businessuser/showdata")
        if request.method == "POST":
            user_image = None
            if request.FILES:
                myfile = request.FILES['vehicle_image']  # type of file control name ??
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                fs.url(filename)
                user_image = myfile.name

            form = VehicleDetailsForm(request.POST)
            if form.is_valid():
                f = form.save(commit=False)
                f.vehicle_name = request.POST['vehicle_name']
                f.u_email = request.session['email']
                f.vehicle_id_id = request.POST['veh_id']
                f.company_id_id = request.POST['sel']
                f.vehicle_description = request.POST['vehicle_description']
                f.vehicle_price = request.POST['vehicle_price']
                f.vehicle_model = request.POST['vehicle_model']
                f.abs = request.POST['abs']
                f.transmission = request.POST['transmission']
                f.airbags = request.POST['airbags']
                f.seats = request.POST['seats']
                # f.vehicle_price= int(f.vehicle_price) + int(base_price)
                f.vehicle_image = user_image
                f.save()
                return render(request, "vehicledetails.html",
                              {'valid': True, 'cd': companydata, "ccd": companycategorydata, 'yr': year})
            else:
                return render(request, "vehiclecategories.html", {'invalid': True})

        return render(request, "vehicledetails.html", {'cd': companydata, "ccd": companycategorydata, 'yr': year})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})



def showdata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        email = request.session['email']
        ccd = VehicleCategories.objects.all()
        userdata = VehiclesDetails.objects.filter(u_email=email)
        return render(request, "view_cars.html", {'ud': userdata, 'ccd': ccd})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})


def delete_data(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        carid = request.GET['id']
        try:
            deleteUser = VehiclesDetails.objects.get(vehicle_ref_id=carid)
            deleteUser.delete()
            if request.session['role_id'] == 4:
                return redirect("businessuserapp:showdata")
            else:
                return redirect("managerapp:showdata")

        except:
            pass
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})


def updatedata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        year = int(dt.datetime.now().strftime(" %Y "))
        companydata = VehicleCompany.objects.all()
        companycategorydata = VehicleCategories.objects.all()
        userdata = VehiclesDetails.objects.all()
        get_id = request.GET['id']
        userdata = VehiclesDetails.objects.get(vehicle_ref_id=get_id)
        if request.method == "POST":
            user_image = userdata.vehicle_image
            if request.FILES:
                myfile = request.FILES['vehicle_image']
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                fs.url(filename)
                user_image = myfile.name

            name = (request.POST["vehicle_name"]).capitalize()
            model = request.POST['vehicle_model']
            price = request.POST['vehicle_price']
            desc = request.POST["vehicle_description"]
            image = user_image

            update = VehiclesDetails(vehicle_ref_id=get_id, vehicle_name=name, vehicle_description=desc,
                                     vehicle_image=image, vehicle_price=price, vehicle_model=model)
            update.save(update_fields=["vehicle_name", "vehicle_description", "vehicle_image", "vehicle_price",
                                       "vehicle_model"])
            if request.session['role_id'] == 4:
                return redirect("businessuserapp:showdata")
            else:
                return redirect("managerapp:showdata")
        return render(request, "update_cars.html",
                      {'vd': userdata, 'yr': year, 'ccd': companycategorydata, 'cd': companydata})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def my_bookings(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        if request.session['role_id'] == 1 :
            book_id=[]
            try:
                if request.method == "POST":
                    sr = booking_details.objects.filter(invoice__icontains=request.POST['search'])
                    return render(request, "mybookings.html", {"bd": sr, "book_id": book_id})
            except:
                pass

            bd = booking_details.objects.filter(seller_detail=email)

            curr_date=dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            curr_date = dt.datetime.now().strptime(curr_date,"%Y-%m-%d %H:%M:%S")
            for i in bd:
                end_date = i.end_date
                end_date=dt.datetime.strptime(end_date,"%Y-%m-%d %H:%M:%S")
                return_date=i.return_date
                try:
                    return_date=dt.datetime.strptime(return_date,"%Y-%m-%d %H:%M:%S")
                except:
                    return_date="2001-01-01 00:00:00"
                    return_date = dt.datetime.strptime(return_date, "%Y-%m-%d %H:%M:%S")

                if curr_date > end_date and i.is_active==True:
                    book_id.extend([i.booking_id])
                if return_date > end_date:
                    book_id.extend([i.booking_id])

            return render(request, "mybookings.html", {"bd": bd,"book_id":book_id})
        else:
            return redirect("/error")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def chkreturn(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)

    except:
        return redirect("/login")
    if auth==True:
        id=request.GET['id']
        bd=booking_details.objects.get(invoice=id)
        curr_date = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        curr_date = dt.datetime.now().strptime(curr_date, "%Y-%m-%d %H:%M:%S")
        end_date = bd.end_date
        end_date = dt.datetime.now().strptime(end_date, "%Y-%m-%d %H:%M:%S")
        if request.session['email'] == bd.seller_detail:

            if request.method == "POST":

                if request.POST['documents']== "no":
                    fine = request.POST['fine']
                    is_fine=True
                else:
                    fine=0
                    is_fine=False


                if request.POST['damage']== "damage":
                    if request.POST['covered']=="notcovered":
                        damage_amount=request.POST['damage_amount']
                    else:
                        damage_amount=1000
                else:
                    damage_amount=0

                if request.POST["exceed"] == "1" and curr_date > end_date:
                    duration =float((curr_date - end_date).total_seconds() / 3600)
                    if duration > 0.5:
                        duration=math.ceil(duration)
                    else:
                        duration=math.floor(duration)
                else:
                    duration=0


                update = booking_details(booking_id=bd.booking_id, is_fine=is_fine, fine_amount=fine, damage_amount=damage_amount, extension=duration)
                update.save(update_fields=["is_fine", "fine_amount" ,"damage_amount", "extension"])
                request.session['id']=id
                return redirect("/manager/balance")

            return render(request,"chkreturn.html",{"bd":bd})
        else:
            return redirect("/error")

    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})



def balance(request):

    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)

    except:
        return redirect("/login")
    if auth==True:

        bd=booking_details.objects.get(invoice=request.session['id'])
        if bd.seller_detail==email:
            excess_amount=bd.extension*4*bd.vehicle_info.vehicle_price
            total_fine = bd.fine_amount + bd.damage_amount + bd.extension*4*bd.vehicle_info.vehicle_price
            security=bd.security_amount
            return_date = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            return_date = dt.datetime.now().strptime(return_date, "%Y-%m-%d %H:%M:%S")
            if request.method == "POST":
                update = booking_details(booking_id=bd.booking_id, is_active=False, return_date=return_date,is_returned=True,cancel_token="")
                update.save(update_fields=["is_active", "is_returned", "cancel_token", "return_date"])
                return redirect("/manager/mybookings")

            if total_fine> security:
                pay=total_fine-security
                earnings=bd.total + pay
                update = booking_details(booking_id=bd.booking_id, ext_amount=excess_amount, balance_amount=pay,total_fine=total_fine,earnings=earnings)
                update.save(update_fields=["ext_amount", "total_fine","balance_amount","earnings"])
            else:
                mgr_pay = security - total_fine
                earnings = bd.total - mgr_pay
                update = booking_details(booking_id=bd.booking_id, ext_amount=excess_amount, balance_amount=mgr_pay,total_fine=total_fine,earnings=earnings)
                update.save(update_fields=["ext_amount", "total_fine","balance_amount","earnings"])

            bd = booking_details.objects.get(invoice=request.session['id'])


            return render (request,"balance.html",{"bd":bd,"ea":excess_amount})
        else:
            return redirect("/error")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def earnings(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True :
        total_earning = booking_details.objects.filter(seller_detail=email).aggregate(Sum("earnings"))
        total_fine = booking_details.objects.filter(seller_detail=email,cancellation_time="").aggregate(Sum("total_fine"))
        veh_amt = booking_details.objects.filter(seller_detail=email, cancellation_time="").aggregate(Sum("amount_exp"))
        cancel = booking_details.objects.filter(seller_detail=email, return_date="").aggregate(Sum("total_fine"))
        return render (request,"Bank_Balance.html",{"earn":total_earning,"fine":total_fine,"amt":veh_amt,"cancel":cancel})

    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})

def show_other(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True and request.session["role_id"]==1 :
        ccd=VehicleCategories.objects.all()
        ud=VehiclesDetails.objects.filter(~Q(u_email = email))
        return render(request, "view_cars.html", {'ud': ud, 'ccd': ccd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def search(request):
    if request.method=="POST":
        sr= booking_details.objects.filter(invoice__icontains=request.POST['search'])
        return render(request, "mybookings.html", {"bd": sr})