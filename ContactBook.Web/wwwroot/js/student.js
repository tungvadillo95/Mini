var student = {} || student;
var table = $('#tbStudents').DataTable();
var courseId = $('#courseId').val();
var courseName;

student.showData = function () {
    $.ajax({
        url: `/student/gets/${courseId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            table.clear().destroy();
            $('#courseInfo').text('Lớp: ' + response.data.teacherMaster.courses + ', GVCN: ' + response.data.teacherMaster.fullName)
            courseName = response.data.teacherMaster.courses;
            $('#tbStudents>tbody').empty();
            var stt = 0;
            $.each(response.data.students, function (i, v) {
                if (v.statusName != 'Deleted') {
                    var actions = "";
                    switch (v.statusId) {
                        case 1:
                            {
                                actions = `<a href='javascript: void(0)' class='text-dark ml-2' onclick='student.changeStatusToBlocked("${v.accountId}","${v.email}")' title='Khóa'><i class='fa fa-ban'></i></a>`;
                                break;
                            }
                        case 2:
                            {
                                actions = `<a href='javascript: void(0)' class='text-success ml-2' onclick='student.changeStatusToActive("${v.accountId}","${v.email}")' title='Hoạt dộng'><i class='far fa-play-circle'></i></a>`;
                                actions += `<a href='javascript: void(0)' class='text-danger ml-2' onclick='student.delete("${v.accountId}","${v.email}")' title='Xóa'><i class='fas fa-trash'></i></a>`;
                                break;
                            }
                    }
                    $('#tbStudents>tbody').append(
                    `<tr>
                        <td>${++stt}</td>
                        <td>${v.fullName}</td>
                        <td>${(v.gender == true ? "Nam" : "Nữ")}</td>
                        <td>${v.dobStr}</td>
                        <td>${v.phoneNumber}</td>
                        <td class="text-center">
                            <span class="${(v.statusId == 1 ? "btn btn-primary" : (v.statusId == 2 ? "btn btn-warning" : "btn btn-danger"))}" style="width: 115px; height: 40px;">
                                ${v.statusName}
                            </span>
                         </td>
                        <td class="text-center">
                            <img src="/img/${v.avatarPath}" style="width: 40px; height: 50px;" />
                         </td>
                        <td>
                            <a href="javascript:void(0)"  onclick="student.details('${v.accountId}')" class="text-primary ml-2" title="Chi tiết"><i class="fas fa-eye"></i></a>
                            <a href="javascript:void(0)" class="text-warning ml-2" onclick="student.editStudent('${v.accountId}')" title="Cập nhật"><i class="fas fa-edit"></i></a>
                            ${actions}
                        </td>
                    </tr>`
                    );
                }
            });
            student.drawDataTable();
        }
    });
}

//---------------- Detalis Student -----------------

student.details = function (accountId) {
    $('#dataModal').empty();
    $.ajax({
        url: `/student/get/${accountId}`,
        method: 'GET',
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (response) {
            if (response.data.accountId != null) {
                $('#dataModalTitle').text('THÔNG TIN HỌC SINH');
                $('#dataModal').append(
                    `<h5 class="text-info text-center m-2">Học sinh: ${response.data.fullName}</h5>
                    <br />
                    <div class="row justify-content-center col-xl-12">
                        <div class="col-xl-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <p><b>Họ và tên: </b> ${response.data.fullName}</p>
                                    <p><b>Giới tính: </b> ${(response.data.gender == true ? "Nam" : "Nữ")}</p>
                                    <p><b>Ngày sinh: </b> ${response.data.dobStr}</p>
                                    <p><b>Tên lớp: </b> ${response.data.courses}</p>
                                    <p><b>Số điện thoại: </b> ${response.data.phoneNumber}</p>
                                    <p><b>Email: </b> ${response.data.email}</p>
                                    <p><b>Địa chỉ: </b>${response.data.address}</p>
                                    <p><b>Trạng thái: </b> ${response.data.statusName}</p>
                                    <p><b>Ngày tạo: </b> ${response.data.createdDateStr}</p>
                                    <p><b>Người tạo: </b> ${response.data.createdByName}</p>
                                    <p><b>Ngày cập nhật: </b> ${response.data.modifiedDateStr}</p>
                                    <p><b>Người cập nhật: </b> ${response.data.modifiedByName}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-12 text-center">
                            <img src="/img/${response.data.avatarPath}" class="m-2" style="width: 350px; height: 400px;" />
                        </div>
                    </div>`
                );
                $('#detailsData').modal('show');
            }
            else {
                bootbox.alert(`<h5 class="text-danger">Học sinh này không tồn tại !!!</h5>`)
            }
        }
    });
}


student.checkSaveStudent = function () {
    var checkSave = false;
    if ($('#fromAddEditStudent').valid()) {
        checkSave = true;
    } else {
        checkSave = false;
    }
    if (user.checkEmail() &&
        user.checkConfirmPassword() &&
        user.checkPassword() &&
        user.checkPhone() &&
        user.checkAvatar &&
        user.checkOld(5, 15)) {
        checkSave = true;
    } else {
        checkSave = false;
        user.checkEmail();
        user.checkConfirmPassword();
        user.checkPassword();
        user.checkPhone();
        user.checkOld(5, 15);
        if (!user.checkAvatar) {
            $("#msgAvatar").text('File ảnh không đúng định dạng');
            $("#msgAvatar").show();
        }
    }
    if (checkSave) {
        student.saveStudent();
    } else if (($('#AccountId').val() != null) && user.checkPhone() && user.checkEmail() && user.checkAvatar && user.checkOld(5, 15)){
        student.saveStudent();
    }
}



//---------------- Edit -----------------
student.editStudent = function (id) {
    $('#Course').prop("disabled", false);
    student.resetForm();
    $.ajax({
        url: `/student/get/${id}`,
        method: 'GET',
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (response) {
            $('#AccountId').val(response.data.accountId);
            $('#AvatarPath').val(response.data.avatarPath);
            $('#FullName').val(response.data.fullName);
            $('#Gender').val(`${response.data.gender}`);
            $('#Course').val(response.data.courseId);
            var dobString = response.data.dob.toString();
            $('#Dob').val(dobString.slice(0, 10));
            $('#Email').val(response.data.email);
            $('#PhoneNumber').val(response.data.phoneNumber);
            $('#Address').val(response.data.address);
            $('#image_upload_preview').attr('src', `/img/${response.data.avatarPath}`);
            $('#modalStudentTitle').text('CẬP NHẬT TÀI KHOẢN');
            $('#pw').hide();
            $('#cpw').hide();
            $('#addEditStudentModal').modal('show');
        }
    });
}

//---------------- Save -----------------

student.saveStudent = function () {
    if ($('#fromAddEditStudent').valid()) {
        var formData = new FormData();
        formData.append("accountId", $('#AccountId').val());
        formData.append("courseId", parseInt($('#Course').val()));
        formData.append("password", $('#Password').val());
        formData.append("gender", $('#Gender').val());
        formData.append("fullName", $('#FullName').val());
        formData.append("dob", $('#Dob').val());
        formData.append("email", $('#Email').val());
        formData.append("roleName", "Học sinh");
        formData.append("phoneNumber", $('#PhoneNumber').val());
        formData.append("address", $('#Address').val());
        var checkAvatarFile = $('#Avatar')[0].files[0];
        var checkAvatar = $('#AvatarPath').val();
        if (checkAvatarFile == null && checkAvatar == '') {
            $('#AvatarPath').val('none_avatar.png')
        }
        formData.append("avatarPath", $('#AvatarPath').val());
        formData.append('avatar', $('#Avatar')[0].files[0]);
        var accountId = $('#AccountId').val();
        var nameUrl = 'create';
        var nameMethod = 'POST';
        if (accountId != '') {
            nameUrl = 'edit';
            nameMethod = 'PATCH';
        }
        $.ajax({
            url: `/student/${nameUrl}`,
            method: `${nameMethod}`,
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.data.email != null) {
                    bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                        $('#addEditStudentModal').modal('hide');
                        student.showData();
                    });
                }
                else {
                    $('#msgResult').text(`${response.data.message}`);
                    $('#msgResult').show();
                }
            }
        });
    }
    else {
        var msg = $("#Email-error").text();
        if (msg == 'Please enter a valid email address.') {
            $("#Email-error").text('Email không hợp lệ');
        }
    }
}

//----------------Change Status -----------------

student.changeStatusToActive = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn chuyển trạng thái <b class="text-primary">Hoạt động</b> Học sinh có ID <b class="text-success">${email}</b>?`,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> Không',
                className: 'btn-success'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Có',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: `/student/changeStatusToActive/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                                student.showData();
                            });
                        } else {
                            bootbox.alert(`<h5 class="text-danger">${response.data.message} !!!</h5>`);
                        }
                    }
                });
            }
        }
    });
}

