from django.shortcuts import render, HttpResponse, redirect
from front_app.forms import MySiteUserForm,BookingForm, ContactForm, LoginDetailsForm
from front_app.models import MySiteUser, User_role, contact_us, login_details, booking_details
from managerapp.models import VehiclesDetails, VehicleCategories, VehicleCompany
from django.core.files.storage import FileSystemStorage
from emailSend import email_send, otp_send
import authorize as au, otp_generation
import datetime as dt
from datetime import timedelta
import random
from django.contrib.auth.hashers import make_password, check_password
from django.db.models import Q



def index(request):

    request.session['date_greater'] = False
    request.session['duration'] = False
    companydata = VehicleCompany.objects.all()
    companycategorydata = VehicleCategories.objects.all()
    vehicle_id = []
    userdata = VehiclesDetails.objects.filter(~Q(vehicle_ref_id__in=(vehicle_id)))
    try:
        email = request.session['email']
        try:
            if request.method == "POST":
                start_date = request.POST['start_date']
                end_date = request.POST['end_date']
                start_date = dt.datetime.strptime(start_date, '%Y-%m-%d %H:%M:%S')
                end_date = dt.datetime.strptime(end_date, '%Y-%m-%d %H:%M:%S')

                bookingdata = booking_details.objects.all()
                for i in bookingdata:
                    db_sdate = dt.datetime.strptime(str(i.start_date), '%Y-%m-%d %H:%M:%S')
                    dbend_date = dt.datetime.strptime(str(i.end_date), '%Y-%m-%d %H:%M:%S')
                    if i.is_active==True:
                        if start_date < db_sdate  and end_date < db_sdate and float((db_sdate - end_date).total_seconds()/3600) > float(8)  :
                            pass
                        elif start_date > dbend_date and end_date > dbend_date and float((start_date - dbend_date).total_seconds()/3600) > float(8) :
                            pass
                        else:
                            vehicle_id.extend([i.vehicle_info_id])
                    else:
                        pass
                userdata = VehiclesDetails.objects.filter(~Q(vehicle_ref_id__in=(vehicle_id)))
                return render(request, 'index.html',
                              {"ud": userdata, "cd": companydata, "ccd": companycategorydata,
                               "book": True,
                               "sd": request.POST['start_date'], "ed": request.POST['end_date'], "try": "try inner","slide":True})
            return render(request, 'index.html',
                          {"ud": userdata, "cd": companydata, "ccd": companycategorydata,
                           "try": "try outer"})
        except:
            return render(request, 'index.html',
                         {"ud": userdata, "cd": companydata, "ccd": companycategorydata,
                           'exp': 'ex inner'})
    except:
        return render(request, 'index.html',
                      {"ud": userdata, "cd": companydata, "ccd": companycategorydata, 'exp': 'exp outer'})


def login(request):
    if (request.method == "POST"):
        try:
            useremail = request.POST['user_email']
            userpassword = request.POST['user_password']
            userdata = MySiteUser.objects.get(user_email=useremail)
            verified = userdata.user_isverified
            dp = userdata.user_password
            mob = str(userdata.user_mobile)
            authtoken = userdata.user_token
            get_id = userdata.site_role_id_id
            if check_password(userpassword, dp):
                if verified == False and authtoken == "":
                    rn = random.randint(100000, 10000000)
                    token = useremail[0:5] + str(rn) + mob[5:10]
                    verify = "http://127.0.0.1:8000/dskjgheriugiurefhkusdjdowieuqhiurehf?email=" + useremail + "&token=" + token
                    email_send(useremail, userpassword, verify)
                    update = MySiteUser(user_email=useremail, user_token=token)
                    update.save(update_fields=["user_token"])
                    return render(request, "login.html", {'login': True, "vl": True})


                elif verified == True:
                    request.session['authenticate'] = True
                    request.session['email'] = useremail
                    request.session['role_id'] = get_id
                    request.session['name']=userdata.user_fname+" "+userdata.user_lname
                    request.session['rolename']=userdata.site_role_id.role_name
                    request.session["image"]=userdata.user_image
                    form = LoginDetailsForm(request.POST)
                    if form.is_valid():
                        f1 = form.save(commit=False)
                        f1.user_email = request.session['email']
                        f1.login_time = dt.datetime.now().strftime("%H:%M:%S")
                        f1.save()
                    if get_id == 1:
                        return redirect("/")
                    if get_id == 4:
                        return redirect("/")
                    if get_id == 3:
                        return redirect("/")
                    if get_id == 2:
                        return redirect("/superuser")
                else:
                    return render(request, "login.html", {'login': True, "vf": True})

            else:
                return render(request, "login.html", {"pass2": True, 'login': True}, )
        except:
            return render(request, "login.html", {"pass1": True, 'login': True})
    return render(request, "login.html", {'login': True})


