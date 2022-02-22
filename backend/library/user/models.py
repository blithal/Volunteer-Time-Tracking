from django.db import models

# Create your models here.

class info(models.Model):
    name = models.CharField(max_length = 40)
    volunteerAdmin = models.BooleanField(default = False)
    active = models.BooleanField()
class Meta:
    db_table = "User Info Table"
