$(document).ready(function() {
    // Promise 상태를 시각적으로 표시하는 함수
    function updatePromiseState(state) {
        $('.step-box').removeClass('active');
        $(`.step-box.${state}`).addClass('active');
    }

    // 결과 패널에 메시지를 추가하는 함수
    function addResultMessage(message, isError = false) {
        const resultBox = $('.result-box');
        const messageElement = $('<div>').text(message);
        if (isError) {
            messageElement.css('color', '#dc3545');
        }
        resultBox.append(messageElement);
        resultBox.scrollTop(resultBox[0].scrollHeight);
    }

    // Promise 데모 실행
    $('#startPromise').click(function() {
        // 결과 패널 초기화
        $('.result-box').empty();
        updatePromiseState('pending');
        addResultMessage('Promise가 생성되었습니다. (Pending 상태)');

        // 2초 후에 Promise가 resolve되는 예제
        const promise = new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve('Promise가 성공적으로 완료되었습니다!');
            }, 2000);
        });

        // Promise 처리
        promise
            .then(result => {
                updatePromiseState('resolved');
                addResultMessage(result);
            })
            .catch(error => {
                updatePromiseState('rejected');
                addResultMessage(error, true);
            });
    });

    // 데모 초기화
    $('#resetDemo').click(function() {
        $('.step-box').removeClass('active');
        $('.result-box').empty();
        addResultMessage('데모가 초기화되었습니다.');
    });
}); 