def logout(request):
    data = login_details.objects.latest("login_id")
    data.logout_time = dt.datetime.now().strftime("%H:%M:%S")
    data.save()
    request.session['authenticate'] = False
    request.session['role_id']=""
    request.session['email']=""
    request.session['duration'] = False
    request.session['date_greater'] = False
    request.session['name'] = ""
    request.session['rolename'] = ""
    request.session["image"] = ""
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
        try:
            emailid = request.POST['user_email']
            data = MySiteUser.objects.get(user_email=emailid)
            return render(request, "register.html", {'invalid': True})

        except:
            pass

        form = MySiteUserForm(request.POST)
        if form.is_valid():
            f1 = form.save(commit=False)
            # return render(request,"abcd.html")
            f1.user_fname = (request.POST['user_fname']).capitalize()
            f1.user_lname = (request.POST['user_lname']).capitalize()
            f1.user_email = request.POST['user_email']
            f1.user_mobile = request.POST['user_mobile']
            f1.user_password = make_password(request.POST['user_password'])
            f1.site_role_id_id = request.POST['select']
            f1.registered_on = dt.datetime.now().date()
            f1.user_image = user_image
            f1.user_gender = request.POST['user_gender']
            f1.user_dob = request.POST['user_dob']
            rn = random.randint(100000, 10000000)
            token = request.POST['user_email'][0:5] + str(rn) + str(request.POST['user_mobile'][5:10])
            f1.user_token = token
            verify = "http://127.0.0.1:8000/dskjgheriugiurefhkusdjdowieuqhiurehf?email=" + request.POST[
                'user_email'] + "&token=" + token
            email_send(f1.user_email, request.POST['user_password'], verify)
            f1.save()
            return redirect("/login")
        else:
            return render(request, "register.html", {'invalid': True})
    return render(request, "register.html")


def page_not_found(request):

    return render(request, "404.html")


def about(request):
    try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
        return render(request, "about.html", {'su': siteuserdata})
    except:
        return render(request, "about.html")


def contact(request):

        if (request.method == "POST"):
            form = ContactForm(request.POST)
            if form.is_valid():
                f1 = form.save(commit=False)
                f1.user_name = (request.POST['user_name']).capitalize()
                f1.user_email = request.POST['user_email']
                f1.user_mobile = request.POST['user_mobile']
                f1.user_subject = request.POST['user_subject']
                f1.user_message = request.POST['user_message']
                f1.save()
                return render(request, "contact.html", {'valid': True})
            else:
                return render(request, "contact.html", {'invalid': True})
        return render(request, "contact.html", {})



def faq(request):
    return render(request, "faq.html")


def help(request):
        return render(request, "help-desk.html")


def master(request):
    return render(request, "master.html")


def car_detail(request):
    try:
        email = request.session['email']
        id=request.GET['id']
        siteuserdata = MySiteUser.objects.get(user_email=email)
        vd = VehiclesDetails.objects.get(vehicle_ref_id=id)
        return render(request, "car-details.html", {'su': siteuserdata,"vd":vd})

    except:
        id = request.GET['id']
        vd = VehiclesDetails.objects.get(vehicle_ref_id=id)
        return render(request, "car-details.html",{"vd":vd})


