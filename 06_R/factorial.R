# 연습문1. factorial 계산 함수를 작성하시오
# ex) fact(3) 결과 : 3! = 6
#     fact(-3) 결과 : 음수 값을 위한 팩토리얼은 존재x
#     fact(0) 결과 : 0! = 1
fact <- function(num){
  result <- 1 # 누적 곱
  if (num<0) {
    cat("음수 값을 위한 팩토리얼은 존재x")
  } else if(num == 0) {
    cat('0! = 1')
  } else {
    for(i in 1:num) {
      result = result * i
    }
    cat(num, '!=', result)
  }
}