from django.shortcuts import render, redirect
from userTime.models import info
from .serializers import userTimeSerializer
from rest_framework import viewsets


# Create your views here.
class views(viewsets.ModelViewSet):
    queryset = info.objects.all()
    serializer_class = userTimeSerializer

