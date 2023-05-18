<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/signUp.css">
<meta charset="EUC-KR">
<title>ȸ������</title>
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
         alert('�г����� �Է����ּ���')
         $('.inputNickname').focus();
         return;
      } else if ($("input[name=nicknameDuple]").val() != "nicknameChk") { //�г��� �ߺ�üũ �� Ȯ��
         alert('�г��� �ߺ�üũ�� ���ּ���')
         return;
      } else if (_id.trim() == '') {
         alert('���̵� �Է����ּ���')
         $('.inputId').focus();
         return;
      } else if ($("input[name=idDuple]").val() != "idChk") { //���̵� �ߺ�üũ �� Ȯ��
         alert('���̵� �ߺ�üũ�� ���ּ���')
         return;
      } else if (_pwd.trim() == '') {
         alert('��й�ȣ�� �Է����ּ���')
         $('.inputPwd').focus();
         return;
      } else if (_checkPwd.trim() == '') {
         alert('��й�ȣ�� �Է����ּ���')
         $('.inputCheckPwd').focus();
         return;
      } else if ($('.agreeCheckbox').is(':checked') == false) {
         alert('��� ���Ǹ� Ȯ�����ּ���')
         $('.agreeCheckbox').focus();
         return;
      }
      if (!confirm('�����Ͻðڽ��ϱ�?')) {
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
            alert("����")
            $("#formname1").submit();
         }
      });
   }

   // function ���� ���� pwdcheckinput ĭ�� onchange
   function pwdCheck() {
      var _pwd = $('.inputPwd').val();
      $('.inputPwd').keyup(function() {
         $('.check').html('');
      });
      $('.inputCheckPwd').keyup(function() {

         if ($('.inputPwd').val() != $('.inputCheckPwd').val()) {
            $('.check').html('��й�ȣ ��ġ���� ����<br><br>');
            $('.check').attr('color', '#f82a2aa3');
         } else {
            $('.check').html('��й�ȣ�� ��ġ�մϴ�!<br><br>');
            $('.check').attr('color', '#199894b3');
         }

      });
   };

   // nickname �ߺ�üũ
   function chkNickname() {
      var conNickname
      var _nickname = $(".inputNickname").val();

      if (_nickname.trim() == '') {
         alert('�г����� �Է��� �ּ���')
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
               alert('�ߺ��� �г����Դϴ�.');
               $('.inputNickname').focus();
               conNickname = false;
            } else if (data == 'nicknameChk') {
               alert('����� �� �ִ� �г����Դϴ�!');
               $('input[name=nicknameDuple]').attr('value', 'nicknameChk')
            }
         }
      })
      if (!conNickname)
         return;
   }

   // id �ߺ�üũ
   function chkId() {
      var conId = true;
      var _id = $(".inputId").val();

      if (_id.trim() == '') {
         alert('���̵� �Է��� �ּ���')
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
               alert('�ߺ��� ���̵��Դϴ�.');
               $('.inputId').focus();
               conId = false;
            } else if (data == 'idChk') {
               alert('����� �� �ִ� ���̵��Դϴ�!');
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
                  <div class="agreeHeader">�������� ���� �� �̿� ����</div>
                  <div class="agreeBody">(��)ANT�� OMOK �̿��� �ĺ��� ���� ID, ��й�ȣ��
                     �����ϰ� ������ ���� Ż�� �ñ��� �̿��մϴ�</div>
                  <div class="agreeFooter">
                     <input type="checkbox" id="check" class="agreeCheckbox"> <label for="check">�����մϴ�</label>
                  </div>
               </div>

               <div class="inputWrapper">

                  <div class="textForm">
                     <div>�г���</div>

                     <div class="inputForm">
                        <div class="inputText">
                           <input name="nickname" class="inputNickname" maxlength="10">
                        </div>
                        <div class="btn">
                           <input type="button" value="Ȯ��" onclick="chkNickname()">
                           <input type="hidden" name="nicknameDuple" value="nicknameUnchk">
                        </div>
                     </div>

                     <div>���̵�</div>

                     <div class="inputForm">
                        <div class="inputText">
                           <input name="id" class="inputId" maxlength="10">
                        </div>
                        <div class="btn">
                           <input type="button" value="Ȯ��" onclick="chkId()"> <input
                              type="hidden" name="idDuple" value="idUncheck">
                        </div>
                     </div>

                     <div>��й�ȣ</div>
                     <div class="inputForm">
                        <div class="inputText">
                           <input type="password" name="pwd" class="inputPwd" id="pwd"
                              onchange="pwdCheck()" maxlength="10">
                        </div>
                     </div>

                     <div>��й�ȣȮ��</div>
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
               <input type="button" class="signUpBtn" value="ȸ������"
                  onclick="signUp()">
            </div>


         </div>

      </div>
   </form>
</body>
</html>