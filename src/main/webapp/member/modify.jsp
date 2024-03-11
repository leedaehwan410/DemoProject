<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<title>카페24 북카페</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	 <!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
	 <link rel="stylesheet" href="../css/layout.css" />
	  <link rel="stylesheet" href="../assets/css/style.css" />  <!-- 회원가입 (temp.css 는 미사용)-->
	  <link rel="stylesheet" href="../assets/css/main.css" />
	  <link rel="stylesheet" href="../css/join.css" /> 
  <style type="text/css">
  	.change{
  		background-color: bisque !important;
  	}
  	button.drop{
  		font-size:0.85em;
  		border:none;
  		background-color: transparent;
  		color: gray;
  	}
  </style>
</head>
<body class="is-preload">
	<%@include file="../layout/header-a.jsp" %>
	<div id="page-wrapper">
    <hr>
  	<div class="cont">
                <form id="form">
                    <ul class="join-wrap">
                        <li>아이디</li>
                        <li>
                            <input class="id-input" type="text" value="${sessionScope.user.userid }" disabled/>
                            <input name="userid" type="hidden" value="${sessionScope.user.userid }"/>
                        </li>
                        <!-- <li>비밀번호 <label>(영문 대/소문자, 특수문자를 포함 10-20자로 입력해주세요.)</label>-<label>사용가능 특수문자 : !@#$%^&* </label></li>
                        <li><input name="password" type="password" placeholder="비밀번호를 입력해 주세요."/></li>
                        <li>비밀번호 확인</li>
                        <li><input name="password2" type="password" placeholder="비밀번호를 다시 한번 입력해 주세요."/></li> -->
                        <li>이름</li>
                        <li><input id="name" name="name" type="text" value="${sessionScope.user.name}" disabled/></li>
                        <li>생년월일</li>
                        <li id="birthChk"><input id="birth" name="birth" type="text" value="${sessionScope.user.birth }" disabled /></li>
                        <li>성별</li>
                        <li>
                            <input type="radio" id="male" name="gender" value="MALE" disabled>
                            <label for="male">남자</label>
                            <input type="radio" id="female" name="gender" value="FEMALE" disabled>
                            <label for="female">여자</label>
                        </li>
                        <li>전화번호</li>
                        <li><input id="phone" name="phone" type="text"  value="${sessionScope.user.phone}" class="change"/></li>
                        <li>이메일</li>
                        <li><input id="email" name="email" type="text" value="${sessionScope.user.email}" class="change"/></li>
                        <li>주소<label> (선택)</label></li>
                        <li>
                            <input class="post-input change" id="postalCode" name="postalCode" type="text" value="${sessionScope.user.postalCode }" readonly/>
                            <button type="button" onclick="showPostCode()" class="btn-m">검색</button>
                        </li>
                        <li><input id="address1" name="address1" type="hidden" placeholder="시/도" />
                            <input id="address2" name="address2" type="hidden" placeholder="구"/>
                            <input id="address3" name="address3" type="text" value="${sessionScope.user.address3 }" class="change" readonly/>
                        </li>
                        <li><input id="address4" name="address4" type="text" value="${sessionScope.user.address4 }" class="change" readonly/></li>
						<li>관심 분야</li>
						<li>
						<div id="selfavorites">
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="소설" id="novel">
	                            <label  for="novel">소설</label>
	                            </div>
	                        
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="시" id="poet">
	                            <label class="form-check-label" for="poet">시</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="만화" id="comic">
	                            <label class="form-check-label" for="comic">만화</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="에세이" id="essay">
	                            <label class="form-check-label" for="essay">에세이</label>
	                        </div>
                    <div class="col-auto">
                    		<input type="text" class="subjects form-control-sm change" id="etc" >
                    </div>
                		</div>
						</li>
                    </ul>
                    <div class="hidden">
                        <input id="adultYn" name="adultYn" type="hidden"/>
                        <input id="channel" name="channel" type="hidden"/>
                        <input id="favorites" name="favorites" type="hidden" value="${sessionScope.user.favorites }"/>
                    </div>
                    <button type="button" class="join-btn" onclick="modify()">저장</button>
                    <button class="join-btn drop "type="button" onclick="drop()">회원 탈퇴</button>
                </form>
            </div>
    <hr>
    <%@include file="../layout/footer.jsp" %>
