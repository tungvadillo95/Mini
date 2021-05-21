var user = {} || user;
user.checkAvatar = true;

//---------------- Check Save -----------------
user.checkEmail = function () {
    var email = $('#Email').val();
    var em_regex = /^\w+([\.-]?\w+)+@\w+([\.:]?\w+)+(\.[a-zA-Z0-9]{2,3})+$/;
    if (em_regex.test(email) == false) {
        $("#msgEmail").text('Email không đúng định dạng');
        $("#msgEmail").show();
        return false;
    }
    else {
        $("#msgEmail").hide();
        return true;
    }
}

user.checkConfirmPassword = function () {
    var password = $('#Password').val();
    var confirmPassword = $('#ConfirmPassword').val();
    if (password != confirmPassword) {
        $("#msgConfirmPassword").text('Xác nhận mật khẩu không khớp');
        $("#ConfirmPassword-error").hide();
        $("#msgConfirmPassword").show();
        return false;
    }
    else {
        $("#msgConfirmPassword").hide();
        return true;
    }
}
user.checkPassword = function () {
    var pw_regex = /^(?=.*?[0-9])(?=.*?[A-Z])(?=.*?[#?!@$%^&*\-_]).{6,}$/;
    var password = $('#Password').val();
    if (pw_regex.test(password) == false) {
        $("#msgPassword").text('Mật khẩu phải ít nhất 6 ký tự, có chữ cái hoa, có chữ thường và số');
        $("#msgPassword").show();
        $("#Password-error").hide();
        return false;
    }
    else {
        $("#msgPassword").hide();
        return true;
    }
}

user.checkPhone = function () {
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8}))$/;
    var mobile = $('#PhoneNumber').val();
    if (vnf_regex.test(mobile) == false) {
        $("#msgPhone").text('Số điện thoại không đúng định dạng');
        $("#msgPhone").show();
        $("#Phone-error").hide();
        return false;
    }
    else {
        $("#msgPhone").hide();
        return true;
    }
}

user.checkOld = function (minOld, maxOld) {
    var yearNow = (new Date()).getFullYear();
    var dobStr = $('#Dob').val();
    var dobArr = dobStr.split('-');
    if (yearNow - parseInt(dobArr[0]) <= minOld) {
        $("#msgDob").text(`Tuổi không nhỏ hơn ${minOld}`);
        $("#msgDob").show();
        $("#Dob-error").hide();
        return false;
    } else if (yearNow - parseInt(dobArr[0]) > maxOld) {
        $("#msgDob").text(`Tuổi không lớn hơn ${maxOld}`);
        $("#msgDob").show();
        $("#Dob-error").hide();
        return false;
    } else {
        $("#msgDob").hide();
        return true;
    }
}
