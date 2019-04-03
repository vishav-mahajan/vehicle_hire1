from django.shortcuts import render

# Create your views here.
def manager_index(request):
    return render(request,"manager.html")
