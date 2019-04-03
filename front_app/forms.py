from django import forms
from front_app.models import MySiteUser,User_role

class User_roleForm(forms.ModelForm):
    class Meta():
        model=User_role

        exclude=[
            "role_id",
            "role_name"
        ]

class MySiteUserForm(forms.ModelForm):
    class Meta():
        model=MySiteUser

        exclude=[
            "site_role_id",
            "user_name",
            "user_email",
            "user_password",
            "user_mobile",
            "user_gender",
            "user_isactive",
            "user_dob",
            "user_image",
            "user_isavailable",
            "user_isqueue",
            "last_login"
        ]


