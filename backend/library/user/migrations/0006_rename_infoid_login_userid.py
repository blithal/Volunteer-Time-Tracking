# Generated by Django 4.0.2 on 2022-04-04 01:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0005_login'),
    ]

    operations = [
        migrations.RenameField(
            model_name='login',
            old_name='infoId',
            new_name='userId',
        ),
    ]
