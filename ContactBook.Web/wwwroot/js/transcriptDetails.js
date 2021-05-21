var transcriptDetails = {} || transcriptDetails;
var studentId = null;
transcriptDetails.showData = function () {
    $.ajax({
        url: `/transcript/getDetalisStudentPoint/${studentId}`,
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#tbTranscriptDetails>tbody').empty();
            $.each(response.data, function (i, v) {
                $('#tbTranscriptDetails>tbody').append(
                    `<tr>
                        <td>${v.subjectName}</td>
                        <td>${(v.teacherName == null ? "" : v.teacherName)}</td>
                        <td>${(v.coefficient1 == null ? "" : v.coefficient1)}</td>
                        <td>${(v.coefficient2 == null ? "" : v.coefficient2)}</td>
                        <td>${(v.coefficient3 == null ? "" : v.coefficient3)}</td>
                    </tr>`
                );
            });
        }
    });
}

transcriptDetails.getInfoUser = function () {
    $.ajax({
        url: '/account/getInfoUser',
        method: 'GET',
        dataType: 'JSON',
        success: function (response) {
            $('#studentName').empty();
            $('#courseName').empty();
            if (response.data.accountId != null) {
                $('#studentName').text('Họ và tên: ' + response.data.fullName);
                $('#courseName').text('Lớp: ' +response.data.courses);
                studentId = response.data.accountId;
                transcriptDetails.showData();
            }
        }
    });
}

transcriptDetails.init = function () {
    transcriptDetails.getInfoUser();
}

$(document).ready(function () {
    transcriptDetails.init();
});