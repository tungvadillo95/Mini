var transcript = {} || transcript;
var table = $('#tbTranscript').DataTable();
var courseId = 0;
var subjectId = 0;
var teacherId = null;
var isUpdate = false;
var studentId = null;
var subjectName = $("#Subjects option:selected").text();
var coefficient1 = '';
var coefficient2 = '';
var coefficient3 = '';

transcript.showData = function () {
    $.ajax({
        url: `/transcript/getStudentsPoint/${courseId}/${subjectId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#courseInfo').text('Lớp: ' + response.data.course.courseName);
            $('#responsible').text('GVCN: ' + response.data.course.teacherName);
            table.clear().destroy();
            $('#tbTranscript>tbody').empty();
            $.each(response.data.studentPoints, function (i, v) {
                $('#tbTranscript>tbody').append(
                        `<tr>
                        <td>${v.fullName}</td>
                        <td>${(v.gender == true ? "Nam" : "Nữ")}</td>
                        <td>${v.dobStr}</td>
                        <td>${(v.coefficient1 == null ? "" : v.coefficient1)}</td>
                        <td>${(v.coefficient2 == null ? "" : v.coefficient2)}</td>
                        <td>${(v.coefficient3 == null ? "" : v.coefficient3)}</td>
                        <td>
                            <a href="javascript:void(0)"  onclick="transcript.openModal('${v.accountId}')" class="text-primary ml-2" title="Thêm"><i class="fas fa-plus-square"></i></a>
                            <a href="javascript:void(0)" class="text-warning ml-2" onclick="transcript.updateScore('${v.accountId}')" title="Cập nhật"><i class="fas fa-edit"></i></a>
                        </td>
                    </tr>`
                    );
            });
            transcript.drawDataTable();
        }
    });
}

transcript.drawInfoStudent = function (studentId) {
    var subjectId = parseInt($('#Subjects').val());
    $('#StudentId').val(studentId);
    subjectName = $("#Subjects option:selected").text();
    $.ajax({
        url: `/transcript/getStudentPoint/${studentId}/${subjectId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
             if (response.data.accountId != null) {
                $('#tbStudentPoint>tbody').empty();
                $('#tbStudentPoint>tbody').append(
                    `<tr>
                        <td>${subjectName}</td>
                        <td>${response.data.coefficient1 == null ? '' : response.data.coefficient1}</td>
                        <td>${response.data.coefficient2 == null ? '' : response.data.coefficient2}</td>
                        <td>${response.data.coefficient3 == null ? '' : response.data.coefficient3}</td>
                    </tr>`
                 );
                 $('#StudentName').text(response.data.fullName);
                 $('#GenderName').text(response.data.gender == true ? 'Nam' : 'Nữ');
                 $('#DobStr').text(response.data.dobStr);
                 $('#Email').text(response.data.email);
                 $('#PhoneNumber').text(response.data.phoneNumber);
                 $('#imgStudent').attr('src', `/img/${response.data.avatarPath}`);
            }
        }
    });
}

transcript.updateScore = function (studentId) {
    transcript.resetForm();
    transcript.drawInfoStudent(studentId);
    var subjectId = parseInt($('#Subjects').val());
    isUpdate = true;
    $('#inputScore').hide();
    $('#Score').prop("disabled", true);
    $('#inputScoresStr').show();
    $('#ScoresStr').prop("disabled", false);
    $('#modalStudentPointTitle').text('CẬP NHẬT ĐIỂM HỌC SINH');
    isUpdate = true;
    transcript.changeCoefficient(studentId, subjectId);
}

transcript.changeCoefficient = function (studentId, subjectId) {
    $.ajax({
        url: `/transcript/getStudentPoint/${studentId}/${subjectId}`,
        method: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        success: function (reponse) {
            coefficient1 = reponse.data.coefficient1;
            coefficient2 = reponse.data.coefficient2;
            coefficient3 = reponse.data.coefficient3;
            $('#StudentId').val(reponse.data.accountId);
            $('#addEditStudentPointModal').modal('show');
        }
    });
    $("#Coefficients").change(function () {
        var coefficient = parseInt($('#Coefficients').val());
        if (coefficient == 1) {
            $('#ScoresStr').val(coefficient1)
        }
        if (coefficient == 2) {
            $('#ScoresStr').val(coefficient2)
        }
        if (coefficient == 3) {
            $('#ScoresStr').val(coefficient3)
        }
    });
}


transcript.saveScore = function () {
    let check = false;
    if (isUpdate && transcript.checkScoresStr()) {
        check = true;
    }
    if (!isUpdate && transcript.checkScore()) {
        check = true;
    }
    if ($('#formAddEditStudentPoint').valid() && check) {
        var saveObj = {};
        saveObj.isUpdate = isUpdate;
        saveObj.studentId = $('#StudentId').val();
        saveObj.subjectId = parseInt($('#Subjects').val());
        saveObj.coefficient = parseInt($('#Coefficients').val());
        saveObj.score = parseFloat($('#Score').val() == '' ? 0 : $('#Score').val());
        saveObj.scores = $('#ScoresStr').val();
        $.ajax({
            url: '/transcript/saveStudentPoint',
            method: 'POST',
            dataType: 'JSON',
            contentType: 'application/json',
            data: JSON.stringify(saveObj),
            success: function (response) {
                if (response.data.transcriptId > 0) {
                    bootbox.alert(`<h5 class="text-success">${response.data.message} !!!</h5>`, function () {
                        transcript.drawInfoStudent($('#StudentId').val());
                        $('#Coefficients').val('');
                        $('#Score').val('');
                        $('#ScoresStr').val('');
                        transcript.changeCoefficient(saveObj.studentId, saveObj.subjectId);
                    });
                } else {
                    $('#msgResult').text(`${response.data.message}`);
                    $('#msgResult').show();
                }
            }
        });
    } else {
        transcript.checkScore();
        transcript.checkScoresStr();
    }
}

