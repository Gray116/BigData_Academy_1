from django.shortcuts import render

# text 입력
def wordInput(request):
    return render(request, 'wordCnt/wordInput.html')

# < 글자 수 및 단어 세기 >
# ex) 홈길동 멋져 홍길동 예뻐
def result(request):
    full = request.GET['fullText']
    strLength = len(full) # 글자 수
    words = full.split()
    cnt = len(words) # 단어 수

    words_dic = dict() # 빈 딕셔너리
    for word in words:
        if word in words_dic.keys(): # 만약 key에 단어가 들어있으면,
            words_dic[word] += 1
        else:
            words_dic[word] = 1 # words_dic['홍길동] = 1, words_dic['멋져'] = 1

    context = {
        'full' : full,
        'strLength' : strLength,
        'cnt' : cnt,
        'dic' : words_dic.items() # [('홍길동',2), ('멋져', 1), ... ]
    }
    return render(request, 'wordCnt/result.html', context)

def about(request):
    return render(request, 'wordCnt/about.html')