from django.db import models

# Create your models here.

class info(models.Model):
    id= models.AutoField((""),primary_key=True)
    organizer = models.CharField(max_length=100)
    name = models.CharField(max_length = 100)
    description = models.CharField(max_length = 500)
    startDate = models.DateField((""), auto_now=False, auto_now_add=False)
    startTime = models.CharField(max_length=256)
    location = models.CharField(max_length = 256)
    completed = models.BooleanField(default=False)

class enroll(models.Model):
    id = models.AutoField((""),primary_key=True)
    userId = models.IntegerField()
    eventId = models.IntegerField()

    def __str__(self):
        return str(self.id)