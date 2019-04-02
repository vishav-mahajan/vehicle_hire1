from django.conf.urls import url
from adminapp import views



app_name = 'adminapp'


urlpatterns = [
        url(r'a_index/^$', views.index, name="index"),
        url(r'a_signup/^$', views.signup, name="signup"),
        url(r'a_signin/^$', views.signin, name="signin"),
        ]