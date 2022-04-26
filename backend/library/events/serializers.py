from rest_framework import serializers
from .models import info


class eventsSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        event = info.objects.create(**validated_data)
        return event

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
