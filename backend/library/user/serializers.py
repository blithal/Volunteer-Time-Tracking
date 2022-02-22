from rest_framework import serializers

from .models import info


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'userID',
          'name',
          'volunteerAdmin',
          'active'
        ]
