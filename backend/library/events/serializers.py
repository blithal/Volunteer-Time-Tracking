from rest_framework import serializers

from .models import info


class eventsSerializer(serializers.ModelSerializer):
    class Meta:
        model = info
        fields = [
          'id',
          'organizer',
          'name',
          'description',
          'startDate',
          'startTime',
          'location',
          'completed'
        ]
