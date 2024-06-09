# Generated by Django 4.1.7 on 2023-04-12 08:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0014_delete_predict'),
    ]

    operations = [
        migrations.CreateModel(
            name='Predict',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('type', models.CharField(max_length=100)),
                ('result', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'Predict Form Data',
            },
        ),
    ]
