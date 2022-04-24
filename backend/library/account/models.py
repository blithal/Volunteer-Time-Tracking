from django.db import models

# Create your models here.

class termination(models.Model):
    userId = models.IntegerField()
    Reason = models.CharField(max_length=50)
class Meta:
    db_table = "Account Termination Table"