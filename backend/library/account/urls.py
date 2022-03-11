from django.urls import path, include
from . import viewsAccount
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('account termination', viewsAccount.views)

urlpatterns = [
    path('', include(router.urls), name='account termination'),
]