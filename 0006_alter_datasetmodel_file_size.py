# Generated by Django 4.1.7 on 2023-03-25 09:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0005_alter_datasetmodel_file_size'),
    ]

    operations = [
        migrations.AlterField(
            model_name='datasetmodel',
            name='file_size',
            field=models.CharField(max_length=5),
        ),
    ]
