from django.db import models
from managerapp.models import VehiclesDetails

# Create your models here.
class User_role (models.Model):
    role_id=models.AutoField(primary_key=True)
    role_name=models.CharField(max_length=225,default="",unique=True)

class MySiteUser(models.Model):
    site_role_id=models.ForeignKey(User_role,on_delete=models.CASCADE,default="")
    user_fname=models.CharField(max_length=255,default="")
    user_lname = models.CharField(max_length=255, default="")
    user_email=models.EmailField(primary_key=True,max_length=225,default="")
    user_password=models.CharField(max_length=20,default="")
    user_mobile=models.BigIntegerField(default=0)
    user_gender=models.CharField(max_length=12,default="")
    user_isactive=models.BooleanField(default=True)
    user_dob=models.CharField(max_length=255,default="")
    user_image=models.CharField(max_length=255,null=True)
    user_isavailable=models.BooleanField(default=True)
    user_isqueue=models.BooleanField(default=False)
    registered_on=models.CharField(max_length=225,null=True )
    otp=models.CharField(max_length=255,null=True,default="")
    otp_time_generation = models.CharField(max_length=255, null=True,default="")
    user_isverified=models.BooleanField(default=False)
    user_token=models.CharField(max_length=255,null=True,default="")
    def __str__(self):
        return self.user_email

class contact_us (models.Model):
    user_name = models.CharField(max_length= 255,default="")
    user_email = models.CharField(max_length=180,default="")
    user_mobile = models.CharField(max_length=180, default="", null=False)
    user_subject=models.CharField(max_length=180,default="")
    user_message = models.CharField(max_length=500, default="")

class login_details(models.Model):
    login_id=models.AutoField(primary_key=True)
    user_email=models.CharField(max_length=225,default="")
    login_time = models.CharField(max_length=225, default="")
    logout_time = models.CharField(max_length=225, default="")

class booking_details(models.Model):
    booking_date=models.CharField(max_length=255, default="")
    booking_id=models.AutoField(primary_key=True)
    invoice=models.CharField(max_length=255,unique=True, default="")
    user_detail=models.ForeignKey(MySiteUser, on_delete=models.CASCADE, default="")
    seller_detail=models.CharField(max_length=255,default="")
    vehicle_detail=models.CharField(max_length=255,default="")
    start_date=models.CharField(max_length=255,default="")
    end_date=models.CharField(max_length=255,default="")
    is_returned=models.BooleanField(default=False)
    is_fine=models.BooleanField(default=False)
    security_amount=models.BigIntegerField(default=0)
    fine_amount=models.BigIntegerField(default=0)
    balance_amount=models.BigIntegerField(default=0)
    amount_exp=models.BigIntegerField(default=0)
    total=models.BigIntegerField(default=0)
    vehicle_info = models.ForeignKey(VehiclesDetails, on_delete=models.CASCADE, default="")
    cancel_token=models.CharField(max_length=255, default="")
    is_active=models.BooleanField(default=True)
    cancellation_time=models.CharField(max_length=255,default="")
    return_date=models.CharField(max_length=255,default="")
    damage_amount=models.BigIntegerField(default=0)
    extension=models.BigIntegerField(default=0)
    ext_amount=models.BigIntegerField(default=0)
    total_fine=models.BigIntegerField(default=0)
    earnings=models.BigIntegerField(default=0)
