$(document).ready(function() {
    // 1. 요소 선택과 조작
    $('#showHide').click(function() {
        $('.target-box').slideToggle(500);
    });

    $('#changeColor').click(function() {
        const colors = ['#1a73e8', '#28a745', '#dc3545', '#ffc107'];
        const randomColor = colors[Math.floor(Math.random() * colors.length)];
        $('.target-box').css('background-color', randomColor);
    });

    $('#addText').click(function() {
        $('.target-box p').append(' 새로운 텍스트가 추가되었습니다!');
    });

    // 2. 애니메이션 효과
    $('#fadeInOut').click(function() {
        $('.animated-element').fadeToggle(1000);
    });

    $('#slideToggle').click(function() {
        $('.animated-element').slideToggle(1000);
    });

    $('#animate').click(function() {
        $('.animated-element').animate({
            width: '200px',
            height: '200px',
            borderRadius: '0'
        }, 1000).animate({
            width: '100px',
            height: '100px',
            borderRadius: '50%'
        }, 1000);
    });

    // 3. 이벤트 처리
    $('.mouse-area').mousemove(function(e) {
        const x = e.pageX - $(this).offset().left;
        const y = e.pageY - $(this).offset().top;
        $('.coordinates').text(`X: ${Math.round(x)}, Y: ${Math.round(y)}`);
    });

    $(document).keypress(function(e) {
        $('.key-info').text(`입력된 키: ${e.key}`);
    });

    // 4. AJAX 요청
    $('#loadData').click(function() {
        $('.ajax-result').html('<p>데이터를 불러오는 중...</p>');
        
        // JSON Server에서 데이터 가져오기
        $.ajax({
            url: 'http://localhost:3000/messages',
            method: 'GET',
            success: function(data) {
                let html = '<h3>받아온 데이터:</h3>';
                data.forEach(function(item) {
                    html += `<p>${item.text}</p>`;
                });
                $('.ajax-result').html(html);
            },
            error: function() {
                $('.ajax-result').html('<p style="color: #dc3545;">데이터를 불러오는데 실패했습니다.</p>');
            }
        });
    });
}); 