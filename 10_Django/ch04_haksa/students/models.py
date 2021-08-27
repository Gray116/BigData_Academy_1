from django.db import models

class Student(models.Model):
    s_name = models.CharField(max_length = 100)
    s_major = models.CharField(max_length = 100)
    s_age = models.IntegerField(default = 0)
    s_grade = models.IntegerField(default = 0)
    s_gender = models.CharField(max_length = 10) # 한글은 자당 3바이트 차지

    def __str__(self):
        return "{:10} : {:10} - {}살".format(self.s_name, self.s_major, self.s_age)