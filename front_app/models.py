from django.db import models

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

class contact_us (models.Model):
    user_name=models.CharField(max_length= 255,default="")
    user_email = models.CharField(max_length=180,default="")
    user_mobile = models.CharField(max_length=180, default="", null=False)
    user_subject=models.CharField(max_length=180,default="")
    user_message = models.CharField(max_length=500, default="")

class login_details(models.Model):
    login_id=models.AutoField(primary_key=True)
    user_email=models.CharField(max_length=225,default="")
    login_time = models.CharField(max_length=225, default="")
    logout_time = models.CharField(max_length=225, default="")





