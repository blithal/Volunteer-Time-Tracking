from rest_framework import serializers

from .models import info

class userTimeSerializer(serializers.ModelSerializer):
  class Meta:
    model = info
    fields = [
    'userId',
    'eventId',
    'ClockIn',
    'ClockOut',
    'Date',
    'DateModified',
    'ModifiedByUser'
]