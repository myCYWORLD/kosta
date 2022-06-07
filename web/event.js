//1. 문서의 끝까지 해석 후 dom 트리가 완성되고 화면에 렌더링할 준비가 되면 
//window객체의 load이벤트가 발생한다

//dom트리 작성이 완료 될때까지 기다림
//window객체의 load이벤트 발생을 감시했다가 
//이벤트가 발생하면 function()이 자동호출됨
window.addEventListener("load", function(){ //window객체의 load event
    //dom트리의 tyoe속성이 input객체 찾기
    var txtObj = document.querySelector("input[type=text]");
    //dom트리의 button객체 찾기
    var btObj = document.querySelector("button");
    //button객체가 click 이벤트가 발생했을 때 function()이 자동호출
    btObj.addEventListener("click",function() {
        alert('클릭되었습니다');
        //다른 조작하고 싶을 때
        txtObj.value = '클릭되었습니다';
    });
    //onclick속성 사용 안함
    
    //--------------------계산기 START--------------------
    // DOM 트리에서 class 속성 값이 calculator인 객체의 자식 중 모든 button객체
    
    // var btArr = this.document.querySelectorAll("div.calculator>button");
    // for(var i=0 ; i< btArr.length; i++){ // 12번 반복하면서 클릭까지의 실행을 준비
    //     btArr[i].addEventListener('click', function(){ // 클릭 되었을 때 add 자동호출(실행)됨
    //         console.log(i,'버튼 클릭 되었습니다.');
    //     });
    // }

    var btArr = this.document.querySelectorAll("div.calculator>button");
    for(var i=0 ; i< btArr.length; i++){ // 12번 반복하면서 클릭까지의 실행을 준비
      (function(j){
        btArr[j].addEventListener('click', function(){ // 클릭 되었을 때 add 자동호출(실행)됨
          console.log(j,'버튼 클릭 되었습니다.');
        });
      }) (i);  //이름 없는 함수
    }

    //--------------------계산기 END--------------------


    //------------------SELECT START---------------------
    var selectsidotObj = document.querySelector("div.select>select.sido");
    var selectSigunguObj = document.querySelector("div.select>select.sido");


    var selectObj = document.querySelector("div.select>select.sido");
    selectObj.addEventListener('click', function(){
        console.log(this.value, '클릭되었습니다');
    });
    selectObj.addEventListener('change', function(){
        console.log(this.value, '변경되었습니다');
        switch(this.value){
            case '서울시':
                var seoul = '<option> 구를 선택하세요</option>';
                seoul += '<option>중구</option>';
                seoul += '<option>강북구</option>';
                seoul += '<option>강동구</option>';
                seoul += '<option>강남구</option>';
                seoul += '<option>강서구</option>';
                selectSigunguObj.innerHTML = 'seoul';
                selectSigunguObj.style.display = 'inline-block';
                break;
            case '제주도':
                selectSigunguObj.innerHTML = '';
                var jeju = '<option>시를 선택하세요</option>';
                jeju += '<option>제주시</option>';
                jeju += '<option>서귀포시</option>';
                selectSigunguObj.innerHTML = 'jeju';
                selectSigunguObj.style.display = 'inline-block';
                break;
            default:  
                selectSigunguObj.innerHTML = '';
                selectSigunguObj.style.display = 'inline-block';   
        }
    });
    //------------------SELECT END-----------------------
    //------------------KEBOARD START-----------------------
    var inputObj = document.querySelector("div.keyboard>input[type=text]");
    inputObj.addEventListener('click', function(){
        console.log('input객체 클릭되었습니다');
    });
    inputObj.addEventListener('focus', function(){
        console.log('input객체 포커스 받았습니다.');
        this.style.color = 'blue';
    });

    //kevboard -> keypress ->keyup
    inputObj.addEventListener('keyup', function(event) {
        alert('입력된 키 값:' + event.key);
        if(event.key == 'Enter'){
        }
    });
    //------------------KEBOARD END-----------------------

    //------------------SUBMIT START-----------------------
    //전송관련 이벤트 :버튼의 click 이벤트 -> 폼의 sumit이벤트 ->폼의 submit 이벤트 기본처리전송
    var btSubmitObj = document.querySelector('div.submit>form>button');
    var formObj = document.querySelector('div.submit>form');
    var textSubmitObj = document.querySelector('div.submit>form>input[name=t]');
    btSubmitObj.addEventListener('click', function(){
      alert('전송버튼 클릭 이벤트가 발생했습니다');
    });
    formObj.addEventListener('submit', function(event){
      alert('form의 submit 이벤트가 발생했습니다');
      if(textSubmitObj.value == ''){
        alert('값을 입력하세요');
        event.preventDefault(); // 기본이벤트 처리 금지
      }
    });
    //------------------SUBMIT  END----------------------


    //------------------a  START------------------------
    //이동관련 이벤트 : a객체의 클릭이벤트 -> 클릭이벤트 기본처리(이동)
    //이벤트전파 : 하위객체에서 발생한 이벤트가 상위객체로 전파
    var divAObj = this.document.querySelector("div.a");
    divAObj.addEventListener('click', function() {
        this.style.backgroundColor = 'yellow';
    });
    var aObj = document.querySelector("a");
    aObj.addEventListener('click', function(event){
        this.style.backgroundColor = 'green';
        event.preventDefault(); //기본이벤트처리 금지
        event.stopPropagation();//이벤트 전파 중지(자식쪽에서 써줘야 함)
    });
    //------------------a    END------------------------
});
