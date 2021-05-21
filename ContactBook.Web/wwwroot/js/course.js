var course = {} || course;
var table = $('#tbCourses').DataTable();

course.showData = function () {
    $.ajax({
        url: '/course/gets',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            table.clear().destroy();
            $('#tbCourses>tbody').empty();
            $.each(response.data, function (i, v) {
                $('#tbCourses>tbody').append(
                    `<tr>
                    <td>${v.courseId}</td>
                    <td>${v.courseName}</td>
                    <td>${v.member}</td>
                    <td>${v.teacherName}</td>
                    <td>
                        <a href="javascript:void(0)"  onclick="course.students(${v.courseId})" class="text-primary ml-2" title="Học sinh"><i class="fas fa-user-graduate"></i></a>
                        <a href="javascript:void(0)"  onclick="course.teachers(${v.courseId})" class="text-success ml-2" title="Giáo viên"><i class="fas fa-chalkboard-teacher"></i></a>
                    </td>
                </tr>`
                );
            });
            course.drawDataTable();
        }
    });
}

course.students = function (courseId) {
    window.location.href = `/student/index/` + `${courseId}`;
}

course.teachers = function (courseId) {
    window.location.href = `/teacher/teachercourse/` + `${courseId}`;
}
course.transcript = function (courseId) {
    window.location.href = `/transcript/index/`;
}

course.drawDataTable = function () {
    table = $("#tbCourses").DataTable(
        {
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
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
                    "width": "10%"
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
                    "width": "15%"
                }
            ]
        }
    );
};

course.init = function () {
    course.showData();
}

$(document).ready(function () {
    course.init();
});