def updatepassword(request):
    if request.session['authenticate'] == True:
        email = request.session['email']
        userdata = MySiteUser.objects.get(user_email=email)
        pw = userdata.user_password
        timedb = userdata.otp_time_generation

        if request.method == "POST":
            get_time = dt.datetime.strptime(timedb, '%Y-%m-%d %H:%M:%S.%f')
            curr_time = dt.datetime.now()
            interval = curr_time - get_time
            interval = float(interval.total_seconds())
            limit = float(14400)
            get_otp = userdata.otp
            pw = userdata.user_password
            current_password = request.POST["password"]
            curr_otp = request.POST['curr_otp']

            if pw == current_password and get_otp == curr_otp and interval < limit:
                new_password = make_password(request.POST['new_password'])
                otp = ""
                otpgrn = ""
                update = MySiteUser(user_email=email, user_password=new_password, otp=otp, otp_time_generation=otpgrn)
                update.save(update_fields=["user_password", "otp", "otp_time_generation"])
                return redirect("/logout")
            elif get_otp != curr_otp:
                return render(request, "passwordupdate.html", {'invalidotp': True, })
            elif pw != current_password:
                return render(request, "passwordupdate.html", {'invalidpwd': True, })
            elif interval > limit:
                return render(request, "passwordupdate.html", {'invalidtime': True, })
        else:
            if timedb == "":
                otp, time = otp_generation.otpgenerate()
                update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                update.save(update_fields=["otp", "otp_time_generation"])
                otp_send(email, otp, "Change Password", "Change Password", "OTP")
            else:
                get_time = dt.datetime.strptime(timedb, '%Y-%m-%d %H:%M:%S.%f')
                curr_time = dt.datetime.now()
                interval = curr_time - get_time
                interval = float(interval.total_seconds())
                limit = float(14400)
                if interval > limit:
                    otp, time = otp_generation.otpgenerate()
                    update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                    update.save(update_fields=["otp", "otp_time_generation"])
                    otp_send(email, otp, "Change Password", "Change Password", "OTP")
    else:
        return redirect("/login")
    return render(request, "passwordupdate.html")


def forgototp(request):
    if request.method == "POST":
        try:
            email = request.POST['user_email']
            userdata = MySiteUser.objects.get(user_email=email)
            timedb = userdata.otp_time_generation
            otp_gen = request.POST["otp_gen"]
            if email == userdata.user_email and otp_gen != "":
                otp = userdata.otp
                get_time = dt.datetime.strptime(timedb, '%Y-%m-%d %H:%M:%S.%f')
                curr_time = dt.datetime.now()
                interval = curr_time - get_time
                interval = float(interval.total_seconds())
                limit = float(14400)
                if otp == otp_gen and interval < limit:
                    pwd = make_password(request.POST["new_password"])
                    update = MySiteUser(user_email=email, user_password=pwd, otp="", otp_time_generation="")
                    update.save(update_fields=["user_password", "otp", "otp_time_generation"])
                    otp_send(email, request.POST["new_password"], "Password Changed", "Updated Password", "Password")
                    return redirect("/logout")
                else:
                    return render(request, "login.html", {'ud': userdata, "otp_gen": True, 'em': email, "valid": True})


            elif email == userdata.user_email and otp_gen == "":
                # timedb = userdata.otp_time_generation
                if timedb == "":
                    otp, time = otp_generation.otpgenerate()
                    update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                    update.save(update_fields=["otp", "otp_time_generation"])
                    otp_send(email, otp, "Forget Password", "Recover Password", "OTP")
                else:
                    get_time = dt.datetime.strptime(timedb, '%Y-%m-%d %H:%M:%S.%f')
                    curr_time = dt.datetime.now()
                    interval = curr_time - get_time
                    interval = float(interval.total_seconds())
                    limit = float(14400)
                    if interval > limit:
                        otp, time = otp_generation.otpgenerate()
                        update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                        update.save(update_fields=["otp", "otp_time_generation"])
                        otp_send(email, otp, "Forget Password", "Recover Password", "OTP")
                return render(request, "login.html", {'ud': userdata, "otp_gen": True, 'em': email, "sent": True})
            else:
                return render(request, "login.html", {'ud': userdata, "otp_gen": True, 'em': email, "not_sent": True})
        except:
            return render(request, "login.html", {"fp": True, "not_sent": True})

    return render(request, "login.html", {'fp': True})





