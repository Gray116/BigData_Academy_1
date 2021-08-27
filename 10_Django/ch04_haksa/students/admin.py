from django.contrib import admin
from .models import Student

# Register your models here.
# admin에 모델을 적용
admin.site.register(Student)