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
from user import views
from userTime import viewsTime
from account import viewsAccount
from login import viewsLogin
from rest_framework import routers
from account import urls
from login import urls
from user import userurls
from userTime import urls
from loginInfo import urls
from events import urls
from report import urls

router = routers.DefaultRouter(trailing_slash=False)
router.register('userdetails', views.user)

router2 = routers.DefaultRouter(trailing_slash=False)
router2.register('userTimedetails', viewsTime.views)

#router3 = routers.DefaultRouter(trailing_slash=False)
##router3.register('accountdetails', viewsAccount.terminationViews)

#router4 = routers.DefaultRouter(trailing_slash=False)
#router4.register('logindetails', viewsLogin.activityViews)

urlpatterns = [
    #path('user/', include('user.userurls')),
    #path('timeInfo/', include('userTime.urls')),
    path('login/', include('login.urls')),
    path('account/', include('account.urls')),
    path('loginInfo/', include('loginInfo.urls')),
    path('user/', include(router.urls)),
    #path('', include(router.urls)),
    path('userTime/', include(router2.urls)),
    path('events/', include('events.urls')),
    path('report/', include('report.urls')),
    #path('', include(router3.urls)),
    #path('', include(router4.urls))
]
