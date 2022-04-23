from django.shortcuts import render, redirect
from report.models import info
from .serializers import reportSerializer
from rest_framework import viewsets


# Create your views here.
class report(viewsets.ModelViewSet):
    queryset = info.objects.all()
    serializer_class = reportSerializer