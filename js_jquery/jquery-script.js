$(document).ready(function() {
    const API_URL = 'http://localhost:3000/posts';

    // 게시글 목록 가져오기
    function getPosts() {
        $.ajax({
            url: API_URL,
            method: 'GET',
            success: function(posts) {
                displayPosts(posts);
            },
            error: function(error) {
                console.error('게시글을 가져오는데 실패했습니다:', error);
            }
        });
    }

    // 게시글 표시하기
    function displayPosts(posts) {
        const $postsList = $('#postsList');
        $postsList.empty();
        
        posts.forEach(function(post) {
            const postElement = `
                <div class="post-item">
                    <h5>${post.title}</h5>
                    <p>${post.content}</p>
                    <small class="text-muted">작성자: ${post.author}</small>
                    <div class="post-actions">
                        <button class="btn btn-sm btn-warning edit-btn" data-id="${post.id}">수정</button>
                        <button class="btn btn-sm btn-danger delete-btn" data-id="${post.id}">삭제</button>
                    </div>
                    <div class="edit-form" id="editForm${post.id}">
                        <input type="text" class="form-control mb-2" id="editTitle${post.id}" value="${post.title}">
                        <textarea class="form-control mb-2" id="editContent${post.id}">${post.content}</textarea>
                        <input type="text" class="form-control mb-2" id="editAuthor${post.id}" value="${post.author}">
                        <button class="btn btn-sm btn-success save-edit" data-id="${post.id}">저장</button>
                        <button class="btn btn-sm btn-secondary cancel-edit" data-id="${post.id}">취소</button>
                    </div>
                </div>
            `;
            $postsList.append(postElement);
        });
    }

    // 새 게시글 작성
    $('#postForm').on('submit', function(e) {
        e.preventDefault();
        
        const postData = {
            title: $('#title').val(),
            content: $('#content').val(),
            author: $('#author').val()
        };
        
        $.ajax({
            url: API_URL,
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(postData),
            success: function() {
                $('#postForm')[0].reset();
                getPosts();
            },
            error: function(error) {
                console.error('게시글 작성에 실패했습니다:', error);
            }
        });
    });

    // 게시글 수정 모드로 전환
    $(document).on('click', '.edit-btn', function() {
        const id = $(this).data('id');
        $(`#editForm${id}`).show();
    });

    // 게시글 수정 저장
    $(document).on('click', '.save-edit', function() {
        const id = $(this).data('id');
        const postData = {
            title: $(`#editTitle${id}`).val(),
            content: $(`#editContent${id}`).val(),
            author: $(`#editAuthor${id}`).val()
        };
        
        $.ajax({
            url: `${API_URL}/${id}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(postData),
            success: function() {
                $(`#editForm${id}`).hide();
                getPosts();
            },
            error: function(error) {
                console.error('게시글 수정에 실패했습니다:', error);
            }
        });
    });

    // 게시글 수정 취소
    $(document).on('click', '.cancel-edit', function() {
        const id = $(this).data('id');
        $(`#editForm${id}`).hide();
    });

    // 게시글 삭제
    $(document).on('click', '.delete-btn', function() {
        const id = $(this).data('id');
        if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
            $.ajax({
                url: `${API_URL}/${id}`,
                method: 'DELETE',
                success: function() {
                    getPosts();
                },
                error: function(error) {
                    console.error('게시글 삭제에 실패했습니다:', error);
                }
            });
        }
    });

    // 초기 게시글 목록 로드
    getPosts();
}); 