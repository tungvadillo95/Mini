var teacherCourse = {} || teacherCourse;
var table = $('#tbTeachersCourse').DataTable();
var courseId = $('#courseId').val();
var SubjectId = 0;

teacherCourse.showData = function () {
    $.ajax({
        url: `/course/getCourseTeachersSubject/${courseId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#courseInfo').text('Lớp: ' + response.data.course.courseName + ', GVCN: ' + response.data.course.teacherName)
            $('#modalCourseInfo').text('Lớp: ' + response.data.course.courseName + ', GVCN: ' + response.data.course.teacherName)
            table.clear().destroy();
            $('#tbTeachersCourse>tbody').empty();
            $.each(response.data.teachers, function (i, v) {
                var actions = "";
                var img = "";
                if (v.teacherId == null) {
                    actions = `<a href="javascript:void(0)"  onclick="teacherCourse.openModal(${v.subjectId},'${v.subjectName}')" class="text-success ml-2" title="Chọn"><i class="fas fa-plus-square"></i></a>`;
                } else {
                    actions = `<a href="javascript:void(0)"  onclick="teacherCourse.editTeacher(${v.subjectId},'${v.subjectName}','${v.teacherId}')" class="text-warning ml-2" title="Cập nhật"><i class="fas fa-edit"></i></a>`;
                }
                if (v.avatarPath != null) {
                    img = `<img src="/img/${v.avatarPath}" style="width: 40px; height: 50px;" />`
                }
                $('#tbTeachersCourse>tbody').append(
                    `<tr>
                        <td>${v.subjectName != null ? v.subjectName : ""}</td>
                        <td>${v.teacherName != null ? v.teacherName : ""}</td>
                        <td>${v.email != null ? v.email : ""}</td>
                        <td>${v.phoneNumber != null ? v.phoneNumber : ""}</td>
                        <td class="text-center">
                           ${img}
                        </td>
                        <td>
                            ${actions}
                        </td>
                    </tr>`
                );
            });
            teacherCourse.drawDataTable();
        }
    });
}
teacherCourse.editTeacher = function (subjectId, subjectName, teacherId) {
    if (subjectId > 0 && teacherId != null) {
        SubjectId = subjectId;
        teacherCourse.initTeachersSubject(subjectId);
        teacherCourse.resetForm();
        $.ajax({
            url: `/teacher/get/${teacherId}`,
            method: 'GET',
            dataType: 'JSON',
            contentType: 'application/json',
            success: function (response) {
                if (response.data.accountId != null) {
                    $('#msgInfoTeacher').hide();
                    $('#dataInfoTeacher').show();
                    $('#TeacherName').text(response.data.fullName);
                    $('#GenderName').text(response.data.gender == true ? "Nam" : "Nữ");
                    $('#DobStr').text(response.data.dobStr);
                    $('#Subjects').text(response.data.subjectsStr);
                    $('#PhoneNumber').text(response.data.phoneNumber);
                    $('#Email').text(response.data.email);
                    $('#imgTeacher').attr('src', `/img/${response.data.avatarPath}`);
                    $('#SubjectTeachers').val(teacherId);
                }
                else {
                    $('#msgInfoTeacher').show();
                    $('#msgInfoTeacher').text('Không có thông tin về Giáo viên!');
                    $('#dataInfoTeacher').hide();
                }

            }
        });
        $('#modalSubjectInfo').text(`Môn học: ${subjectName}`);
        $('#modalCourseTeacherTitle').text('CẬP NHẬT GIÁO VIÊN BỘ MÔN');
        $('#addEditCourseTeacherModal').modal('show');
    }
}

teacherCourse.saveTeacher = function () {
    if ($('#fromAddEditCourseTeacher').valid()) {
        var saveObj = {};
        saveObj.courseId = parseInt($('#courseId').val());
        saveObj.teacherId = $('#SubjectTeachers').val();
        saveObj.subjectId = SubjectId;
        $.ajax({
            url: '/course/updateCourseTeacherSubject',
            method: 'POST',
            dataType: 'JSON',
            contentType: 'application/json',
            data: JSON.stringify(saveObj),
            success: function (response) {
                if (response.data.teacherId != null) {
                    $('#addEditCourseTeacherModal').modal('hide');
                    bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                        teacherCourse.showData();
                        teacherCourse.resetForm();
                    });
                } else {
                    $('#msgResult').text(`${response.data.message}`);
                    $('#msgResult').show();
                }
            }
        });
    }
}

teacherCourse.checkTeacher = function () {
    var teacherId = $('#SubjectTeachers').val();
        $.ajax({
            url: `/teacher/get/${teacherId}`,
            method: 'GET',
            dataType: 'JSON',
            contentType: 'application/json',
            success: function (response) {
                if (response.data.accountId != null) {
                    $('#msgInfoTeacher').hide();
                    $('#dataInfoTeacher').show();
                    $('#TeacherName').text(response.data.fullName);
                    $('#GenderName').text(response.data.gender == true ? "Nam" : "Nữ");
                    $('#DobStr').text(response.data.dobStr);
                    $('#Subjects').text(response.data.subjectsStr);
                    $('#PhoneNumber').text(response.data.phoneNumber);
                    $('#Email').text(response.data.email);
                    $('#imgTeacher').attr('src', `/img/${response.data.avatarPath}`);
                }
                else {
                    $('#msgInfoTeacher').show();
                    $('#msgInfoTeacher').text('Không có thông tin về Giáo viên!');
                    $('#dataInfoTeacher').hide();
                }

            }
        });
}


teacherCourse.resetForm = function () {
    $('.infoTeacher').empty();
    $('#dataInfoTeacher').hide();
    $('#msgInfoTeacher').hide();
    $('#imgTeacher').attr('src', '');
    $('#fromAddEditCourseTeacher').trigger('reset');
    $('#fromAddEditCourseTeacher').validate().resetForm();
    $('#modalSubjectInfo').empty();
    $('#msgResult').hide();
}

teacherCourse.initTeachersSubject = function (subjectId) {
    if (subjectId > 0) {
        SubjectId = subjectId;
        $('#SubjectId').val(parseInt(subjectId));
        $.ajax({
            url: `/teacher/getTeacherSubject/${subjectId}`,
            method: 'GET',
            dataType: 'JSON',
            success: function (response) {
                $('#SubjectTeachers').empty();
                $('#SubjectTeachers').append(`<option selected for="TeacherId" value="">-Chọn-</option>`);
                $.each(response.data, function (i, v) {
                    $('#SubjectTeachers').append(
                        `<option value=${v.teacherId}>${v.teacherName}</option>`
                    );
                });
            }
        });
    }
}

teacherCourse.openModal = function (subjectId, subjectName) {
    teacherCourse.resetForm();
    teacherCourse.initTeachersSubject(subjectId); 
    $('#modalSubjectInfo').text(`Môn học: ${subjectName}`);
    $('#modalCourseTeacherTitle').text('THÊM GIÁO VIÊN BỘ MÔN');
    $('#addEditCourseTeacherModal').modal('show');
}

teacherCourse.drawDataTable = function () {
    table = $("#tbTeachersCourse").DataTable(
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
                    "orderable": false
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "width": "20%"

                },
                {
                    "targets": 2,
                    "orderable": false
                },
                {
                    "targets": 3,
                    "orderable": false,
                    "width": "13%"
                },
                {
                    "targets": 4,
                    "orderable": false,
                    "width": "15%"
                },
                {
                    "targets": 5,
                    "orderable": false
                }
            ]
        }
    );
};

teacherCourse.init = function () {
    teacherCourse.showData();
}

$(document).ready(function () {
    teacherCourse.init();
});