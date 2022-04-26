from rest_framework import serializers
from .models import info
from .models import enroll


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

class enrollSerializer(serializers.ModelSerializer):
    class Meta:
        model = enroll
        fields = [
            'id',
          'userId',
          'eventId'
        ]
