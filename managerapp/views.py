from django.shortcuts import render,redirect
import authorize as au
from front_app.views import login

# Create your views here.
def manager_index(request):


    auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
    if auth==True:

        return render(request,"manager.html")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return redirect("/login",{'auth':True})
        elif(message=="Wrong Level"):
            return redirect("/error")

def logout(request):
    request.session['authenticate']=False
    return redirect("/login")