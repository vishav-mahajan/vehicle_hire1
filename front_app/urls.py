from django.conf.urls import url
from front_app import views


app_name = 'front_app'

urlpatterns = [
    url(r'^$', views.index, name="index"),
    url(r'^error$',views.page_not_found,name="error"),
    url(r'^about/$',views.about,name="about"),
    url(r'^contact$',views.contact,name="contact"),
    url(r'^faq$',views.faq,name="faq"),
    url(r'^team$',views.help,name="team"),
    url(r'^login$', views.login, name="login"),
    url(r'^signup$', views.signup, name="signup"),
    url(r'^masteruser/$', views.master, name="master"),
    url(r'^forgetpassword/$', views.forgototp, name="forgetpassword"),
    url(r'^car-details/$', views.car_detail, name="car"),
    url(r'^update/$', views.profile, name="update"),
    url(r'^booking/$', views.booking, name="booking"),
    url(r'^invoice/$', views.invoice, name="invoice"),
    url(r'^confirm_booking/', views.confirm_booking),
    url(r'^show_bookings/', views.show_bookings),
url(r'^view_bookings/', views.view_current_book),
    url(r'^cancel_booking/', views.cancel_booking),
    url(r'^queries/', views.queries),
url(r'^user/', views.user_index)



]