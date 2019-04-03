from django.conf.urls import url
from adminapp import views



app_name = 'adminapp'


urlpatterns = [
        url(r'^$', views.index, name="index"),

]