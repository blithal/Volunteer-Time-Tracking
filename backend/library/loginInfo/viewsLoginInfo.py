from django.shortcuts import render, redirect
from loginInfo.models import fieldsInfo
from .serializers import loginInfoSerializer
from rest_framework import viewsets


# Create your views here.
class views(viewsets.ModelViewSet):
    queryset = fieldsInfo.objects.all()
    serializer_class = loginInfoSerializer