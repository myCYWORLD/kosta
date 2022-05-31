# HTML(Hypertext Markup Language)

## HTML

시작태그와 종료태그로 구성되는 마크업언어 ( 시작태그와 종료태그는 짝을 이루어야 한다)

일반 텍스트 문서와의 차이점

link → 일반 텍스트에는 없지만 html은 링크를 클릭해서 바로 볼 수 있음

 

웹표준화 / 웹접근성

1. 웹표준화
    
    브라우저에 관계없이 같은 결과가 나타나도록 표현
    
2. 웹접근성
    
    확대나 축소를 해도 화면 구성이 깨지지 않도록 표현
    

element - 태그 시작부터 끝까지

![Untitled](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled.png)

<!DOCTYPE html> HTML 5라고 문서 유형을 알려주는 것 →문서 맨 처음에 꼭 있어야함

- 태그
    
    **<head>**
    
    <h1~h6> 숫자가 작아질수록 글씨 크기는 커짐 →자동줄바꿈
    
    head태그의 하위태그 - <title>,<style>,<meta>,<link><script>,<base>
    
    <title> -생략하지말고 꼭 써주기
    
    **<link>** 잘 만들어 놓으면 편리하게 사용할 수 있고 코드가 간결해진다. 그렇지만 한눈에 보기 어려움.  외부스타일파일 사용 권장 end태그없음
    
    <meta> - 인코딩 태
    
    - <meta charset="UTF-8">
    - <meta name="viewport" content="width=divice-width, initial-scale=1.0"> →휴대폰에 최적화시킴
    
    <radio> - 단일선택하게 해주는 것 (input태그 속성)
    
    for를 가지고 있는 input태그가 선택 됨
    
    checked속성 → 기본 선택
    
    **HTML Comment Tag**
    
    <! - -                  - - > ctrl+shift+slash 두칸정도 들여서 써주시래,,,나 이거 언제 다 정리해,,하,,
    
    파일이름 소소소소소소소소소문자
    
    백그라운드 속성으로 할 때에는 컬러 속성명  or 속성
    
    <p> 문단을 나눠줌
    
    <a> 링크태그
    
    <p></p> → end태그 오류 날 수 있으므로 꼭 써주는게 좋음 p태그 자동줄바꿈
    
    <br> 줄바꿈 body도 없고 close태그도 따로 없음 (empty tag) inline요소 end 태그 없음
    
    empty elements
    
    <blockquote> 인용
    
    시멘틱태그 (<div>의 변형 -모두 block요소 줄바꿈 가능하고 크기변경도 가능) 
    
    header 나 footer는 div 태그로 나눠 만드는 것과 효과는 같음 시멘틱태그 쓰는걸 권장
    
    ![Untitled](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled%201.png)
    
    - <header> - 제목
    - <footer> - copyright 같은것들
    - <section> - 문서의 큰 카테고리
    - <article> - section이 포함하고 있.,,?
    - <aside> - 오른쪽이나 왼쪽 공백 사용 (ex_advertisement)
    - <nav> - 링크의 네비게이터 역할 (위치가 어디에 있어도 상관없음)
    - <figure> - 이미지나 다이어그램이 있다는 의미만 담고 있는 태그(구분지을때사용)
    - <figcaption> - <figure>내에서 이미지에 캡션 달고 싶으면  사용
    - <address> - 이태릭체
    
    ![Untitled](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled%202.png)
    
    → 효과를 내거나 하지 않음 (효과 내고 싶으면 style이용)
    
    ![Untitled](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled%203.png)
    
    ```html
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>서타일 이용해보기</title>
    </head>
    <body>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">DIV1</div>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">DIV2</div>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">DIV3</div>
    
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">SPAN1</span>
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">SPAN2</span>
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">SPAN3</span>
    </body>
    </html>
    ```
    
    DIV3과 SPAN사이 공백 생기게 하고 싶으면
    
    ![Untitled](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled%204.png)
    
    ```html
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>서타일 이용해보기</title>
    </head>
    <body>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;"
    			>DIV1(block요소:자동줄바꿈, 크기지정가능, 상하마진가짐, 상하마진겹침)</div>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;"
    			display:inline;">DIV2(inline 요소: 자동줄바꿈 안됨, 크기지정안됨, 상하마진없음) </div>
    <div style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;
    			display:inline-block;">DIV3 (inline-block요소: 줄바꿈 안됨, 크기지정가능, 상하마진 가짐)</div>
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;
    			 display:block;">SPAN1(block요소)</span>
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">SPAN2</span>
    <span style="background-color:lightgray;border:1px solid;padding:3px;margin:2px;width:200px;">SPAN3</span> 
    </body>
    </html>
    ```
    
    <class>
    
    ```html
    <head>
    <meta charset="UTF-8">
    <title>서타일 이용해보기</title>
    <style>
    .sample{background-color:lightgray;
      border:1px solid;
      padding:3px;
      margin:2px;
      width:200px;
    }
    </style>
    </head>
    <body>
    <div class="sample">DIV1(block요소:자동줄바꿈, 크기지정가능, 상하마진가짐, 상하마진겹침)</div>
    <div class= "sample" style="display:inline;">DIV2(inline 요소: 자동줄바꿈 안됨, 크기지정안됨, 상하마진없음) </div>
    <div class= "sample" style="display:inline-block;">DIV3 (inline-block요소: 줄바꿈 안됨, 크기지정가능, 상하마진 가짐)</div>
    
    <span class= "sample" style=display:block;">SPAN1(block요소)</span>
    <span class= "sample">SPAN2 </span>
    <span class= "sample">SPAN3 </span>
    </body>
    </html>
    ```
    
    inline 요소 자동 줄바꿈 X 크기변경 X
    
    <span>
    
    id 속성값은 중복되서는 안됨
    
    “#” - id값
    
    시작태그에 속성 써줌
    
    <a href="[https://www.w3schools.com](https://www.w3schools.com/)">Visit W3Schools</a>
    

