from rest_framework import serializers

from .models import info


class reportSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'id',
          'volunteerName',
          'text'
        ]
