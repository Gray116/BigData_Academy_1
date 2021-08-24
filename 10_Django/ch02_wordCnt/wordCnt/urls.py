# wordCnt 패키지 안의 urls.py : /wordCnt/...
# /wordCnt/ : text 입력
# /wordCnt/result : 입력된 text의 wordCnt
# /wordCnt/about : 도움말 페이지

from django.urls import path
import wordCnt.views
from . import views

app_name = 'wordCnt'
urlpatterns = [
    path('', wordCnt.views.wordInput, name='wordInput'),
    path('result/', wordCnt.views.result, name='result'),
    path('about/', wordCnt.views.about, name='about'),
]