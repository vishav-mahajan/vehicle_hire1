from django import forms
from front_app.models import MySiteUser,User_role,contact_us,login_details


class ContactForm(forms.ModelForm):
    class Meta():
        model=contact_us
        exclude=[
            "user_name",
            "user_email",
            "user_mobile",
            "user_subject",
            "user_message",
        ]
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
            "user_fname",
            "user_lname",
            "user_email",
            "user_password",
            "user_mobile",
            "user_gender",
            "user_isactive",
            "user_dob",
            "user_image",
            "user_isavailable",
            "user_isqueue",
            "registered_on"
        ]

class LoginDetailsForm(forms.ModelForm):
    class Meta():
        model=login_details
        exclude=[
            "login_id",
            "user_email",
            "login_time",
            "logout_time"
        ]


