from django.shortcuts import render, redirect
from django.db.models import Q
from django.contrib import messages
from django.core.paginator import Paginator
from userapp.models import userModel
from adminapp.models import datasetModel
import pandas as pd
from pickle import load
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score,f1_score, recall_score, precision_score, auc, roc_auc_score, roc_curve

# Create your views here.
def admin_dash(request):
    user_count = userModel.objects.all().count()
    user_accepted_count = userModel.objects.filter(user_status = 'accepted').count()
    user_penidng_count = userModel.objects.filter(user_status = 'pending').count()
    user_rejected_count = userModel.objects.filter(user_status = 'rejected').count()
    user_context = {
                'a' : user_count, 
                'b':user_accepted_count, 
                'c':user_penidng_count, 
                'd':user_rejected_count}
    return render(request, 'adminapp/admin-dashboard.html', user_context )

def active_users(request):
    active = userModel.objects.filter(user_status = 'accepted').order_by('user_id')
    paginator = Paginator(active, 5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request, 'adminapp/admin-activeusers.html', {'user': post})

def all_users(request):
    allusers = userModel.objects.filter(~Q(user_status = 'rejected')).order_by('user_id')
    paginator = Paginator(allusers, 5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request, 'adminapp/admin-allusers.html', {'user': post} )

def rejected_users(request):    
    rejected = userModel.objects.filter(user_status = 'rejected').order_by('user_id')
    paginator = Paginator(rejected, 5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request, 'adminapp/admin-rejectedusers.html', {'user': post})

def pending_users(request):
    pending = userModel.objects.filter(user_status = 'pending').order_by('user_id')
    paginator = Paginator(pending, 5)
    page_number = request.GET.get('page')
    post = paginator.get_page(page_number)
    return render(request, 'adminapp/admin-pendingusers.html', {'user': post})

def accept_user(request, id):
    status_update = userModel.objects.get(user_id = id)
    status_update.user_status = 'accepted'
    status_update.save()
    messages.success(request, 'User was accepted!')
    return redirect ('pending_users')

def reject_user(request, id):
    status_update2 = userModel.objects.get(user_id = id)
    status_update2.user_status = 'rejected'
    status_update2.save()
    messages.info(request, 'User was rejected!')
    return redirect('pending_users')

def change_status(request, id):
    status_update = userModel.objects.get(user_id = id)
    if status_update.user_status == 'accepted':
        status_update.user_status = 'rejected'
        messages.info(request, 'User status changed to rejected!')
    
    status_update.save()
    return redirect('active_users')

def delete_user(request, id):
    userModel.objects.get(user_id = id).delete()
    messages.warning(request, 'User was Deleted..!')
    return redirect('allusers')


def upload_dataset(request):
    if request.method == 'POST':
        file = request.FILES['file']
        datasetModel.objects.create( dataset = file)
        messages.success(request, 'Your dataset was uploaded!')
        return redirect('view_dataset')
    return render(request, 'adminapp/admin-uploaddataset.html')

def view_dataset(request):
    data =datasetModel.objects.all().order_by('-data_id').first()
    file=str(data.dataset)   
    df=pd.read_csv(file,index_col=0)
    table=df.to_html(table_id='data_table')

    return render(request, 'adminapp/admin-viewdataset.html', {'data' : table})


def delete_dataset(request, id):
    dataset = datasetModel.objects.get(data_id = id).delete()
    messages.warning (request, 'Dataset was deleted!')
    return redirect('view_dataset')

def admin_view_profile(request, id):
    user = userModel.objects.get(user_id = id)
    context = {"user": user}
    return render(request, 'adminapp/admin-view-profile.html', context)


def logreg(request):
    dataset = datasetModel.objects.all().order_by('-data_id').first()
    return render(request, 'adminapp/admin-alg-logreg.html', {'data' : dataset})
 
def multinb(request):
    dataset = datasetModel.objects.all().order_by('-data_id').first()
    return render(request, 'adminapp/admin-alg-multinb.html', {'data' : dataset})

def adaboost(request):
    dataset = datasetModel.objects.all().order_by('-data_id').first()
    return render(request, 'adminapp/admin-alg-adaboost.html', {'data' : dataset})

