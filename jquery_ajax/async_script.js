$(document).ready(function() {
    // 작업 상태 초기화
    function resetTasks() {
        $('.progress').css('width', '0%');
        $('.status').text('대기 중...');
        $('#result').html('작업을 시작해주세요...');
    }

    // 진행 상태 업데이트
    function updateProgress(taskId, progress, status) {
        $(`#progress${taskId}`).css('width', `${progress}%`);
        $(`#status${taskId}`).text(status);
    }

    // 작업 실행 함수
    function runTask(taskId, duration) {
        return new Promise((resolve) => {
            let progress = 0;
            const interval = 50; // 50ms 간격으로 업데이트
            const steps = duration / interval;
            const increment = 100 / steps;

            const timer = setInterval(() => {
                progress += increment;
                if (progress >= 100) {
                    progress = 100;
                    clearInterval(timer);
                    updateProgress(taskId, progress, '완료!');
                    resolve();
                } else {
                    updateProgress(taskId, progress, '진행 중...');
                }
            }, interval);
        });
    }

    // 작업 시작 버튼 클릭 이벤트
    $('#startDemo').click(function() {
        resetTasks();
        $('#result').html('작업이 시작되었습니다...');

        // 세 개의 작업을 동시에 시작
        Promise.all([
            runTask(1, 3000), // 3초
            runTask(2, 5000), // 5초
            runTask(3, 4000)  // 4초
        ]).then(() => {
            $('#result').html(`
                <h3>모든 작업이 완료되었습니다!</h3>
                <div>작업 1: 3초 소요</div>
                <div>작업 2: 5초 소요</div>
                <div>작업 3: 4초 소요</div>
            `);
        });
    });

    // 초기화 버튼 클릭 이벤트
    $('#resetDemo').click(function() {
        resetTasks();
    });
}); 