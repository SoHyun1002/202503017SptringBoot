$(document).ready(function() {
    const API_URL = 'http://localhost:3000';

    // GET 요청 예제
    $('#getData').click(function() {
        $('#result').html('데이터를 가져오는 중...');
        
        // 0.5초 지연 후 요청 시작
        setTimeout(() => {
            $.ajax({
                url: `${API_URL}/items`,
                type: 'GET',
                success: function(response) {
                    const items = response.map(item => 
                        `<div class="item">ID: ${item.id}, 이름: ${item.name}</div>`
                    ).join('');
                    $('#result').html(`
                        <h3>받은 데이터:</h3>
                        ${items}
                    `);
                },
                error: function(xhr, status, error) {
                    $('#result').html('오류가 발생했습니다: ' + error);
                }
            });
        }, 500);
    });

    // POST 요청 예제
    $('#postData').click(function() {
        $('#result').html('데이터를 전송하는 중...');
        
        const message = {
            text: '안녕하세요! 이것은 POST 요청입니다.',
            timestamp: new Date().toISOString()
        };

        // 0.5초 지연 후 요청 시작
        setTimeout(() => {
            $.ajax({
                url: `${API_URL}/messages`,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(message),
                success: function(response) {
                    // 성공 메시지 표시
                    $('#result').html(`
                        <h3>전송 성공!</h3>
                        <div>메시지: ${response.text}</div>
                        <div>시간: ${new Date(response.timestamp).toLocaleString()}</div>
                    `);
                },
                error: function(xhr, status, error) {
                    $('#result').html('오류가 발생했습니다: ' + error);
                }
            });
        }, 500);
    });

    // DELETE 요청 예제
    $('#deleteData').click(function() {
        $('#result').html('메시지를 삭제하는 중...');
        
        // 0.5초 지연 후 요청 시작
        setTimeout(() => {
            // 먼저 모든 메시지를 가져옵니다
            $.ajax({
                url: `${API_URL}/messages`,
                type: 'GET',
                success: function(messages) {
                    if (messages.length === 0) {
                        $('#result').html(`
                            <h3>삭제할 메시지가 없습니다.</h3>
                            <div>메시지 목록이 비어있습니다.</div>
                        `);
                        return;
                    }

                    // 각 메시지를 순차적으로 삭제합니다
                    let deletedCount = 0;
                    messages.forEach(message => {
                        $.ajax({
                            url: `${API_URL}/messages/${message.id}`,
                            type: 'DELETE',
                            success: function() {
                                deletedCount++;
                                if (deletedCount === messages.length) {
                                    // 모든 메시지가 삭제되면 성공 메시지를 표시합니다
                                    $('#result').html(`
                                        <h3>삭제 성공!</h3>
                                        <div>${deletedCount}개의 메시지가 삭제되었습니다.</div>
                                    `);
                                }
                            },
                            error: function(xhr, status, error) {
                                $('#result').html('메시지 삭제 중 오류가 발생했습니다: ' + error);
                            }
                        });
                    });
                },
                error: function(xhr, status, error) {
                    $('#result').html('메시지 목록을 가져오는 중 오류가 발생했습니다: ' + error);
                }
            });
        }, 500);
    });
}); 