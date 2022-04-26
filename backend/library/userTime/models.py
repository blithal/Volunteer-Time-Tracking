from django.db import models

# Create your models here.

class info(models.Model):
    userId = models.IntegerField()
    eventId = models.IntegerField()
    ClockIn = models.DateTimeField()
    ClockOut = models.DateTimeField()
    Date = models.DateField(auto_now=True)
    DateModified = models.DateField(auto_now=True)
    ModifiedByUser = models.IntegerField()
class Meta:
    db_table = "User Time Info Table"