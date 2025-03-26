const API_URL = 'http://localhost:3000/posts';

// 게시글 목록 가져오기
async function getPosts() {
    try {
        const response = await fetch(API_URL);
        const posts = await response.json();
        displayPosts(posts);
    } catch (error) {
        console.error('게시글을 가져오는데 실패했습니다:', error);
    }
}

// 게시글 표시하기
function displayPosts(posts) {
    const postsList = document.getElementById('postsList');
    postsList.innerHTML = '';
    
    posts.forEach(post => {
        const postElement = document.createElement('div');
        postElement.className = 'post-item';
        postElement.innerHTML = `
            <h5>${post.title}</h5>
            <p>${post.content}</p>
            <small class="text-muted">작성자: ${post.author}</small>
            <div class="post-actions">
                <button class="btn btn-sm btn-warning" onclick="editPost(${post.id})">수정</button>
                <button class="btn btn-sm btn-danger" onclick="deletePost(${post.id})">삭제</button>
            </div>
            <div class="edit-form" id="editForm${post.id}">
                <input type="text" class="form-control mb-2" id="editTitle${post.id}" value="${post.title}">
                <textarea class="form-control mb-2" id="editContent${post.id}">${post.content}</textarea>
                <input type="text" class="form-control mb-2" id="editAuthor${post.id}" value="${post.author}">
                <button class="btn btn-sm btn-success" onclick="saveEdit(${post.id})">저장</button>
                <button class="btn btn-sm btn-secondary" onclick="cancelEdit(${post.id})">취소</button>
            </div>
        `;
        postsList.appendChild(postElement);
    });
}

// 새 게시글 작성
document.getElementById('postForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;
    const author = document.getElementById('author').value;
    
    try {
        const response = await fetch(API_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ title, content, author })
        });
        
        if (response.ok) {
            document.getElementById('postForm').reset();
            getPosts();
        }
    } catch (error) {
        console.error('게시글 작성에 실패했습니다:', error);
    }
});

// 게시글 수정 모드로 전환
function editPost(id) {
    const editForm = document.getElementById(`editForm${id}`);
    editForm.style.display = 'block';
}

// 게시글 수정 저장
async function saveEdit(id) {
    const title = document.getElementById(`editTitle${id}`).value;
    const content = document.getElementById(`editContent${id}`).value;
    const author = document.getElementById(`editAuthor${id}`).value;
    
    try {
        const response = await fetch(`${API_URL}/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ title, content, author })
        });
        
        if (response.ok) {
            cancelEdit(id);
            getPosts();
        }
    } catch (error) {
        console.error('게시글 수정에 실패했습니다:', error);
    }
}

// 게시글 수정 취소
function cancelEdit(id) {
    const editForm = document.getElementById(`editForm${id}`);
    editForm.style.display = 'none';
}

// 게시글 삭제
async function deletePost(id) {
    if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
        try {
            const response = await fetch(`${API_URL}/${id}`, {
                method: 'DELETE'
            });
            
            if (response.ok) {
                getPosts();
            }
        } catch (error) {
            console.error('게시글 삭제에 실패했습니다:', error);
        }
    }
}

// 초기 게시글 목록 로드
getPosts(); 