from django.shortcuts import render, redirect
from events.models import info
from .serializers import eventsSerializer
from rest_framework import viewsets
from rest_framework import permissions


# Create your views here.
class events(viewsets.ModelViewSet):
    permission_classes = [permissions.AllowAny]
    queryset = info.objects.all()
    serializer_class = eventsSerializer