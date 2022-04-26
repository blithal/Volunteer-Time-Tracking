from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('user', views.user)

urlpatterns = [
    #path('', views.info, name='user details'),
    path('', include(router.urls), name='user details'),
]