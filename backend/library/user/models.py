from django.db import models

# Create your models here.

class user(models.Model):
    userID = models.IntegerField()
    name = models.CharField(max_length = 40)
    volunteerAdmin = models.CharField(max_length = 10)
    active = models.BooleanField()
class Meta:
    db_table = "User Info Table"