def profile(request):
    if request.session['authenticate'] == True:
        email = request.session['email']
        userdata = MySiteUser.objects.get(user_email=email)
        if request.method == "POST":
            user_image = userdata.user_image
            if request.FILES:
                myfile = request.FILES['user_image']
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                fs.url(filename)
                user_image = myfile.name
            fname = (request.POST["user_fname"]).capitalize()
            lname = (request.POST["user_lname"]).capitalize()
            dob = request.POST["user_dob"]
            mob = request.POST["user_mobile"]
            image = user_image
            gender = request.POST["user_gender"]
            update = MySiteUser(user_email=email, user_fname=fname, user_lname=lname, user_dob=dob, user_mobile=mob,
                                user_image=image, user_gender=gender)
            update.save(
                update_fields=["user_fname", "user_gender", "user_mobile", "user_dob", "user_lname", "user_image"])
            return redirect("/profileupdate")
        return render(request, "profileupdate.html", {"su": userdata})
    else:
        return redirect("/login")


def verify(request):
    try:
        email = request.GET['email']
        token = request.GET['token']
        userdata = MySiteUser.objects.get(user_email=email)
        verified = userdata.user_isverified

        if verified == True:
            return render(request, "verify.html", {"valid": True})
        else:
            dbtoken = userdata.user_token
            if (dbtoken == token):
                verified = True
                update = MySiteUser(user_email=email, user_isverified=verified, user_token="")
                update.save(update_fields=["user_isverified", "user_token"])
                return render(request, "verify.html", {"good": True})
            else:
                return render(request, "404.html", {"nv": True})
    except:
        return render(request, "verify.html", {"nv": True})


