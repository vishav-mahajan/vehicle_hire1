from django import forms
from managerapp.models import MySite_Manager,Vehicle,Staff_vehicles,Company

class MySite_ManagerForm(forms.ModelForm):
    class Meta():
        model=MySite_Manager

        exclude=[

            "manager_name",
            "manager_email",
            "manager_password",
            "manager_image",
            "admin_login_time",
            "admin_logout_time",

        ]

        class VehicleForm(forms.ModelForm):
            class Meta():
                model = Vehicle

                exclude = [

                    "vehicle_name",
                    "vehicle_price",
                    "type_isactive",
                    "vehicle_id",

                ]

                class CompanyForm(forms.ModelForm):
                    class Meta():
                        model = Company

                        exclude = [

                            "company_name",
                            " company_id",
                            " company_isactive",


                        ]

                        class Staff_VehicleForm(forms.ModelForm):
                            class Meta():
                                model = Staff_vehicles

                                exclude = [

                                    "vehicle_id",
                                    "vehicle_name",
                                    "vehicle_description",
                                    "vehicle_image",
                                    "vehicle_isactive",
                                    "company_id_id ",
                                    "vehicle_id_id ",
                                    "u_email",

                                ]