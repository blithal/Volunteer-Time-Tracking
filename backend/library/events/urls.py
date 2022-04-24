from django.urls import path, include
from . import views
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('events', views.events)

urlpatterns = [
    path('', include(router.urls), name='event activity'),
]