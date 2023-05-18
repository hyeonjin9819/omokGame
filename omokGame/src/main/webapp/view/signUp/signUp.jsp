<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/signUp.css">
<meta charset="EUC-KR">
<title>회원가입</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
   
</script>

<script>
   function signUp() {
      var _id = $(".inputId").val();
      var _pwd = $(".inputPwd").val();
      var _checkPwd = $(".inputCheckPwd").val();
      var _nickname = $(".inputNickname").val();

      if (_nickname.trim() == '') {
         alert('닉네임을 입력해주세요')
         $('.inputNickname').focus();
         return;
      } else if ($("input[name=nicknameDuple]").val() != "nicknameChk") { //닉네임 중복체크 값 확인
         alert('닉네임 중복체크를 해주세요')
         return;
      } else if (_id.trim() == '') {
         alert('아이디를 입력해주세요')
         $('.inputId').focus();
         return;
      } else if ($("input[name=idDuple]").val() != "idChk") { //아이디 중복체크 값 확인
         alert('아이디 중복체크를 해주세요')
         return;
      } else if (_pwd.trim() == '') {
         alert('비밀번호를 입력해주세요')
         $('.inputPwd').focus();
         return;
      } else if (_checkPwd.trim() == '') {
         alert('비밀번호를 입력해주세요')
         $('.inputCheckPwd').focus();
         return;
      } else if ($('.agreeCheckbox').is(':checked') == false) {
         alert('약관 동의를 확인해주세요')
         $('.agreeCheckbox').focus();
         return;
      }
      if (!confirm('가입하시겠습니까?')) {
          return;
      }

      var params = $("#formname1").serialize();
      $.ajax({
         url : '../../users/insert.do',
         type : 'post',
         data : {
            id : _id,
            pwd : _pwd,
            nickname : _nickname
         },
         success : function(result) {
            alert("성공")
            $("#formname1").submit();
         }
      });
   }

   // function 따로 만들어서 pwdcheckinput 칸에 onchange
   function pwdCheck() {
      var _pwd = $('.inputPwd').val();
      $('.inputPwd').keyup(function() {
         $('.check').html('');
      });
      $('.inputCheckPwd').keyup(function() {

         if ($('.inputPwd').val() != $('.inputCheckPwd').val()) {
            $('.check').html('비밀번호 일치하지 않음<br><br>');
            $('.check').attr('color', '#f82a2aa3');
         } else {
            $('.check').html('비밀번호가 일치합니다!<br><br>');
            $('.check').attr('color', '#199894b3');
         }

      });
   };

   // nickname 중복체크
   function chkNickname() {
      var conNickname
      var _nickname = $(".inputNickname").val();

      if (_nickname.trim() == '') {
         alert('닉네임을 입력해 주세요')
         $('.inputNickname').focus();
         return;
      }

      $.ajax({
         type : 'get',
         url : '../../users/checkNickname.do',
         data : {
            nickname : $(".inputNickname").val()
         },
         dataType : 'text',
         async : false,
         success : function(data) {
            if (data == 'nicknameUnchk') {
               alert('중복된 닉네임입니다.');
               $('.inputNickname').focus();
               conNickname = false;
            } else if (data == 'nicknameChk') {
               alert('사용할 수 있는 닉네임입니다!');
               $('input[name=nicknameDuple]').attr('value', 'nicknameChk')
            }
         }
      })
      if (!conNickname)
         return;
   }

   // id 중복체크
   function chkId() {
      var conId = true;
      var _id = $(".inputId").val();

      if (_id.trim() == '') {
         alert('아이디를 입력해 주세요')
         $('.inputId').focus();
         return;
      }
      $.ajax({
         type : 'get',
         url : '../../users/checkId.do',
         data : {
            id : $(".inputId").val()
         },
         dataType : 'text',
         async : false,
         success : function(data) {
            if (data == 'idUnchk') {
               alert('중복된 아이디입니다.');
               $('.inputId').focus();
               conId = false;
            } else if (data == 'idChk') {
               alert('사용할 수 있는 아이디입니다!');
               $('input[name=idDuple]').attr('value', 'idChk')
            }
         }
      })
      if (!conId)
         return;
   }
</script>

</head>
<body>
      <form id="formname1" action="/omokGame/users/start" method="post">

      <div class="wrapper">

         <img class="omokImg" src="../../img/omok2img.png" height="650px" width="500px" />

         <div class="signUp">
            <div class="infoForm">
               <div class="agreeForm">
                  <div class="agreeHeader">개인정보 수집 및 이용 동의</div>
                  <div class="agreeBody">(주)ANT는 OMOK 이용자 식별을 위해 ID, 비밀번호를
                     수집하고 있으며 게임 탈퇴 시까지 이용합니다</div>
                  <div class="agreeFooter">
                     <input type="checkbox" id="check" class="agreeCheckbox"> <label for="check">동의합니다</label>
                  </div>
               </div>

               <div class="inputWrapper">

                  <div class="textForm">
                     <div>닉네임</div>

                     <div class="inputForm">
                        <div class="inputText">
                           <input name="nickname" class="inputNickname" maxlength="10">
                        </div>
                        <div class="btn">
                           <input type="button" value="확인" onclick="chkNickname()">
                           <input type="hidden" name="nicknameDuple" value="nicknameUnchk">
                        </div>
                     </div>

                     <div>아이디</div>

                     <div class="inputForm">
                        <div class="inputText">
                           <input name="id" class="inputId" maxlength="10">
                        </div>
                        <div class="btn">
                           <input type="button" value="확인" onclick="chkId()"> <input
                              type="hidden" name="idDuple" value="idUncheck">
                        </div>
                     </div>

                     <div>비밀번호</div>
                     <div class="inputForm">
                        <div class="inputText">
                           <input type="password" name="pwd" class="inputPwd" id="pwd"
                              onchange="pwdCheck()" maxlength="10">
                        </div>
                     </div>

                     <div>비밀번호확인</div>
                     <div class="inputForm">
                        <div class="inputText">
                           <input type="password" name="checkPwd" class="inputCheckPwd" id="pwd"
                              onchange="pwdCheck()" maxlength="10">

                        </div>

                     </div>
                     <font class="check" size="2"></font>

                  </div>



               </div>
            </div>

            <div class="inputBtn">
               <input type="button" class="signUpBtn" value="회원가입"
                  onclick="signUp()">
            </div>


         </div>

      </div>
   </form>
</body>
</html>