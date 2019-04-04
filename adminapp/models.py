from django.db import models


class MySite_Admin(models.Model):
    admin_name=models.CharField(max_length=255,default="")
    admin_email=models.EmailField(primary_key=True,max_length=225,default="")
    admin_password=models.CharField(max_length=20,default="")
    admin_image=models.CharField(max_length=255,null=True)
    admin_login_time=models.CharField(max_length=255,default="")
    admin_logout_time = models.CharField(max_length=255, default="")

from django.db import models

# Create your models here.
