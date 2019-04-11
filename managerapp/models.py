from django.db import models

# Create your models here.



class VehicleCategories(models.Model):
    vehicle_category_name=models.CharField(max_length=225,default="")
    vehicle_category_price=models.IntegerField(default=0)
    type_isactive=models.BooleanField(default=True)
    vehicle_id=models.AutoField(primary_key=True)


class VehicleCompany(models.Model):
    company_name = models.CharField(max_length=225, default="",null=False)
    company_id = models.AutoField(primary_key=True)
    company_isactive = models.BooleanField(default=True)
class VehiclesDetails(models.Model):
    vehicle_ref_id = models.AutoField(primary_key=True)
    vehicle_name = models.CharField(max_length=225, default="")
    vehicle_description = models.CharField(max_length=225,default="")
    vehicle_image = models.CharField(max_length=225,default="")
    vehicle_isactive = models.BooleanField(default=True)
    company_id = models.ForeignKey(VehicleCompany,on_delete=models.CASCADE,default="")
    vehicle_id = models.ForeignKey(VehicleCategories,on_delete=models.CASCADE,default="")
    u_email=models.CharField(max_length=225,default="")
    vehicle_isavailable=models.BooleanField(default=True)
    vehicle_price=models.IntegerField(default=0)
    vehicle_model=models.BigIntegerField(default=0)




