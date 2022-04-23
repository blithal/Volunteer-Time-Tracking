from django.db import models

# Create your models here.

class info(models.Model):
    id= models.IntegerField((""),primary_key=True)
    volunteerName = models.CharField(max_length = 50)
    text = models.CharField(max_length = 800)
class Meta:
    db_table = "report"