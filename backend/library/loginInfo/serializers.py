from rest_framework import serializers

from .models import fieldsInfo


class loginInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = fieldsInfo
        fields = [
          'userID',
          'password'
        ]