student.changeStatusToBlocked = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn chuyển trạng thái <b class="text-primary">Khóa</b> Học sinh có ID <b class="text-success">${email}</b>?`,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> Không',
                className: 'btn-success'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Có',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: `/student/changeStatusToBlocked/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                                student.showData();
                            });
                        } else {
                            bootbox.alert(`<h5 class="text-danger">${response.data.message} !!!</h5>`);
                        }
                    }
                });
            }
        }
    });
}

student.delete = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn <b class="text-primary">Xóa</b> Học sinh có ID <b class="text-success">${email}</b>?`,
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> Không',
                className: 'btn-success'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Có',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                $.ajax({
                    url: `/student/changeStatusToDeleted/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                                student.showData();
                            });
                        } else {
                            bootbox.alert(`<h5 class="text-danger">${response.data.message} !!!</h5>`);
                        }
                    }
                });
            }
        }
    });
}

student.resetForm = function () {
    $('#addEditStudentModal').modal('hide');
    $('#fromAddEditStudent').trigger('reset');
    $('#image_upload_preview').attr('src', '/img/none_avatar.png');
    $('#labelFile').text('Chọn file');
    $('#msgResult').hide();
    $('#pw').show();
    $('#cpw').show();
    $('#fromAddEditStudent').validate().resetForm();
}

