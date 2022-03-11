from django.urls import path, include
from . import viewsTime
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('userTime', viewsTime.views)

urlpatterns = [
    #path('', viewsTime.views.as_view({'get': 'retrieve'}), name='time info'),
    path('', include(router.urls), name='time info'),
]