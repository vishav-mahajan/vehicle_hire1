from django.shortcuts import render,redirect,HttpResponse
import authorize as au
from managerapp.models import VehicleCompany,VehiclesDetails,VehicleCategories
from front_app.models import MySiteUser,booking_details
from managerapp.forms import VehicleCategoryForm,VehicleCompanyForm,VehicleDetailsForm
from django.core.files.storage import FileSystemStorage
import datetime as dt
import math
from django.db.models import Sum

# Create your views here.

def business_index(request):
    try:

        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']

    except:
        return redirect("/login")
    if auth == True:
        return render(request, "manager.html")
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})

def vehicle_details(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']

    except:
        return redirect("/login")
    if auth == True:
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
                f.role_id = int(request.session['role_id'])
                f.save()
                return render(request, "vehicledetails.html",
                              {'valid': True, 'cd': companydata, "ccd": companycategorydata, 'yr': year})
            else:
                return render(request, "vehiclecategories.html", {'invalid': True})

        return render(request, "vehicledetails.html", {'cd': companydata, "ccd": companycategorydata, 'yr': year})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def showdata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']

    except:
        return redirect("/login")
    if auth == True :
        email = request.session['email']
        ccd = VehicleCategories.objects.all()
        userdata = VehiclesDetails.objects.filter(u_email=email)
        return render(request, "view_cars.html", {'ud': userdata, 'ccd': ccd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def delete_data(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']

    except:
        return redirect("/login")
    if auth == True :
        carid = request.GET['id']
        try:
            deleteUser = VehiclesDetails.objects.get(vehicle_ref_id=carid)
            if email == deleteUser.u_email:
                pass
            else:
                return redirect("/error")
            deleteUser.delete()
            if request.session['role_id'] == 4:
                return redirect("businessuserapp:showdata")
            else:
                return redirect("managerapp:showdata")

        except:
            pass
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def updatedata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)

        email = request.session['email']

    except:
        return redirect("/login")
    if auth == True :
        year = int(dt.datetime.now().strftime(" %Y "))
        companydata = VehicleCompany.objects.all()
        companycategorydata = VehicleCategories.objects.all()
        userdata = VehiclesDetails.objects.all()
        get_id = request.GET['id']
        userdata = VehiclesDetails.objects.get(vehicle_ref_id=get_id)
        if email == userdata.u_email:
            pass
        else:
            return redirect("/error")
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
                return redirect("/manager/show_other_vehicles")
        return render(request, "update_cars.html",
                      {'vd': userdata, 'yr': year, 'ccd': companycategorydata, 'cd': companydata})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def my_bookings(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']

    except:
        return redirect("/login")
    if auth==True:
        request.session['id'] = ""
        if request.session['role_id'] == 4 :
            book_id=[]
            bd = booking_details.objects.filter(seller_detail=email)
            curr_date=dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            curr_date = dt.datetime.now().strptime(curr_date,"%Y-%m-%d %H:%M:%S")
            for i in bd:
                end_date = i.end_date
                end_date=dt.datetime.strptime(end_date,"%Y-%m-%d %H:%M:%S")
                if curr_date > end_date:
                    book_id.extend([i.booking_id])
            if request.method == "POST":
                try:
                    sr = booking_details.objects.filter(invoice__icontains = request.POST['invoice'],seller_detail=email)
                    return render(request, "mybookings.html", {"bd": sr, "book_id": book_id})
                except:
                    pass

            return render(request, "mybookings.html", {"bd": bd,"book_id":book_id})
        else:
            return redirect("/error")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True,'login':True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def chkreturn(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']


    except:
        return redirect("/login")
    if auth==True:
        try:
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
                    return redirect("/businessuser/balance")

                return render(request,"chkreturn.html",{"bd":bd})
            else:
                return redirect("/error")
        except:
            return redirect("/error")


    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True,'login':True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})



def balance(request):

    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']


    except:
        return redirect("/login")
    if auth==True:
        try:
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
                    return redirect("/businessuser/mybookings")

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
        except:
            return  redirect("/error")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True,'login':True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def earnings(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'],4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth == True:
        total_earning = booking_details.objects.filter(seller_detail=email).aggregate(Sum("earnings"))
        total_fine = booking_details.objects.filter(seller_detail=email, cancellation_time="").aggregate(
            Sum("total_fine"))
        veh_amt = booking_details.objects.filter(seller_detail=email, cancellation_time="").aggregate(
            Sum("amount_exp"))
        cancel = booking_details.objects.filter(seller_detail=email, return_date="").aggregate(
            Sum("total_fine"))
        return render(request, "Bank_Balance.html",
                      {"earn": total_earning, "fine": total_fine, "amt": veh_amt, "cancel": cancel})

    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})



def active(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True:
        book_id=[]
        bd = booking_details.objects.filter(seller_detail=email, is_active=True)

        curr_date = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        curr_date = dt.datetime.now().strptime(curr_date, "%Y-%m-%d %H:%M:%S")
        for i in bd:
            end_date = i.end_date
            end_date = dt.datetime.strptime(end_date, "%Y-%m-%d %H:%M:%S")
            return_date = i.return_date
            try:
                return_date = dt.datetime.strptime(return_date, "%Y-%m-%d %H:%M:%S")
            except:
                return_date = "2001-01-01 00:00:00"
                return_date = dt.datetime.strptime(return_date, "%Y-%m-%d %H:%M:%S")

            if curr_date > end_date and i.is_active == True:
                book_id.extend([i.booking_id])
            if return_date > end_date:
                book_id.extend([i.booking_id])
        if request.method == "POST":
            try:
                sr = booking_details.objects.filter(invoice__icontains=request.POST['invoice'], seller_detail=email, is_active=True)
                return render(request, "active_bookings.html", {"bd": sr, "book_id": book_id})
            except:
                pass

        return render(request, "active_bookings.html", {"bd": bd, "book_id": book_id})

    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def cancelled(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True:
        if request.method == "POST":
            try:
                sr = booking_details.objects.filter(invoice__icontains=request.POST['invoice'], seller_detail=email, is_active=False, return_date = "" )
                return render(request, "cancelled_bookings.html", {"bd": sr})
            except:
                pass
        bd = booking_details.objects.filter(seller_detail=email, is_active=False, return_date = "" )
        return render(request,'cancelled_bookings.html',{'bd':bd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def completed(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'],4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth == True:
        if request.method == "POST":
            try:
                sr = booking_details.objects.filter(invoice__icontains=request.POST['invoice'], seller_detail=email, is_active=False, cancellation_time="")
                return render(request, "complete_bookings.html", {"bd": sr})
            except:
                pass
        bd = booking_details.objects.filter(seller_detail=email, is_active=False, cancellation_time="")
        return render(request, 'complete_bookings.html', {'bd': bd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})

def pending_refunds(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth == True:
        if request.method == "POST":
            try:
                sr = booking_details.objects.filter(invoice__icontains=request.POST['invoice'], seller_detail=email, is_active=False , refunded= False)
                return render(request, "pending_refunds.html", {"bd": sr})
            except:
                pass
        bd = booking_details.objects.filter(seller_detail=email, is_active=False , refunded= False)
        return render(request, 'pending_refunds.html', {'bd': bd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})


def refunded(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 4)
        email = request.session['email']
    except:
        return redirect("/login")
    if auth == True:

            id = request.GET['id']
            user=request.GET['user']
            bd = booking_details.objects.get(seller_detail=email, is_active=False , refunded= False, user_detail=user,invoice=id)
            update = booking_details(booking_id=bd.booking_id, refunded=True)
            update.save(update_fields=['refunded'])
            return redirect("/businessuser/pending_refunds")
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True,'login':True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})