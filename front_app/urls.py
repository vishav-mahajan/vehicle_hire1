from django.conf.urls import url
from front_app import views


app_name = 'front_app'

urlpatterns = [
    url(r'^$', views.index),

    url(r'^error$',views.page_not_found,name="error"),
    url(r'^about/$',views.about,name="about"),
    url(r'^article$',views.article,name="article"),
    url(r'^contact$',views.contact,name="contact"),
    url(r'^driver$',views.driver_page,name="driver"),
    url(r'^faq$',views.faq,name="faq"),
    url(r'^articled$',views.articled,name="articles-details"),
    url(r'^index2$',views.index2,name="index2"),
    url(r'^index3$',views.index3,name="index3"),
    url(r'^package$',views.package,name="package"),
    url(r'^register$',views.register,name="register"),
    url(r'^services$',views.services,name="services"),
    url(r'^gallery$',views.gallery,name="gallery"),
    url(r'^help$',views.help,name="help-desk"),
    url(r'^login$', views.login, name="login"),
    url(r'^signup$', views.signup, name="signup"),
]