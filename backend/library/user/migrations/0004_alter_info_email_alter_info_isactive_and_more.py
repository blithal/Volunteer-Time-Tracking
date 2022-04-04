# Generated by Django 4.0.2 on 2022-04-03 20:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_rename_name_info_firstname_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='info',
            name='email',
            field=models.CharField(default='', max_length=60, null=True),
        ),
        migrations.AlterField(
            model_name='info',
            name='isActive',
            field=models.BooleanField(default=True, null=True),
        ),
        migrations.AlterField(
            model_name='info',
            name='isAdmin',
            field=models.BooleanField(default=False, null=True),
        ),
        migrations.AlterField(
            model_name='info',
            name='phone',
            field=models.CharField(default='', max_length=15, null=True),
        ),
    ]
