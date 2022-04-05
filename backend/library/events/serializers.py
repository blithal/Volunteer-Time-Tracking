from rest_framework import serializers

from .models import info


class eventsSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'id',
          'name',
          'description',
          'startDate',
          'startTime',
          'completed'
        ]
