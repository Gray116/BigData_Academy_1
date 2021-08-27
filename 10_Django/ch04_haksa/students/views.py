from django.shortcuts import render
from .models import Student

from django.http import HttpResponseRedirect
from django.urls import reverse

from django.shortcuts import redirect

# 학생 목록 출력
def listAll(request):
    try:
        msg = request.GET['msg']
    except:
        msg = ''
    qs = Student.objects.all()
    context = {'student_list':qs, 'cnt':len(qs), 'msg':msg}
    return render(request, 'students/studentListAll.html', context)

# 학생 등록 페이지로 이동
def registerStudent(request):
    return render(request, 'students/registerStudent.html')

def registerConStudent(request):
    name = request.POST['name']
    major = request.POST['major']
    age = request.POST['age']
    grade = request.POST['grade']
    gender = request.POST['gender']

    qs = Student(s_name = name, s_major = major, s_age = age,
                 s_grade = grade, s_gender = gender)
    qs.save()
    return HttpResponseRedirect(reverse('students:listAll'))

def detailStudent(request, name):
    try:
        qs = Student.objects.get(s_name = name)
    except:
        qs = Student.objects.filter(s_name__contains = name) # 없으면 빈 리스트
        if qs:
            qs = qs[0]
        else:
            qs = ''
    context = {'student' : qs}
    return render(request, 'students/detailStudent.html', context)

# 학생 수정 페이지
def modifyStudent(request, name):
    try:
        qs = Student.objects.get(s_name = name)
    except:
        qs = Student.objects.filter(s_name__contains = name) # 없으면 빈 리스트
        if qs:
            qs = qs[0]
    context = {'student' : qs}
    return render(request, 'students/modifyStudent.html', context)

# 수정한 학생정보 저장
def modifyConStudent(request):
    name = request.POST['name']
    major = request.POST['major']
    age = request.POST['age']
    grade = request.POST['grade']
    gender = request.POST['gender']

    try:
        qs = Student.objects.get(s_name = name)
    except:
        qs = Student.objects.filter(s_name__contains = name) # 없으면 빈 리스트
        if qs:
            qs = qs[0]

    qs.s_major = major
    qs.s_age = age
    qs.s_grade = grade
    qs.s_gender = gender

    qs.save()
    return HttpResponseRedirect(reverse('students:listAll'))

# 학생 삭제
def deleteStudent(request, name):
    try:
        qs = Student.objects.filter(s_name__contains = name)[0]
        qs.delete()
        msg = '삭제 성공'
    except:
        pass

    return redirect('/students/listAll?msg='+msg)



















