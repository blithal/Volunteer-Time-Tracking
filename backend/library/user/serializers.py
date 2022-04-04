from rest_framework import serializers

from .models import info, login


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
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