</div>    
 <script type="text/javascript">
 	const gender = '${sessionScope.user.gender }'
 	if(gender=='MALE')
 		document.getElementById('male').checked = true
 	else
 		document.getElementById('female').checked = true
 		
 	const favorites =  document.getElementById('favorites')	//사용자의 관심분야 문자열
 	const arrAll = favorites.value.split(',')
 	const etc = document.getElementById('etc')
 	const checkItemArray=['소설','시','만화','에세이']
 	
	 let arrFavorite = arrAll.filter(item => checkItemArray.includes(item));
	 favorites.value=arrFavorite.toString()	
     let diff = arrAll.filter(item => !checkItemArray.includes(item));
	 etc.value=diff.toString()		//기타 관심분야 설정
	 
 	//관심분야 체크박스 설정
 	document.querySelectorAll('.form-check-input').forEach(item =>{
 	// checkItemArray.push(item.value)		//체크박스 항목을 여기서 알아올수도 있음.
     if(arrFavorite.length!=0 && arrFavorite.includes(item.value)) {
         item.checked=true;
     }
     else item.checked=false
 	})
     

 	
 	 // 관심분야 체크박스 이벤트
 	 const checkFavorite =e => {
	//    e.preventDefault()
	   	 e.stopPropagation()
	
	    const target = e.target
	    if(target.tagName !== 'INPUT') {return}
	
	    if(target.checked) arrFavorite.push(target.value)        //체크 상태이면 배열에 넣기
	    else {      //체크 해제 상태이면 기존 배열에서 삭제하기
	        const index = arrFavorite.indexOf(target.value);     //해당 값의 배열 위치를 알아내기
	        if (index !== -1) { arrFavorite.splice(index, 1); 	}       //해당 위치에서 삭제하기
	    }
	    favorites.value = arrFavorite.toString()
		
	}
		// id 'checkSubjects' 는 checkbox input 모두를 포함하고 있는 div 태그 입니다.
		// checkbox 요소가 많으므로 부모 요소에 이벤트를 주는 방식으로 합니다.
		document.querySelector('#selfavorites').addEventListener('click', checkFavorite)
		
	function modify() {
       favorites.value =favorites.value + "," +etc.value
        const data = $('#form').serializeObject();

        if(data.email == "") {
          alert("이메일을 입력하세요.")
          return;
        }

        if(!checkEmail(data.email))	{
          alert("이메일 형식이 올바르지 않습니다.");
          return;
        }

        console.log('modify',data);
        $.ajax({
          url        : '../api/modify',
          data       : JSON.stringify(data),
          dataType       : 'text',
          type       : 'post',
         contentType: 'application/json', 
          success : function(res){
            alert(res);
            location.href = "modify";
          },
          error : function(xhr){
            console.log(xhr);
          }
        });
      }

      /* daum 우편번호 검색 */
      function showPostCode() {
        daum.postcode.load(function() {
          new daum.Postcode({
            oncomplete : function(data) {
              $('input[name=postalCode]').val(data.zonecode);
              $('input[name=address1]').val(data.sido);
              $('input[name=address2]').val(data.sigungu);
              $('input[name=address3]').val(data.roadAddress);
              $('input[name=address4]').attr('readonly', false);
              $('input[name=address4]').focus();
            }
          }).open();
        });
      }
	
      function drop() {
    	  const res = prompt('회원 탈퇴를 하시겠습니까? \'회원탈퇴\' 라고 입력해주세요.')
    	  if(res==='회원탈퇴')
    		  location.href='drop'
    	  else
    		  alert('입력하신 글자를 다시 확인하세요.')
      }
     
 </script>
<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/swipper.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../assets/js/map.daum.js"></script>
			<script src="../assets/js/script.js"></script>
</body>
</html>
<!-- 계정 : minkr , 패스워드 : thGH123!@4 -->