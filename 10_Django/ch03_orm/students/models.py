from django.db import models


class Student(models.Model):  # 이름, 전공, 나이, 학력, 성별
    id = models.AutoField(primary_key=True)
    s_name = models.CharField(max_length=100, unique=True)
    s_major = models.CharField(max_length=100)  # = Vchar2 = 100
    s_age = models.IntegerField(default=0)
    s_grade = models.IntegerField(default=1)
    s_gender = models.CharField(max_length=10)

    def __str__(self):
        return "{} : {} ( {}, {}학년, {}살, {} )".format(self.id, self.s_name, self.s_major,
                                                      self.s_grade, self.s_age, self.s_gender)