def booking(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        data = request.GET['id']
        start_date = request.GET['sd']
        end_date = request.GET['ed']
        userdata = VehiclesDetails.objects.get(vehicle_ref_id=data)

        bd = booking_details.objects.all()
        # try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)

        if request.method == "POST":
            userbooking = booking_details.objects.filter(user_detail=email).order_by("-booking_id")[0:1]
            for i in userbooking:
                if i.is_returned == False:
                    return render(request, 'bookings.html',
                                  {"ud": userdata, 'su': siteuserdata, "bd": bd, "sd": start_date, "ed": end_date,
                                   "nt": True})

            type = userdata.vehicle_id_id

            start_duration = start_date
            start_du = dt.datetime.strptime(start_duration, '%Y-%m-%d %H:%M:%S')
            # end_duration = end_date +" "+ request.POST['end_time']
            end_duration = end_date
            end_du = dt.datetime.strptime(end_duration, '%Y-%m-%d %H:%M:%S')
            duration = end_du - start_du
            duration = int(duration.total_seconds() / 3600)
            if duration <= 4:
                amt = userdata.vehicle_id.vehicle_category_price
                security = int(10000)
                total = security + amt
                request.session['invoice'] = random.randint(100000, 10000000)
                request.session['vehicle_name'] = request.POST["vehicle_name"]
                request.session['vehicle_description'] = request.POST["vehicle_description"]
                request.session['vehicle_id'] = userdata.vehicle_ref_id
                request.session['start_date'] = start_date
                request.session['category'] = userdata.vehicle_id.vehicle_category_name
                request.session['user_name'] = siteuserdata.user_fname + " " + siteuserdata.user_lname
                request.session['seller'] = userdata.u_email
                request.session['end_date'] = end_date
                request.session['amt'] = amt
                request.session['total'] = total
                request.session['booking_date'] = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

                return redirect("/confirm_booking")
                # return render(request, 'bookings.html',
                # {"ud": userdata, 'su': siteuserdata, "bd": bd, "sd": start_date, "ed": end_date,
                # "amt": amt,"security":security,"t":total})
            else:
                veh_id = userdata.vehicle_ref_id
                security, amt = price_calc(duration, type, veh_id)
                total = security + amt

                request.session['invoice'] = random.randint(100000, 10000000)
                request.session['vehicle_name'] = request.POST["vehicle_name"]
                request.session['vehicle_description'] = request.POST["vehicle_description"]
                request.session['vehicle_id'] = userdata.vehicle_ref_id
                request.session['start_date'] = start_date
                request.session['category'] = userdata.vehicle_id.vehicle_category_name
                request.session['user_name'] = siteuserdata.user_fname + " " + siteuserdata.user_lname
                request.session['seller'] = userdata.u_email
                request.session['end_date'] = end_date
                request.session['amt'] = amt
                request.session['total'] = total
                request.session['booking_date'] = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

                return redirect("/confirm_booking")
                # return render(request, 'bookings.html',
                # {"ud": userdata, 'su': siteuserdata, "bd": bd, "sd": start_date, "ed": end_date,
                # "amt":amt,"security":security,"t":total})

        return render(request, 'bookings.html',
                      {"ud": userdata, 'su': siteuserdata, "bd": bd, "sd": start_date, "ed": end_date})
        # except:

        # return redirect("/login")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})




def price_calc(duration,type,veh_id):
    ccd=VehicleCategories.objects.get(vehicle_id = type)
    vd=VehiclesDetails.objects.get(vehicle_ref_id=veh_id)

    security=int(10000)
    basefare=ccd.vehicle_category_price
    per_hour_fare=vd.vehicle_price
    interval=int(duration-4)
    exp_amount = basefare + interval*per_hour_fare
    return security,exp_amount



def queries(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True:
        if request.session['role_id'] == 1:
            query = contact_us.objects.all()
            return render(request, "Queries.html", {"q": query})
        else:
            query = contact_us.objects.filter(user_email=request.session['email'])
            return render(request, "Queries.html", {"q": query})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})








def confirm_booking(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        if (request.method == "POST"):
            form = BookingForm(request.POST)
            if form.is_valid():
                f1 = form.save(commit=False)
                # return render(request,"abcd.html")
                f1.booking_date = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                f1.start_date = request.session['start_date']
                f1.end_date = request.session['end_date']
                f1.user_detail_id = request.session['email']
                f1.vehicle_detail = request.session['vehicle_name']
                f1.security_amount = int(10000)
                f1.vehicle_info_id = request.session['vehicle_id']
                f1.amount_exp = request.session['amt']
                f1.invoice = request.session['invoice']
                f1.seller_detail = request.session['seller']
                f1.total = request.session['total']
                f1.cancel_token = str(random.randint(1000000, 100000000)) + str(request.session['email'])
                # email_send(f1.user_email, request.POST['user_password'], verify)
                f1.save()
                update = booking_details(booking_id=f1.booking_id, invoice=str(f1.booking_id) + str(f1.invoice))
                update.save(update_fields=['invoice'])
                request.session['invoice'] = ""
                request.session['vehicle_name'] = ""
                request.session['vehicle_description'] = ""
                request.session['vehicle_id'] = ""
                request.session['start_date'] = ""
                request.session['category'] = ""
                request.session['user_name'] = ""
                request.session['seller'] = ""
                request.session['end_date'] = ""
                request.session['amt'] = ""
                request.session['total'] = ""
                request.session['booking_date'] = ""

                return redirect("/invoice")
            else:
                return redirect("/login")
        return render(request, "confirm_booking.html")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})



