from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    msg = 'My message는 Hello, Django'
    context = {'msg' : msg}
    return render(request, 'home/index.html', context=context)

def test(request):
    return HttpResponse('<h1>테스트 페이지</h1>'+
                        '<button onclick = history.back()>뒤로</button>')

def intId(request, id):
    msg = '숫자 ID는 ' + str(id)
    type = '숫자'
    return render(request, 'home/showId.html', {'msg' : msg, 'type' : type})

def strId(request, id):
    msg = '문자 ID는 ' + id
    type = '문자'
    context = {'msg' : msg, 'type' : type}
    return render(request, 'home/strId.html', context)