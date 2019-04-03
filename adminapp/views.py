from django.shortcuts import render,HttpResponse,redirect
from adminapp .forms import MySite_AdminForm
from adminapp .models import MySite_Admin
from django.core.files.storage import FileSystemStorage
import authorize as au
# Create your views here.

def index(request):
    auth=False
    auth = au.authorizeuser(request.session['authenticate'], request.session['role_id'], 2)
    if auth == True:

        return render(request, "manager.html")
    else:
        auth, message = auth
        if (message == "Not Logged In"):
            return render(request, "login.html", {"pass": True})
        elif (message == "Wrong Level"):
            return render(request, "404.html", {"pass": True})
    return render(request,"managerindex.html")




