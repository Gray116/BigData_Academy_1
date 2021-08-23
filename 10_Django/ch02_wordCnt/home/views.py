from django.shortcuts import render

# Create your views here.

def index(request):
    msg = 'My message는 Hello, Django'
    context = {'msg' : msg}
    return render(request, 'home/index.html', context=context)