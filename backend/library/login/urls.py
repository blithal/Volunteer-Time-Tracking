from django.urls import path, include
from . import viewsLogin
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('login activity', viewsLogin.views)

urlpatterns = [
    path('', include(router.urls), name='login activity'),
]