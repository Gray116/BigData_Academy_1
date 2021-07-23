# -*- coding: utf-8 -*-
"""
피보나치 수열관련 함수
"""
from sys import argv


def fibo_print(n):
    '''
    'n 미만의 피보나치 수열을 print'
    fibo_print(10) : 0, 1, 1, 2, 3, 5, 8
    '''
    a, b = 0, 1
    while a < n:
        print(a, end = ' ')
        a, b = b, (a+b)
    print()
    
def fibo_return(n):
    'n 미만의 피보나치 수열의 list를 return한다'
    a, b = 0, 1
    result = []
    while a < n:
        result.append(a)
        a, b = b, (a+b)
    return result

if __name__ == "__main__":
    # python fibonacci.py 200
    # sys.argv : 명령행 인수
    import sys
    if len(sys.argv) > 1:
        fibo_print(int(sys.argv[1]))
    else:
        fibo_print(10)