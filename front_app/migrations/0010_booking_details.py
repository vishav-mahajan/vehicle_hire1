# Generated by Django 2.0.6 on 2019-04-22 05:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('front_app', '0009_mysiteuser_user_token'),
    ]

    operations = [
        migrations.CreateModel(
            name='booking_details',
            fields=[
                ('booking_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_detail', models.CharField(default='', max_length=255)),
                ('vehicle_detail', models.CharField(default='', max_length=255)),
                ('start_date', models.CharField(default='', max_length=255)),
                ('end_date', models.CharField(default='', max_length=255)),
                ('is_returned', models.BooleanField(default=False)),
                ('is_fine', models.BooleanField(default=False)),
                ('security_amount', models.BigIntegerField(default=0)),
                ('fine_amount', models.BigIntegerField(default=0)),
                ('balance_amount', models.BigIntegerField(default=0)),
            ],
        ),
    ]