def invoice(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        try:
            id = request.GET['id']
            bd = booking_details.objects.get(booking_id=id)
            if email == bd.user_detail_id or email==bd.seller_detail:
                return render(request, "invoice.html", {"bd": bd})
            else:
                return redirect("/error")
        except:
            bd_new = booking_details.objects.filter(user_detail=email).latest("booking_id")
            return render(request, "invoice.html", {"bd_new": bd_new})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})




def show_bookings(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        if request.session['role_id'] == 2:
            bd = booking_details.objects.all()

            return render(request, "bookingDetails.html", {"bd": bd})
        else:

            bd = booking_details.objects.filter(user_detail=request.session['email'])
            return render(request, "bookingDetails.html", {"bd": bd})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})



def cancel_booking(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        # try:
        id = request.GET['id']
        try:
            bd = booking_details.objects.get(cancel_token=id)
        except:
            return  redirect("/error")
        if email == bd.user_detail_id:
            cancel_date = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            cancel_date = dt.datetime.strptime(cancel_date, '%Y-%m-%d %H:%M:%S')
            start_date = dt.datetime.strptime(bd.start_date, '%Y-%m-%d %H:%M:%S')

            if start_date>cancel_date:
                duration = float((start_date - cancel_date).total_seconds() / 3600)

                if duration >= 36:
                    balance = bd.total - 1000
                    request.session["cancel"]=1000

                elif duration >=24:
                    balance = bd.total - 5000
                    request.session["cancel"] = 5000

                else:
                    balance = bd.total - 10000
                    request.session["cancel"] = 10000

            else:
                """earning=bd.total
                update = booking_details(booking_id=bd.booking_id, balance_amount=0, earnings=earning, total_fine=bd.total)
                update.save(update_fields=['balance_amount', "earnings","total_fine"])"""
                return redirect("/show_bookings")

            bd = booking_details.objects.get(cancel_token=id)
            request.session['duration'] = False
            request.session['date_greater'] = False
            request.session['cancelled'] = False
            if bd.is_active == True:
                """if cancel_date > start_date:
                    request.session['date_greater'] = True
                    return redirect("/show_bookings")
                elif duration < 12:
                    request.session['duration'] = True
                    return redirect("/show_bookings")
                else:"""

                if (request.method == "POST"):

                    request.session['not_cancel'] = False
                    update = booking_details(booking_id=bd.booking_id, total_fine=request.session['cancel'],
                                             balance_amount=balance, earnings=request.session['cancel'], is_active=False,cancel_token="",
                                             cancellation_time=cancel_date,
                                             is_returned=True)
                    update.save(update_fields=['balance_amount', "total_fine", "earnings",'is_active', 'cancellation_time', 'is_returned',"cancel_token"])
                    update = booking_details(booking_id=bd.booking_id)

                    return render(request, "cancel_booking.html", {"bd": bd, "cancel": True, "balance":balance})
                else:
                    return render(request, "cancel_booking.html", {"bd": bd, "not_cancel": True,"balance":balance})
                """elif bd.is_active == False and bd.cancellation_time != "":
                    request.session['cancelled'] = True
                    return redirect("/show_bookings")"""
            else:
                return redirect("/show_bookings")
        else:
            return redirect("/error")

    # except:
    # return render(request, "cancel_booking.html")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})


def user_index(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],3)
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
    except:
        return redirect("/login")
    if auth==True:
        return render(request,"user.html",{"su":siteuserdata})
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})


def view_current_book(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],request.session['role_id'])
        email = request.session['email']
    except:
        return redirect("/login")
    if auth==True:
        id = request.GET['id']
        bd = booking_details.objects.get(invoice=id)
        if email == bd.user_detail_id or email == bd.seller_detail:
            return render(request, "view_bookings.html", {"bd": bd})
        else:
            return redirect("/error")

    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})





