from django.shortcuts import render, redirect
from login.models import activity
from .serializers import loginSerializer
from rest_framework import viewsets


# Create your views here.
class views(viewsets.ModelViewSet):
    queryset = activity.objects.all()
    serializer_class = loginSerializer