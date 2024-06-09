from django.db import models

# Create your models here.
class datasetModel(models.Model):
    data_id = models.AutoField(primary_key=True)
    dataset = models.FileField(upload_to='media/dataset/')
    date_time = models.DateTimeField(auto_now=True)
    mnb_accuracy = models.FloatField(null=True)
    mnb_precision = models.FloatField(null=True)
    mnb_recall = models.FloatField(null=True)
    mnb_f1_score = models.FloatField(null=True)
    mnb_algo = models.CharField(max_length=500,null=True)
    ad_accuracy = models.FloatField(null=True)
    ad_precision = models.FloatField(null=True)
    ad_recall = models.FloatField(null=True)
    ad_f1_score = models.FloatField(null=True)
    ad_algo = models.CharField(max_length=500,null=True)
    lr_accuracy = models.FloatField(null=True)
    lr_precision = models.FloatField(null=True)
    lr_recall = models.FloatField(null=True)
    lr_f1_score = models.FloatField(null=True)
    lr_algo = models.CharField(max_length=500,null=True)
    class Meta:
        db_table = 'Upload Dataset'

class Predict(models.Model):
    predict_id = models.AutoField(primary_key = True)
    type = models.CharField(max_length=100)
    amount = models.FloatField(null = True)
    oldbalanceOrg = models.FloatField(null = True)
    newbalanceOrig = models.FloatField(null = True)
    oldbalanceDest = models.FloatField(null = True)
    newbalanceDest = models.FloatField(null = True)
    result = models.CharField(max_length=100)
    class Meta:
        db_table = 'Predict Form Data'