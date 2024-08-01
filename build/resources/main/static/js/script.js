function handleAttendance() {
    const statusDiv = document.getElementById('attendance-status');
    const actionLink = document.getElementById('attendance-action');

    if (statusDiv.innerText === '출근전') {
        statusDiv.innerText = '근무중';
        actionLink.innerText = '퇴근하기';
    } else if (statusDiv.innerText === '근무중') {
        statusDiv.innerText = '업무종료';
        actionLink.style.display = 'none';
    }
}