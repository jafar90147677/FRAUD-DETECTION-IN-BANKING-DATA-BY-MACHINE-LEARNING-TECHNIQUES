# Generated by Django 4.1.7 on 2023-04-11 08:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0011_remove_datasetmodel_file_size'),
    ]

    operations = [
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='user_id',
            new_name='data_id',
        ),
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='xg_accuracy',
            new_name='mnb_accuracy',
        ),
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='xg_algo',
            new_name='mnb_algo',
        ),
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='xg_f1_score',
            new_name='mnb_f1_score',
        ),
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='xg_precision',
            new_name='mnb_precision',
        ),
        migrations.RenameField(
            model_name='datasetmodel',
            old_name='xg_recall',
            new_name='mnb_recall',
        ),
    ]