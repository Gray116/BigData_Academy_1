/* 동적인 부분(DB연동이 없는) = javascript(함수형 언어, 인터프리터 언어) */
name = prompt("이름은?", "홍길동");
document.write(name + '~ Welcome <br>');
function chk() {
    if (frm.tel.value.length < 4) {
        alert('전화번호는 4자리 이상 입력해야합니다.');
        return false; /* submit 이벤트가 제한 */
    }
}