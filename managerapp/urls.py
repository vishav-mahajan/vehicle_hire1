from django.conf.urls import url
from managerapp import views




app_name = 'managerapp'


urlpatterns = [
        url(r'^$', views.manager_index, name="manager_index"),

]