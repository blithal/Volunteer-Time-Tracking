from django.shortcuts import render, redirect
from user.models import info, login
from .serializers import userSerializer, loginSerializer
from rest_framework import viewsets
#from rest_framework import response


# Create your views here.
class user(viewsets.ModelViewSet):
    queryset = info.objects.all()
    #queryset = info.objects.filter(firstName__icontains="testuser")
    serializer_class = userSerializer
    # def get(self, format=None):
    #     users = info.objects.all()
    #     serializer = userSerializer(users, many=True)
    #     return response(serializer.data)
    
class logininfo(viewsets.ModelViewSet):
    queryset = login.objects.all()
    serializer_class = loginSerializer