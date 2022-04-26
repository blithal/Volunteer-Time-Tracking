from django.db import models

# Create your models here.

class activity(models.Model):
    userId = models.IntegerField()
    timestamp = models.DateTimeField()
class Meta:
    db_table = "Login Activity Table"