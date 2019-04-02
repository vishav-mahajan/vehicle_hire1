from django.conf.urls import url
from front_app import views


app_name = 'front_app'

urlpatterns = [
    url(r'^$', views.index, name="index"),
    url(r'^error$',views.page_not_found,name="error"),
    url(r'^about/$',views.about,name="about"),
    url(r'^contact$',views.contact,name="contact"),
    url(r'^driver$',views.driver_page,name="driver"),
    url(r'^faq$',views.faq,name="faq"),
    url(r'^package$',views.package,name="package"),
    url(r'^register$',views.register,name="register"),
    url(r'^gallery$',views.gallery,name="gallery"),
    url(r'^team$',views.help,name="team"),
    url(r'^login$', views.login, name="login"),
url(r'^admin$', views.admin_login, name="admin_login"),
    url(r'^signup$', views.signup, name="signup"),
    url(r'^master/$', views.master, name="master"),
url(r'^car-details/$', views.car_detail, name="baleno"),
]