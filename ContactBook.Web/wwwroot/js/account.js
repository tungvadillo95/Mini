var account = {} || account;

account.checkLogin = function () {
    if ($('#formLogin').valid()) {
        if (account.checkEmail()) {
            var email = $('#loginEmail').val();
            account.checkAccount(email);
        }
    }
}

account.login = function () {
    $('#msgLoginResult').hide();
    if ($('#formLogin').valid()) {
        var saveObj = {};
        saveObj.email = $('#loginEmail').val();
        saveObj.password = $('#loginPassword').val();
        saveObj.rememberMe = document.getElementById("rememberMe").checked;
        saveObj.returnUrl = $('#ReturnUrl').val();
        $.ajax({
            url: '/account/login',
            method: 'POST',
            dataType: 'JSON',
            contentType: 'application/json',
            data: JSON.stringify(saveObj),
            success: function (response) {
                if (response.data.accountId != null) {
                    account.getInfoUser();
                    bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                        if (saveObj.returnUrl != '') {
                            window.location.href = `${saveObj.returnUrl}`;
                        } else {
                            window.location.href = `/home/index`
                        }
                    });
                }
                else {
                    $('#msgLoginResult').text(`${response.data.message}`);
                    $('#msgLoginResult').show();
                }
            }
        });
    }
}
account.checkAccount = function (email) {
    $.ajax({
        url: `/account/checkLoginUser/${email}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            if (response.data.email != null) {
                $('#msgLoginResult').hide();
                account.login();
            } else {
                $('#msgLoginResult').text(`${response.data.message}`);
                $('#msgLoginResult').show();
            }
        }
    });
}

account.checkEmail = function () {
    var email = $('#loginEmail').val();
    var em_regex = /^\w+([\.-]?\w+)+@\w+([\.:]?\w+)+(\.[a-zA-Z0-9]{2,3})+$/;
    if (em_regex.test(email) == false) {
        $("#msgloginEmail").text('Email không đúng định dạng');
        $("#msgloginEmail").show();
        return false;
    }
    else {
        $("#msgloginEmail").hide();
        return true;
    }
}

account.addLink = function (roleName, courseId) {
    if (roleName.includes('Học sinh')) {
        $('#navControl').append(
            ` <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/transcript/details">Bảng điểm</a>
              </li>`
        )
    }
    if (roleName.includes('GVCN') && !roleName.includes('System Admin')) {
        $('#navControl').append(
            ` <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/student/index/${courseId}">Quản lý lớp</a>
              </li>`
        )
    }
    if (roleName.includes('Giáo viên')) {
        $('#navControl').append(
            ` <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/transcript/index">Nhập điểm</a>
              </li>`
        )
    }
    if (roleName.includes('System Admin')) {
        $('#navControl').append(
            ` <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/transcript/index">Nhập điểm</a>
              </li>
              <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/course/index">Quản lý lớp</a>
              </li>
              <li class="nav-item ml-2 mr-2">
                   <a class="nav-link text-dark" href="/teacher/index">Quản lý GV</a>
              </li>
              `
        )
    }
}

account.getInfoUser = function () {
    $.ajax({
        url: '/account/getInfoUser',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#dataInfo').empty();
            if (response.data.accountId != null) {
                $('#infoUser').show();
                $('#linkLogin').hide();
                $('#dataInfo').append(
                    `<p>${response.data.email}</p>
                <img src="/img/${response.data.avatarPath}" style="width: 75px;" />
                <p>${response.data.fullName}</p>`
                );
                $('#navControl').empty();
                $('#navControl').append(
                    ` <li class="nav-item ml-2 mr-2">
                            <a class="nav-link text-dark" href="/user/index">Thông tin cá nhân</a>
                        </li>`
                )
                account.addLink(response.data.roleName, response.data.responsibleId);
            } else {
                $('#infoUser').hide();
                $('#linkLogin').show();
            }
        }
    });
}

account.logOut = function () {
    $.ajax({
        url: '/account/logout',
        method: 'POST',
        dataType: 'JSON',
        success: function (response) {
            if (response) {
                window.location.href = '/'
            }
        }
    });
}

$(document).ready(function () {
    $('#infoUser').hide();
    $('#msgLoginResult').hide();
    account.getInfoUser();
});