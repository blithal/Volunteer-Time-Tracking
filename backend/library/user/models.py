from django.db import models

# Create your models here.

class info(models.Model):
    firstName = models.CharField(max_length = 40)
    lastName = models.CharField(max_length = 40)
    email = models.CharField(max_length = 60)
    phone = models.CharField(max_length = 15)
    isAdmin = models.BooleanField(default = False)
    isActive = models.BooleanField()
class Meta:
    db_table = "User Info Table"
