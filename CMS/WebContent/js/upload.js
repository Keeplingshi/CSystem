/**
 * 
 */
 $(function() {
      var validate = $("#myform").validate({
       rules: {
            user: {
               maxlength: 16,
               minlength: 3,
               userName: true,
               remote: {
               url: "chk_user.php",
               type: "post",
               data: {user: function() {
                    return encodeURIComponent($("#user").val());
                }}
           }
      },
                        pass: {
                            maxlength: 16,
                            minlength: 6
                        },
                        repass: {
                            maxlength: 16,
                            minlength: 6,
                            equalTo: "#pass"
                        },
                        sex: "required",
                        email: {email: true},
                        tel: {isTel: true},
                        phone: {isMobile: true},
                        url: {url: true},
                        birthday: "dateISO",
                        years: {
                            digits: true,
                            range: [1, 40]
                        },
                        idcard: "isIdCardNo",
                        zipcode: "isZipCode",
                        photo: {
                            accept: "gif|jpg|png"
                        },
                        serverIP: "ip",
                        captcha: {
                            remote: "process.php"
                        }
                    },
                    messages: {
                        user: {
                            remote: "该用户名已存在，请换个其他的用户名！"
                        },
                        repass: {
                            equalTo: "两次密码输入不一致！"
                        },
                        sex: "请选择性别！",
                        birthday: {
                            dateISO: "日期格式不对!"
                        },
                        years: {
                            number: "工作年限必须为数字！"
                        },
                        address: "请选择地区",
                        photo: {
                            accept: "头像图片格式不对！"
                        },
                        captcha: {
                            remote: "验证码错误！"
                        },
                        low: " "
                    },
                    errorPlacement: function(error, element) {
                        if (element.is(":radio"))
                            error.appendTo(element.parent());
                        else if (element.is(":checkbox"))
                            error.appendTo(element.parent());
                        else if (element.is("input[name=captcha]"))
                            error.appendTo(element.parent());
                        else
                            error.insertAfter(element);
                    },
                    success: function(label) {
                        label.html("&nbsp;").addClass("right");
                    }
                });

                $("#getcode").click(function() {
                    $imgstr = "getcode.php?randcode=" + Math.random();
                    $(this).attr("src", $imgstr);
                });
                $("input:reset").click(function() {
                    validate.resetForm();
                });
            });
