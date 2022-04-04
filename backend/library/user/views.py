from django.shortcuts import render, redirect
from user.models import info, login
from .serializers import userSerializer, loginSerializer
from rest_framework import viewsets


# Create your views here.
class user(viewsets.ModelViewSet):
    queryset = info.objects.all()
    serializer_class = userSerializer
    
class logininfo(viewsets.ModelViewSet):
    queryset = login.objects.all()
    serializer_class = loginSerializer

# def searchUser(request):
#     user_list = info.objects.all()
#     user_filter = UserFilter(request.GET, queryset=user_list)
#     return render(request, '/logindetails', {'filter': user_filter})