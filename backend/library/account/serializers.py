from rest_framework import serializers

from account.models import termination


class accountSerializer(serializers.ModelSerializer):
    class Meta:
        model = termination
        fields = [
          'userId',
          'Reason'
        ]
