from django.db import models

# Create your models here.

class info(models.Model):
    id= models.AutoField((""),primary_key=True)
    name = models.CharField(max_length = 100)
    description = models.CharField(max_length = 500)
    startDate = models.DateField((""), auto_now=False, auto_now_add=False)
    startTime = models.CharField(max_length=256)
    completed = models.BooleanField()
class Meta:
    db_table = "events"