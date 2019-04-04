from django import forms
from adminapp.models import MySite_Admin

class MySite_AdminForm(forms.ModelForm):
    class Meta():
        model=MySite_Admin

        exclude=[

            "admin_name",
            "admin_email",
            "admin_password",
            "admin_image",
            "admin_login_time",
            "admin_logout_time"
        ]


