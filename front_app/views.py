from django.shortcuts import render, HttpResponse, redirect
from front_app.forms import MySiteUserForm, ContactForm, LoginDetailsForm
from front_app.models import MySiteUser, User_role, contact_us, login_details, booking_details
from managerapp.models import VehiclesDetails, VehicleCategories, VehicleCompany
from django.core.files.storage import FileSystemStorage
from emailSend import email_send, otp_send
import authorize, otp_generation
import datetime as dt
from datetime import timedelta
import random
from django.contrib.auth.hashers import make_password, check_password
from django.db.models import Q


def index(request):
    companydata = VehicleCompany.objects.all()
    companycategorydata = VehicleCategories.objects.all()
    vehicle_id = []
    userdata = VehiclesDetails.objects.filter(~Q(vehicle_ref_id__in=(vehicle_id)))
    try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
        try:
            if request.method == "POST":
                start_date = request.POST['start_date']
                end_date = request.POST['end_date']
                end_date = end_date + " 00:00:00.000000"
                start_date = start_date + " 00:00:00.000000"
                start_date = dt.datetime.strptime(start_date, '%Y-%m-%d %H:%M:%S.%f')
                end_date = dt.datetime.strptime(end_date, '%Y-%m-%d %H:%M:%S.%f')

                bookingdata = booking_details.objects.all()
                for i in bookingdata:
                    db_sdate = dt.datetime.strptime(str(i.start_date), '%Y-%m-%d %H:%M:%S.%f')
                    dbend_date = dt.datetime.strptime(str(i.end_date), '%Y-%m-%d %H:%M:%S.%f')

                    if start_date < db_sdate and end_date < db_sdate:
                        pass
                    elif start_date > dbend_date and end_date > dbend_date:
                        pass
                    else:
                        vehicle_id.extend([i.vehicle_info_id])
                        a = len(vehicle_id)
                userdata = VehiclesDetails.objects.filter(~Q(vehicle_ref_id__in=(vehicle_id)))
                return render(request, 'index.html',
                              {"ud": userdata, "cd": companydata, "ccd": companycategorydata, 'su': siteuserdata,
                               "book": True,
                               "sd": request.POST['start_date'], "ed": request.POST['end_date'], "try": "try inner"})
            return render(request, 'index.html',
                          {"ud": userdata, "cd": companydata, "ccd": companycategorydata, 'su': siteuserdata,
                           "try": "try outer"})
        except:
            return render(request, 'index.html',
                          {"ud": userdata, "cd": companydata, "ccd": companycategorydata, 'su': siteuserdata,
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
                        return redirect("/master")
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
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)

    return render(request, "404.html", {'su': siteuserdata})


def about(request):
    try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
        return render(request, "about.html", {'su': siteuserdata})
    except:
        return render(request, "about.html")


def contact(request):
    try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
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
                return render(request, "contact.html", {'valid': True}, {'su': siteuserdata})
            else:
                return render(request, "contact.html", {'invalid': True}, {'su': siteuserdata})
        return render(request, "contact.html", {'su': siteuserdata})
    except:
        return render(request, "contact.html")


def faq(request):
    return render(request, "faq.html")


def help(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    return render(request, "help-desk.html", {'su': siteuserdata})


def master(request):
    return render(request, "master.html")


def car_detail(request):
    email = request.session['email']
    siteuserdata = MySiteUser.objects.get(user_email=email)
    return render(request, "car-details.html", {'su': siteuserdata})


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
                    otp_send(email, pwd, "Password Changed", "Updated Password", "Password")
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
    data = request.GET['id']
    start_date=request.GET['sd']
    end_date=request.GET['ed']
    userdata = VehiclesDetails.objects.get(vehicle_ref_id=data)
    bd = booking_details.objects.all()
    try:
        email = request.session['email']
        siteuserdata = MySiteUser.objects.get(user_email=email)
        return render(request, 'bookings.html', {"ud": userdata, 'su': siteuserdata, "bd": bd,"sd":start_date,"ed":end_date})
    except:

        return redirect("/login")

















