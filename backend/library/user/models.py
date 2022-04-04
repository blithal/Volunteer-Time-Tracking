from django.db import models

# Create your models here.

class info(models.Model):
    firstName = models.CharField(max_length = 40)
    lastName = models.CharField(max_length = 40)
    email = models.CharField(default = "", max_length = 60, null=True)
    phone = models.CharField(default = "", max_length = 15, null=True)
    isAdmin = models.BooleanField(default = False, null=True)
    isActive = models.BooleanField(default = True, null=True)

    def __str__(self):
        return self.title

class login(models.Model):
    userId = models.CharField(max_length=40)
    username = models.CharField(max_length=40)
    password = models.CharField(max_length=40)

    def __str__(self):
        return self.title