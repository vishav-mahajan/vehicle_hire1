from django import forms
from managerapp.models import VehicleCategories, VehicleCompany, VehiclesDetails


class VehicleCategoryForm(forms.ModelForm):
    class Meta():
        model = VehicleCategories
        exclude = [
                    "vehicle_category_name",
                    "vehicle_category_price",
                    "type_isactive",
                    "vehicle_id"
                ]

class VehicleCompanyForm(forms.ModelForm):
    class Meta():
        model = VehicleCompany
        exclude = [
                    "company_name",
                    "company_id",
                    "company_isactive"
                    ]
class VehicleDetailsForm(forms.ModelForm):
    class Meta():
        model = VehiclesDetails
        exclude = [
                    "vehicle_ref_id",
                    "vehicle_name",
                    "vehicle_description",
                    "vehicle_image",
                    "vehicle_isactive",
                    "company_id",
                    "vehicle_id",
                    "u_email",
                    "vehicle_isavailable",
                    "vehicle_price",
                    "vehicle_model",
            "seats",
            "airbags",
            "abs",
            "transmission"
                     ]