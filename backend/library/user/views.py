from django.shortcuts import render, redirect
from user.models import info
from .serializers import userSerializer
from rest_framework import viewsets


# Create your views here.
class user(viewsets.ModelViewSet):
    queryset = info.objects.all()
    serializer_class = userSerializer
