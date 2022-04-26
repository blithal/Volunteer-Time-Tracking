from telnetlib import STATUS
from django.shortcuts import render, redirect
from rest_framework.response import Response
from events.models import info
from .serializers import eventsSerializer
from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import status


# Create your views here.
class events(viewsets.ModelViewSet):
    permission_classes = [permissions.AllowAny]
    queryset = info.objects.all()
    serializer_class = eventsSerializer
        

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)

    def perform_destroy(self, instance):
        instance.delete()