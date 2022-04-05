from django.shortcuts import render, redirect
from account.models import termination
from .serializers import accountSerializer
from rest_framework import viewsets


# Create your views here.
class views(viewsets.ModelViewSet):
    queryset = termination.objects.all()
    serializer_class = accountSerializer
