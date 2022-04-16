"""library URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework.authtoken import views
# from api import urls

# urlpatterns = [
#     path('admin/', admin.site.urls),
#     path('api/', include('api.urls', namespace='api')),
#     path('api-token-auth/', views.obtain_auth_token, name='api-token-auth'),
# ]
from user import viewsUser
from userTime import viewsTime
from rest_framework import routers

router = routers.DefaultRouter(trailing_slash=False)
router.register('userdetails', viewsUser.user)
router.register('logindetails', viewsUser.logininfo)

router2 = routers.DefaultRouter(trailing_slash=False)
router2.register('userTimedetails', viewsTime.views)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
    path('login/', include('login.urls')),
    path('account/', include('account.urls')),
    path('loginInfo/', include('loginInfo.urls')),
    path('user/', include(router.urls)),
    path('userTime/', include(router2.urls)),
    path('events/', include('events.urls')),
    path('api/', include ('api.urls', namespace='api')),
    path('api-token-auth/', views.obtain_auth_token, name='api-token-auth'),
]
