from rest_framework import serializers

from .models import info


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'name',
          'volunteerAdmin',
          'active'
        ]
