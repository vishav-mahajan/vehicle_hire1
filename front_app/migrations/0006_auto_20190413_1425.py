# Generated by Django 2.0.6 on 2019-04-13 08:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('front_app', '0005_auto_20190412_1138'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mysiteuser',
            name='otp',
            field=models.CharField(default='', max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='mysiteuser',
            name='otp_time_generation',
            field=models.CharField(default='', max_length=255, null=True),
        ),
    ]
