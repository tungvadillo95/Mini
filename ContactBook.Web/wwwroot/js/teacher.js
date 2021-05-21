var teacher = {} || teacher;
var table = $('#tbTeachers').DataTable();
var courseId = $('#courseId').val();
var courseName;

teacher.showData = function () {
    $.ajax({
        url: '/teacher/gets',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            table.clear().destroy();
            $('#tbTeachers>tbody').empty();
            var stt = 0;
            $.each(response.data, function (i, v) {
                if (v.statusName != 'Deleted') {
                    var actions = "";
                    switch (v.statusId) {
                        case 1:
                            {
                                actions = `<a href='javascript: void(0)' class='text-dark ml-2' onclick='teacher.changeStatusToBlocked("${v.accountId}","${v.email}")' title='Khóa'><i class='fa fa-ban'></i></a>`;
                                break;
                            }
                        case 2:
                            {
                                actions = `<a href='javascript: void(0)' class='text-success ml-2' onclick='teacher.changeStatusToActive("${v.accountId}","${v.email}")' title='Hoạt dộng'><i class='far fa-play-circle'></i></a>`;
                                actions += `<a href='javascript: void(0)' class='text-danger ml-2' onclick='teacher.delete("${v.accountId}","${v.email}")' title='Xóa'><i class='fas fa-trash'></i></a>`;
                                break;
                            }
                    }
                    $('#tbTeachers>tbody').append(
                        `<tr>
                        <td>${++stt}</td>
                        <td>${v.fullName}</td>
                        <td>${(v.gender == true ? "Nam" : "Nữ")}</td>
                        <td>${v.dobStr}</td>
                        <td>${v.phoneNumber}</td>
                        <td>${(v.responsible == null ? "Không" : v.responsible)}/${v.subjectsStr}</td>
                        <td class="text-center">
                            <span class="${(v.statusId == 1 ? "btn btn-primary" : (v.statusId == 2 ? "btn btn-warning" : "btn btn-danger"))}" style="width: 115px; height: 40px;">
                                ${v.statusName}
                            </span>
                         </td>
                        <td class="text-center">
                            <img src="/img/${v.avatarPath}" style="width: 40px; height: 50px;" />
                         </td>
                        <td>
                            <a href="javascript:void(0)"  onclick="teacher.details('${v.accountId}')" class="text-primary ml-2" title="Chi tiết"><i class="fas fa-eye"></i></a>
                            <a href="javascript:void(0)" class="text-warning ml-2" onclick="teacher.editTeacher('${v.accountId}')" title="Cập nhật"><i class="fas fa-edit"></i></a>
                            ${actions}
                        </td>
                    </tr>`
                    );
                }
            });
            teacher.drawDataTable();
        }
    });
}

//---------------- Detalis Student -----------------

