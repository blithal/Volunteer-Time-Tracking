from rest_framework import serializers

from .models import activity


class loginSerializer(serializers.ModelSerializer):
    class Meta:
        model = activity
        fields = [
          'userId',
          'timestamp'
        ]
