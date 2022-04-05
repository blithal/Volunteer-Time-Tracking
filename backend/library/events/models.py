from django.db import models

# Create your models here.

class info(models.Model):
    id= models.IntegerField((""),primary_key=True)
    name = models.CharField(max_length = 100)
    description = models.CharField(max_length = 500)
    startDate = models.DateField((""), auto_now=False, auto_now_add=False)
    startTime = models.TimeField((""), auto_now=False, auto_now_add=False)
    completed = models.BooleanField()
class Meta:
    db_table = "events"