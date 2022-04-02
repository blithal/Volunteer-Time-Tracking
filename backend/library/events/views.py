from django.shortcuts import render, redirect
from events.models import info
from .serializers import eventsSerializer
from rest_framework import viewsets


# Create your views here.
class events(viewsets.ModelViewSet):
    queryset = info.objects.all()
    serializer_class = eventsSerializer