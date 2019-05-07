from django.shortcuts import render,HttpResponse,redirect

import datetime as dt
import authorize as au
from managerapp.models import VehicleCompany,VehicleCategories,VehiclesDetails
from front_app.models import MySiteUser
from managerapp.forms import VehicleCategoryForm, VehicleCompanyForm, VehicleDetailsForm
from django.core.files.storage import FileSystemStorage
from front_app.views import queries
# Create your views here.

def index(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)

    except:
        return redirect("/login")
    if auth == True:

        return render(request, "superuser.html")
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")




        



def vehicle_company(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)

    except:
        return redirect("/login")
    if auth == True:

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
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")




def vehicle_details(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)

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
                f.save()
                return render(request, "vehicledetails.html",
                              {'valid': True, 'cd': companydata, "ccd": companycategorydata, 'yr': year})
            else:
                return render(request, "vehiclecategories.html", {'invalid': True})

        return render(request, "vehicledetails.html", {'cd': companydata, "ccd": companycategorydata, 'yr': year})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")



def showdata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)

    except:
        return redirect("/login")
    if auth == True:

        try:
            if request.session["role_id"] == 2:
                vehicle_id = request.GET['id']
                ccd = VehicleCategories.objects.all()
                cd = VehicleCompany.objects.all()
                userdata = VehiclesDetails.objects.filter(vehicle_id_id=vehicle_id)
                return render(request, "view_cars.html", {'ud': userdata, 'ccd': ccd, "cd": cd})
        except:
            ccd = VehicleCategories.objects.all()
            cd = VehicleCompany.objects.all()
            userdata = VehiclesDetails.objects.all()
            return render(request, "view_cars.html", {'ud': userdata, 'ccd': ccd, "cd": cd})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")


def delete_data(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)
    except:
        return redirect("/login")
    if auth == True:

        carid = request.GET['id']
        try:
            deleteUser = VehiclesDetails.objects.get(vehicle_ref_id=carid)
            deleteUser.delete()
            if request.session['role_id'] == 4:
                return redirect("businessuserapp:showdata")
            elif request.session['role_id'] == 4:
                return redirect("managerapp:showdata")
            else:
                return redirect("superuser:showdata")

        except:
            pass
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")


def updatedata(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)
    except:
        return redirect("/login")
    if auth == True:

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
            elif request.session['role_id'] == 1:
                return redirect("managerapp:showdata")
            else:
                return redirect("superuser:showdata")

        return render(request, "update_cars.html",
                      {'vd': userdata, 'yr': year, 'ccd': companycategorydata, 'cd': companydata})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")

def vehicle_category(request):
    try:
        auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)
    except:
        return redirect("/login")
    if auth == True:
        try:
            if (request.method == "POST"):
                form = VehicleCategoryForm(request.POST)
                if form.is_valid():
                    f1 = form.save(commit=False)
                    f1.vehicle_category_name = (request.POST['vehicle_category_name']).capitalize()
                    f1.vehicle_category_price = request.POST['vehicle_category_price']
                    f1.save()
                    return render(request, "vehiclecategories.html", {'valid': True})
                else:
                    return render(request, "vehiclecategories.html", {'invalid': True})
            return render(request, "vehiclecategories.html")
        except:
            return render(request, "vehiclecategories.html", {'exist': True})
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return redirect("/login")
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request, "superuser.html")