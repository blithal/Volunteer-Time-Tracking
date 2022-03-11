from django.urls import path, include
from . import viewsLoginInfo
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('login info', viewsLoginInfo.views)

urlpatterns = [
    path('', include(router.urls), name='login info'),
]