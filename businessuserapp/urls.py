from django.conf.urls import url

from businessuserapp import views
from django.conf import settings

app_name = 'businessuserapp'


urlpatterns = [
        url(r'^$', views.business_index, name="business_index"),
        url(r'^vehicle_details/', views.vehicle_details, name="vehicle_details"),
         #url(r'^vehicle_company/$', views.vehicle_company, name="vehicle_company"),
        url(r'^showdata/$', views.showdata, name="showdata"),
        url(r'^updatedata/$', views.updatedata, name="updatedata"),
        url(r'^delete_data/$', views.delete_data, name="delete_data"),
        url(r'^mybookings/$', views.my_bookings),
        url(r'^chkreturn/', views.chkreturn),
        url(r'^balance/', views.balance),
        url(r'^bankbalance/', views.earnings),
        url(r'^active_bookings/',views.active),
        url(r'^cancelled_bookings/',views.cancelled)  ,
        url(r'^complete_bookings/',views.completed),
url(r'^pending_refunds/',views.pending_refunds),
url(r'^refunded/',views.refunded)
]

