# Generated by Django 2.0.6 on 2019-05-04 08:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('front_app', '0023_auto_20190504_0931'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking_details',
            name='damage_amount',
            field=models.BigIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='booking_details',
            name='ext_amount',
            field=models.BigIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='booking_details',
            name='extension',
            field=models.BigIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='booking_details',
            name='return_date',
            field=models.CharField(default='', max_length=255),
        ),
    ]
