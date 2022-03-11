from django.db import models

# Create your models here.

class info(models.Model):
    userId = models.IntegerField()
    ClockIn = models.DateTimeField()
    ClockOut = models.DateTimeField()
    Date = models.DateTimeField()
    DateModified = models.DateTimeField()
    ModifiedByUser = models.IntegerField()
class Meta:
    db_table = "User Time Info Table"