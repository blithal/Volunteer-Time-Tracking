from django.shortcuts import render, redirect
from user.models import user
from .serializers import userSerializer
from rest_framework import viewsets


# Create your views here.
class user(viewsets.ModelViewSet):
    queryset = user.objects.all()
    serializer_class = userSerializer
