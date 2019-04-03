from django.shortcuts import render,redirect
import authorize as au


# Create your views here.
def manager_index(request):


    auth = au.authorizeuser(request.session['authenticate'],request.session['role_id'],1)
    if auth==True:

        return render(request,"manager.html")
    else:
        auth,message = auth
        if (message=="Not Logged In"):
            return render(request,"login.html",{"pass":True})
        elif(message=="Wrong Level"):
            return render(request,"404.html",{"pass":True})

def logout(request):
    request.session['authenticate']=False
    return redirect("/login")