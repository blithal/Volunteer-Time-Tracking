# Generated by Django 4.0.2 on 2022-04-26 08:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userTime', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='info',
            name='eventId',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