transcript.checkScore = function () {
    var score = $('#Score').val();
    var scoreArr = score.split('.');
    if (!isFinite(score)) {
        $("#msgScore").text('Điểm nhập vào không đúng định dạng');
        $("#msgScore").show();
        return false;
    } else if (parseFloat(score) < 0 || parseFloat(score) > 10) {
        $("#msgScore").text('Điểm nhập vào phải lớn hơn 0 và bé hơn bằng 10');
        $("#msgScore").show();
        return false;
    } else if (scoreArr.length > 1) {
        if (scoreArr[1] > 10 || scoreArr[1] < 0) {
            $("#msgScore").text('Điểm nhập vào chỉ có thể có 1 hệ số thập phân');
            $("#msgScore").show();
            return false;
        } else {
            $("#msgScore").text('');
            $("#msgScore").hide();
            return true;
        }
    }else {
        $("#msgScore").text('');
        $("#msgScore").hide();
    }
    return true;
}

transcript.checkScoresStr = function () {
    var scoreStr = $('#ScoresStr').val();
    var scoreArr = scoreStr.split(',');
    for ( s of scoreArr) {
        let sStr = s.split('.');
        if (sStr.length > 1) {
            if (sStr[1] > 10 || sStr[1] < 0) {
                $("#msgScoresStr").text('Điểm nhập vào chỉ có thể có 1 hệ số thập phân');
                $("#msgScoresStr").show();
                return false;
            } else {
                $("#msgScoresStr").text('');
                $("#msgScoresStr").hide();
            }
        }
    }
    if (scoreStr.includes(',,') || scoreStr.includes('  ')) {
        $("#msgScoresStr").text('Dãy điểm nhập vào không hợp lệ');
        $("#msgScoresStr").show();
        return false;
    }
    for (point of scoreArr) {
        if (!isFinite(point) || point =='') {
            $("#msgScoresStr").text('Dãy điểm nhập vào không hợp lệ');
            $("#msgScoresStr").show();
            return false;
            break;
        } else if (parseFloat(point) < 0 || parseFloat(point) > 10) {
            $("#msgScoresStr").text('Điểm nhập vào phải lớn hơn 0 và bé hơn bằng 10');
            $("#msgScoresStr").show();
            return false;
            break;
        } else {
            $("#msgScoresStr").text('');
            $("#msgScoresStr").hide();
        }
    }
    return true;
}

transcript.resetForm = function () {
    $('#addEditStudentPointModal').modal('hide');
    $('#formAddEditStudentPoint').trigger('reset');
    $('#Score').empty();
    $('#msgResult').hide();
    $("#msgScore").hide();
    $('#formAddEditStudentPoint').validate().resetForm();
    coefficient1 = '';
    coefficient2 = '';
    coefficient3 = '';
    isUpdate = false;
}
transcript.openModal = function (studentId) {
    transcript.resetForm();
    transcript.drawInfoStudent(studentId);
    $('#inputScore').show();
    $('#Score').prop("disabled", false);
    $('#inputScoresStr').hide();
    $('#ScoresStr').prop("disabled", true);
    $('#modalStudentPointTitle').text('CẬP NHẬT ĐIỂM HỌC SINH');
    $('#addEditStudentPointModal').modal('show');
}

transcript.changeCourse = function () {
    $('#courseInfo').empty();
    $('#responsible').empty();
    $('#Subjects').empty();
    $('#Subjects').append(
        `<option value="0">-Chọn-</option>`
    );
    courseId = $('#Courses').val();
    table.clear().destroy();
    transcript.drawDataTable();
    if (courseId > 0) {
        transcript.initSubjects();
    }
}

transcript.changeSubject = function () {
    subjectId = $('#Subjects').val();
    if (courseId > 0 && subjectId > 0) {
        transcript.showData();
    }
}

transcript.initSubjects = function () {
    $.ajax({
        url: `/subject/getSubjectTeachingInCourse/${teacherId}/${courseId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            if (response.data.length != 0) {
                $('#Subjects').empty();
                $('#Subjects').append(
                    `<option value="0">-Chọn-</option>`
                );
                $.each(response.data, function (i, v) {
                    $('#Subjects').append(
                        `<option value=${v.subjectId}>${v.subjectName}</option>`
                    );
                });
            }
        }
    });
}

transcript.initCourses = function () {
    $.ajax({
        url: '/account/getInfoUser',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            if (response.data.accountId != null) {
                teacherId = response.data.accountId;
                $.ajax({
                    url: `/course/getCoursesTeaching/${response.data.accountId}`,
                    method: 'GET',
                    dataType: 'JSON',
                    success: function (response) {
                        if (response.data.length != 0) {
                            $('#Courses').empty();
                            $('#Courses').append(
                                `<option value="0">-Chọn-</option>`
                            );
                            $('#Subjects').empty();
                            $('#Subjects').append(
                                `<option value="0">-Chọn-</option>`
                            );
                            $.each(response.data, function (i, v) {
                                $('#Courses').append(
                                    `<option value=${v.courseId}>${v.courseName}</option>`
                                );
                            });
                        }
                    }
                });
            }
        }
    });
}

transcript.drawDataTable = function () {
    table = $("#tbTranscript").DataTable(
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
                    "orderable": false,
                    "width": "20%"
                },
                {
                    "targets": 2,
                    "orderable": false
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
                }
            ]
        }
    );
};

transcript.init = function () {
    transcript.initCourses();
    table.clear().destroy();
    transcript.drawDataTable();
}

$(document).ready(function () {
    transcript.init();
});