def ada_run(request, id):
    data =datasetModel.objects.get(data_id=id)
    file=str(data.dataset)
   
    df=pd.read_csv(file)
    model = load(open(r'algorithms\algo\AdaBoostClassifier.pkl','rb'))
    encoder=load(open(r'algorithms\encoder\encoder.pkl','rb'))
    df['type']=encoder.transform(df['type'])
    X= df.drop(columns=['isFraud'], axis=1)
    Y = df['isFraud']
    x_train,x_test,y_train,y_test=train_test_split(X,Y,test_size=0.2,random_state=0)
    model = load(open(r'algorithms\algo\AdaBoostClassifier.pkl','rb'))
    prediction=model.predict(x_test)
    Accuracy = accuracy_score(prediction,y_test)
    precision = precision_score(prediction,y_test,average = 'macro')
    recal = recall_score(prediction,y_test,average = 'macro')
    f_score = f1_score(prediction,y_test,average = 'macro')
    data.ad_accuracy = Accuracy
    data.ad_precision = precision
    data.ad_recall = recal
    data.ad_f1_score = f_score
    data.ad_algo = 'ADA Boost'
    data.save()
    messages.success(request, 'ADA Boost Algorithm was run successfully!')
    return redirect('adaboost')

def lr_run(request, id):
    data =datasetModel.objects.get(data_id=id)
    file=str(data.dataset)
   
    df=pd.read_csv(file)
    model = load(open(r'algorithms\algo\LogisticRegression.pkl','rb'))
    encoder=load(open(r'algorithms\encoder\encoder.pkl','rb'))
    df['type']=encoder.transform(df['type'])
    X= df.drop(columns=['isFraud'], axis=1)
    Y = df['isFraud']
    x_train,x_test,y_train,y_test=train_test_split(X,Y,test_size=0.2,random_state=0)
    model = load(open(r'algorithms\algo\LogisticRegression.pkl','rb'))
    prediction=model.predict(x_test)
    Accuracy = accuracy_score(prediction,y_test)
    precision = precision_score(prediction,y_test,average = 'macro')
    recal = recall_score(prediction,y_test,average = 'macro')
    f_score = f1_score(prediction,y_test,average = 'macro')
    data.lr_accuracy = Accuracy
    data.lr_precision = precision
    data.lr_recall = recal
    data.lr_f1_score = f_score
    data.lr_algo = 'Logistic Regression'
    data.save()
    messages.success(request, 'Logistic Regression Algorithm was run successfully!')
    return redirect('logreg')

def mnb_run(request, id):
    data =datasetModel.objects.get(data_id=id)
    file=str(data.dataset)
    
    df=pd.read_csv(file)
    model = load(open(r'algorithms\algo\MultinomialNB.pkl','rb'))
    encoder=load(open(r'algorithms\encoder\encoder.pkl','rb'))
    df['type']=encoder.transform(df['type'])
    
    X= df.drop(columns=['isFraud'], axis=1)
    Y = df['isFraud']
    x_train,x_test,y_train,y_test=train_test_split(X,Y,test_size=0.2,random_state=0)
    model = load(open(r'algorithms\algo\MultinomialNB.pkl','rb'))
    prediction=model.predict(x_test)
    Accuracy = accuracy_score(prediction,y_test)
    precision = precision_score(prediction,y_test,average = 'macro')
    recal = recall_score(prediction,y_test,average = 'macro')
    f_score = f1_score(prediction,y_test,average = 'macro')
    data.mnb_accuracy = Accuracy
    data.mnb_precision = precision
    data.mnb_recall = recal
    data.mnb_f1_score = f_score
    data.mnb_algo = 'Multinomial Naive Bayes'
    data.save()
    messages.success(request, 'Multinomial Naive Bayes Algorithm was run successfully!')
    return redirect('multinb')



def analysis(request):
    try:
        data = datasetModel.objects.all().order_by('-data_id').first()
        ada_a = data.ad_accuracy*100
        ada_p = data.ad_precision*100
        ada_r = data.ad_recall*100
        ada_f = data.ad_f1_score*100
        mnb_a = data.mnb_accuracy*100
        mnb_p = data.mnb_precision*100
        mnb_r = data.mnb_recall*100
        mnb_f = data.mnb_f1_score*100
        lr_a = data.lr_accuracy*100
        lr_p = data.lr_precision*100
        lr_r = data.lr_recall*100
        lr_f = data.lr_f1_score*100
        context = {
            'ada_a':ada_a,
            'ada_p':ada_p,
            'ada_r':ada_r,
            'ada_f':ada_f,
            'mnb_a':mnb_a,
            'mnb_p':mnb_p,
            'mnb_r':mnb_r,
            'mnb_f':mnb_f,
            'lr_a':lr_a,
            'lr_p':lr_p,
            'lr_r':lr_r,
            'lr_f':lr_f,
        }
        return render(request, 'adminapp/admin-analysis.html',context)
    except:
        messages.warning(request,'Run all 3 algorithms to compare values')
        return redirect('view_dataset')