student.openModal = function () {
    student.resetForm();
    $('#modalStudentTitle').text('THÊM MỚI HỌC SINH VÀ TÀI KHOẢN');
    $('#Course').val(parseInt($('#CourseId').val()));
    $('#Course').prop("disabled", true);
    $('#addEditStudentModal').modal('show');
}

student.initCourses = function () {
    $.ajax({
        url: '/course/gets',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#Course').empty();
            $.each(response.data, function (i, v) {
                $('#Course').append(
                    `<option value=${v.courseId}>${v.courseName}</option>`
                );
            });
        }
    });
}

student.drawDataTable = function () {
    table = $("#tbStudents").DataTable(
        {
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không có dữ liệu",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix": "",
                "sSearch": "Tìm:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            },
            "columnDefs": [
                {
                    "targets": 0,
                    "width": "8%"
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "width": "20%"
                },
                {
                    "targets": 2,
                    "orderable": false,
                    "width": "10%"
                },
                {
                    "targets": 3,
                    "orderable": false
                },
                {
                    "targets": 4,
                    "orderable": false,
                    "width": "14%"
                },
                {
                    "targets": 5,
                    "orderable": false,
                    "width": "10%"
                },
                {
                    "targets": 6,
                    "orderable": false,
                    "width": "10%"
                },
                {
                    "targets": 7,
                    "orderable": false,
                    "width": "15%"
                }
            ]
        }
    );
};

student.init = function () {
    student.initCourses();
    student.showData();
}

$(document).ready(function () {
    student.init();
});