"""def fpassword(request):
        get_id=request.GET["id"]
        userdata = MySiteUser.objects.get(user_email=get_id)
        if request.method=="POST":
            get_otp = userdata.otp
            curr_otp=request.POST['curr_otp']

            if get_otp==curr_otp:
                new_password=request.POST['new_password']
                otp=""
                otpgrn=""
                update=MySiteUser(user_email=get_id,user_password=new_password,otp=otp,otp_time_generation=otpgrn)
                update.save(update_fields=["user_password","otp","otp_time_generation"])
                return redirect("/logout")
            else:
                return render(request, "passwordupdate.html",{'valid':True} )
        else:
            pass
        return render(request,"passwordupdate.html")



        def updatepassword(request):
    if request.session['authenticate'] == True:
        email = request.session['email']
        userdata = MySiteUser.objects.get(user_email=email)
        pw = userdata.user_password
        timedb = userdata.otp_time_generation

        if request.method=="POST":
            get_time = dt.datetime.strptime(timedb, '%H:%M:%S').time()
            get_time = get_time.second + get_time.minute * 60 + get_time.hour * 3600
            curr_time = dt.datetime.now().strftime("%H:%M:%S")
            curr_time = dt.datetime.now().strptime(curr_time, "%H:%M:%S").time()
            curr_time = curr_time.second + curr_time.minute * 60 + curr_time.hour * 3600
            interval = curr_time - get_time
            get_otp = userdata.otp
            pw = userdata.user_password
            current_password=request.POST["password"]
            curr_otp=request.POST['curr_otp']

            if pw==current_password and get_otp==curr_otp and interval <= 14400:
                new_password=request.POST['new_password']
                otp=""
                otpgrn=""
                update=MySiteUser(user_email=email,user_password=new_password,otp=otp,otp_time_generation=otpgrn)
                update.save(update_fields=["user_password","otp","otp_time_generation"])
                return redirect("/logout")
            else:
                return render(request, "passwordupdate.html",{'valid':True} )
        else:
            if timedb == "":
                otp, time = otp_generation.otpgenerate()
                update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                update.save(update_fields=["otp", "otp_time_generation"])
                otp_send(email, otp, "Change Password", "Change Password")
            else:
                get_time = dt.datetime.strptime(timedb, '%H:%M:%S').time()
                get_time = get_time.second + get_time.minute * 60 + get_time.hour * 3600
                curr_time = dt.datetime.now().strftime("%H:%M:%S")
                curr_time = dt.datetime.now().strptime(curr_time,"%H:%M:%S").time()
                curr_time = curr_time.second + curr_time.minute * 60 + curr_time.hour * 3600
                interval = curr_time - get_time
                if interval > 14400:
                    otp, time = otp_generation.otpgenerate()
                    update = MySiteUser(user_email=email, otp_time_generation=time, otp=otp)
                    update.save(update_fields=["otp", "otp_time_generation"])
                    otp_send(email, otp, "Change Password", "Change Password")
    else:
        return redirect("/login")
    return render(request,"passwordupdate.html",{"up":True})

        start_date=request.GET['start_date']
        start_date=dt.datetime.strptime(start_date, '%Y-%m-%d %H:%M:%S.%f')
        end_date=request.GET['end_date']
        end_date=dt.datetime.strptime(end_date, '%Y-%m-%d %H:%M:%S.%f')
        bookingdata=booking_details.objects.all()


    start_date=request.GET['start_date']
        start_date=dt.datetime.strptime(start_date, '%Y-%m-%d')
        end_date=request.GET['end_date']
        end_date=dt.datetime.strptime(end_date, '%Y-%m-%d')
        bookingdata=booking_details.objects.all()
        for i in bookingdata:
            a=i.start_date
            a=dt.datetime.strptime(a, '%Y-%m-%d')
            b=i.end_date
            b=dt.datetime.strptime(b, '%Y-%m-%d')
        """

def policy(request):
    return render(request,"policy.html")

def feepolicy(request):
    return render(request,"feepolicy.html")

def privacy(request):
    return render(request,"privacy.html")

def member(request):
    return render(request,"member.html")

def eligibilty(request):
    return render(request,"eligibilty.html")
