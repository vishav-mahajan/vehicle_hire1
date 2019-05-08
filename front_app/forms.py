from django import forms
from front_app.models import MySiteUser,User_role,contact_us,login_details,booking_details


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
            "registered_on",
            "otp",
            "otp_time_generation",
            "user_isverified",
            "user_token"
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

class BookingForm(forms.ModelForm):
    class Meta():
        model=booking_details
        exclude=[
            "booking_id",
            "user_detail",
            "vehicle_detail",
            "start_date",
            "end_date",
            "is_returned",
            "is_fine",
            "security_amount",
            "fine_amount",
            "balance_amount",
            "vehicle_info",
            "amount_exp",
            "invoice",
            "seller_detail",
            "total",
            "booking_date",
            "cancel_token",
            "is_active",
            "cancellation_time",
            "return_date",
            "damage_amount",
            "extension",
            "ext_amount",
            "total_fine",
            "earnings"
        ]