속성에 대한 값은 큰따옴표ㅑ

![img 태그 속성으로 alt속성 꼭 작성해주기](HTML(Hypertext%20Markup%20Language)%205a6aae0c001649c6988f0acfde8e38b5/Untitled%205.png)

img 태그 속성으로 alt속성 꼭 작성해주기

소문자 작성 권장

WorldWideWeb - WWW - 웹

이미지태그에 width와 height 적용할 수 있음

<tagname> Content goes here... </tagname>

               ↪️element body

테이블 태그에 tbody가 없으면 웹브라우저에서 자동으로 tbody를 만들어냄

size 와 maxlength 다름 size 보여줄 수 있는 크기 maxlength는 입력할 수 있는 크기

placeholder 힌트제공

input  요소들은 block ㅌ

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.html</title>
</head>
<body>

<form>
  <input type="text" size="5" name="t1" value="전승현바보">
  <input maxlength="5" placeholder="5자리만 입력가능합니다">
  <input type="password">
  
  <input type="checkbox">ONE      ->checkbox = 다중선택
  <input type="checkbox">TWO
  <input type="checkbox">THREE
  
  <input type="radio" name="r">ONE     ->radio = 택 1
  <input type="radio" name="r">TWO
  <input type="radio" name="r">THREE
  
  <input type="hidden" name="h" value="hv">
  <input type="file">
</form>

</body>
</html>
```

- HTML HISTORY
    
    W3C(웹표준화단체)
    
    VERSION 
    
    : HTML1 → HTML2 →HTML3 → HTML4 (1997) → XHTML1 → HTML5
    
                                                         **↳** 90년대 말~00년대 초 웹 활성화
    
    2005년 이후 WEB발전 : 플랫폼의 역할(저장소, 어플실행)
    
                                                 **↳** 크롬,사파리,오페라···
    
    WHAT workgroup(브라우저 관련 기업들이 모여 만든 단체)
    
     → 브라우저 플랫폼 기능을 표준화 시킴 (API제공)
    
    HTML5 →WHATworkgroup이 만든 것을 W3C가 허용한 것.
    
    데이터구조화 태그(시멘틱태그) + 플랫폼기능 API(CANVAS, AUDIO, VIDEO ···)
    
    MarkupLanguage  : 태그로 구성된 언어 
    
    - SGML : 데이터의 구조, 표현 역할
    - XML : 데이터의 구조화를 위한 언어 (SGML의 subset)
        - 장점 : 구조화 하기 좋다
        - 단점 : 문법이 까다롭다
            - 대소문자 구분
            - 시작태그와 종료태그가 쌍을 이뤄야함 (ex_<br></br>)
            - 속성값을 “ ”으로 둘러싸야함
    - HTML : 데이터의 표현을 위한 언어 (SGML의 subset)
    - 사용하기 편리
    - 대소문자 구분이 없음, <br>, 속성값은 따옴표 무관
    
    태그가 데이터들을 구조화 → XML로 처리