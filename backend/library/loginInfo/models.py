from django.db import models

# Create your models here.

class fieldsInfo(models.Model):
    userID = models.IntegerField()
    password = models.CharField(max_length=40)
class Meta:
    db_table = "User Login Table"