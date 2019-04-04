from django.db import models

# Create your models here.
class MySite_Manager(models.Model):
    manager_name=models.CharField(max_length=255,default="")
    manager_email=models.EmailField(primary_key=True,max_length=225,default="")
    manager_password=models.CharField(max_length=255,default="")
    manager_image=models.CharField(max_length=255,null=True)
    manager_login_time=models.CharField(max_length=255,default="")
    manager_logout_time = models.CharField(max_length=255, default="")


class Vehicle(models.Model):
    vehicle_name=models.CharField(max_length=225,default="")
    vehicle_price=models.IntegerField(max_length=225,default="")
    type_isactive=models.IntegerField(default="")
    vehicle_id=models.AutoField(max_length=225,default="",primary_key=True)


class Company(models.Model):
    company_name = models.CharField(max_length=225, default="")
    company_id = models.AutoField(max_length=225,default="",primary_key=True)
    company_isactive = models.IntegerField(default="")

class Staff_vehicles(models.Model):
    vehicle_id = models.AutoField(max_length=225,default="",primary_key=True)
    vehicle_name = models.CharField(max_length=225, default="")
    vehicle_description = models.CharField(max_length=225,default="")
    vehicle_image = models.CharField(max_length=225,default="")
    vehicle_isactive = models.IntegerField(default="")
    company_id_id = models.ForeignKey(Company,on_delete=models.CASCADE,default="")
    vehicle_id_id = models.ForeignKey(Vehicle,on_delete=models.CASCADE,default="")
    u_email=models.CharField(max_length=225,default="")
    vehicle_isavailable=models.IntegerField(max_length=225, default="")