teacher.details = function (accountId) {
    $('#dataModal').empty();
    $.ajax({
        url: `/teacher/get/${accountId}`,
        method: 'GET',
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (response) {
            if (response.data.accountId != null) {
                $('#dataModalTitle').text('THÔNG TIN GIÁO VIÊN');
                $('#dataModal').append(
                    `<h5 class="text-info text-center m-2">Giáo viên: ${response.data.fullName}</h5>
                    <br />
                    <div class="row justify-content-center col-xl-12">
                        <div class="col-xl-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <p><b>Họ và tên: </b> ${response.data.fullName}</p>
                                    <p><b>Giới tính: </b> ${(response.data.gender == true ? "Nam" : "Nữ")}</p>
                                    <p><b>Ngày sinh: </b> ${response.data.dobStr}</p>
                                    <p><b>Môn dạy: </b> ${response.data.subjectsStr}</p>
                                    <p><b>Dạy lớp: </b> ${(response.data.courses == null ? "Không" : response.data.courses)}</p>
                                    <p><b>Chủ nhiệm lớp: </b> ${(response.data.responsible == null ? "Không" : response.data.responsible)}</p>
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
                bootbox.alert(`<h5 class="text-danger">Giáo viên này không tồn tại !!!</h5>`)
            }
        }
    });
}


teacher.checkSaveTeacher = function () {
    var checkSave = false;
    if ($('#fromAddEditTeacher').valid()) {
        checkSave = true;
    } else {
        checkSave = false;
    }
    if (user.checkEmail() &&
        user.checkConfirmPassword() &&
        user.checkPassword() &&
        user.checkPhone() &&
        user.checkAvatar &&
        user.checkOld(18, 50)) {
        checkSave = true;;
    } else {
        checkSave = false;
        user.checkEmail();
        user.checkConfirmPassword();
        user.checkPassword();
        user.checkPhone();
        user.checkOld(18, 50);
        if (!user.checkAvatar) {
            $("#msgAvatar").text('File ảnh không đúng định dạng');
            $("#msgAvatar").show();
        }
    }
    if (checkSave) {
        teacher.saveTeacher();
    } else if (($('#AccountId').val() != null) && user.checkPhone() && user.checkEmail() && user.checkAvatar && user.checkOld(18, 50)) {
        teacher.saveTeacher();
    }
}

//---------------- Edit -----------------
teacher.editTeacher = function (id) {
    $.ajax({
        url: `/teacher/get/${id}`,
        method: 'GET',
        dataType: 'JSON',
        contentType: 'application/json',
        success: function (response) {
            teacher.resetForm();
            $('#AccountId').val(response.data.accountId);
            $('#AvatarPath').val(response.data.avatarPath);
            $('#FullName').val(response.data.fullName);
            $('#Gender').val(`${response.data.gender}`);
            $('#Course').val(response.data.courseId);
            var dobString = response.data.dob.toString();
            $('#Dob').val(dobString.slice(0, 10));
            let subjectIds = response.data.subjectIds;
            $('#SubjectIds').val(subjectIds.split(',')).change();
            $('#Email').val(response.data.email);
            $('#PhoneNumber').val(response.data.phoneNumber);
            $('#Address').val(response.data.address);
            $('#image_upload_preview').attr('src', `/img/${response.data.avatarPath}`);
            $('#modalTeacherTitle').text('CẬP NHẬT TÀI KHOẢN');
            $('#pw').hide();
            $('#cpw').hide();
            $('#addEditTeacherModal').modal('show');
        }
    });
}

//---------------- Save -----------------

teacher.saveTeacher = function () {
    if ($('#fromAddEditTeacher').valid()) {
        var formData = new FormData();
        formData.append("accountId", $('#AccountId').val());
        formData.append("courseId", parseInt($('#Course').val()));
        formData.append("password", $('#Password').val());
        formData.append("gender", $('#Gender').val());
        formData.append("fullName", $('#FullName').val());
      /*  formData.append("roleId", "e346ef58-52dd-485d-92a3-25a64144bdfa");*/
        formData.append("dob", $('#Dob').val());
        formData.append("email", $('#Email').val());
        formData.append("roleName", "Giáo viên");
        formData.append("phoneNumber", $('#PhoneNumber').val());
        formData.append("address", $('#Address').val());
        var subjectIds = $('#SubjectIds').val();
        var sublects = null;
        if (subjectIds.length != 0) {
            sublects = subjectIds[0];
        }
        for (let i = 1; i < subjectIds.length; i++) {
            sublects += (',' + subjectIds[i]);
        }
        formData.append("subjects", sublects);
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
            url: `/teacher/${nameUrl}`,
            method: `${nameMethod}`,
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.data.email != null) {
                    bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                        $('#addEditTeacherModal').modal('hide');
                        teacher.showData();
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

teacher.changeStatusToActive = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn chuyển trạng thái <b class="text-primary">Hoạt động</b> Giáo viên có ID: <b class="text-success">${email}</b>?`,
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
                    url: `/teacher/changeStatusToActive/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                                teacher.showData();
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

teacher.changeStatusToBlocked = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn chuyển trạng thái <b class="text-primary">Khóa</b> Giáo viên có ID: <b class="text-success">${email}</b>?`,
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
                    url: `/teacher/changeStatusToBlocked/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                             /*   $('#addEditBookModal').modal('hide');*/
                                teacher.showData();
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

teacher.delete = function (id, email) {
    bootbox.confirm({
        title: '<h4 class="text-danger">THÔNG BÁO</h4>',
        message: `Bạn có muốn <b class="text-primary">Xóa</b> Giáo viên có ID: <b class="text-success">${email}</b>?`,
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
                    url: `/teacher/changeStatusToDeleted/${id}`,
                    method: "PATCH",
                    contentType: 'JSON',
                    success: function (response) {
                        if (response.data.accountId != null) {
                            bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                               /* $('#addEditBookModal').modal('hide');*/
                                teacher.showData();
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

teacher.resetForm = function () {
    $('#addEditTeacherModal').modal('hide');
    $('#fromAddEditTeacher').trigger('reset');
    $('#image_upload_preview').attr('src', '/img/none_avatar.png');
    $('#labelFile').text('Chọn file');
    $('#msgResult').hide();
    $('#pw').show();
    $('#cpw').show();
    $(".js-example-basic-multiple").trigger("change");
    $('#fromAddEditTeacher').validate().resetForm();
}

teacher.openModal = function () {
    teacher.resetForm();
    $('#modalTeacherTitle').text('THÊM MỚI GIÁO VIÊN VÀ TÀI KHOẢN');
    $('#addEditTeacherModal').modal('show');
    $(".js-example-basic-multiple").select2({
        placeholder: "Môn học"
    });
}

teacher.initSubjects = function () {
    $.ajax({
        url: '/subject/gets',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#SubjectIds').empty();
            $.each(response.data, function (i, v) {
                $('#SubjectIds').append(
                    `<option value=${v.subjectId}>${v.subjectName}</option>`
                );
            });
        }
    });
}

teacher.drawDataTable = function () {
    table = $("#tbTeachers").DataTable(
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
                    "width": "3%"
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "width": "15%"
                },
                {
                    "targets": 2
                },
                {
                    "targets": 3,
                    "orderable": false
                },
                {
                    "targets": 4,
                    "orderable": false
                },
                {
                    "targets": 5,
                    "orderable": false
                },
                {
                    "targets": 6,
                    "orderable": false
                },
                {
                    "targets": 7,
                    "orderable": false
                },
                {
                    "targets": 8,
                    "orderable": false,
                    "width": "12%"
                }
            ]
        }
    );
};

teacher.init = function () {
    teacher.initSubjects();
    $('.js-example-basic-multiple').select2();
    $("span").css({ "width": "100%"});
    teacher.showData();
}

$(document).ready(function () {
    teacher.init();
});