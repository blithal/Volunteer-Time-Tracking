from rest_framework import serializers
from .models import info, login
#import django_filters

class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'id',
          'firstName',
          'isAdmin',
          'isActive',
          'email',
          'lastName',
          'phone'
        ]

class loginSerializer(serializers.ModelSerializer):
    class Meta:
        model = login
        fields = [
          'userId',
          'username',
          'password'
        ]
