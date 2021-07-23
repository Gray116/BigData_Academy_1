'(sample_pac/cd/c.py)'
'참조할 위치 : sample_pac/ab/a.py'
from .. ab import a
# .. 은 상위 폴더
# . 은 현재 폴더
def nice():
    print("nice - c모듈안")
    a.hello()