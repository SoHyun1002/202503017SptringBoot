package edu.du.sb0324;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@SpringBootTest
class Sb0324ApplicationTests {

    @Autowired
    private MyUserRepository myUserRepository;

    @PersistenceContext
    private EntityManager em;

    @Test
    @Transactional
    @Commit
    void test1() {
        // Builer 패턴 (객체 생성)
        MyUser user = MyUser.builder()
                .name("홍길동")
                .email("hong@korea.com")
                .build();

        // 엔티티 저장
        em.persist(user);         // 단순한 insert가 아니고 영속성을 띄게 됨.
        user.setName("김길동");    // 최종적으로 홍길동이 아닌 김길동이 들어가게 됨.

        // 트랜잭션 자동 커밋 (Spring의 @Transactional 덕분에 commit 불필요)
    }


    @Test
    @Transactional
    @Commit
    void test2() {
        MyUser user = em.find(MyUser.class, 1);
        System.out.println(user);
        user.setName("신길동");
        em.merge(user);
    }


    @Test
    @Transactional
    @Commit
    void test3() {
        MyUser user = em.find(MyUser.class, 2);
        user.setId(2L);
        user.setName("홍길청");
        user.setEmail("chul@korea.com");
        user.setCreatedAt(LocalDateTime.now());
        em.merge(user);
    }

    @Test
    @Transactional
    @Commit
    void test4() {
        // 이름을 기준으로 검색하는 JPQL 쿼리 작성
        TypedQuery<MyUser> query = em.createQuery("select a from MyUser a WHERE a.name = :name", MyUser.class);

        // 파라미터 바인딩
        query.setParameter("name", "신길동");

        // 결과 리스트 가져오기
        List<MyUser> list = query.getResultList();
        for(MyUser myUser : list){
            System.out.println(myUser);
        }
    }


    @Test
    @Transactional
    @Commit
    void test5() {
        // 이름을 기준으로 검색하는 JPQL 쿼리 작성
        TypedQuery<MyUser> query = em.createQuery("select a from MyUser a WHERE a.name like :name", MyUser.class);

        // 파라미터 바인딩
        query.setParameter("name", "%길%");

        // 결과 리스트 가져오기
        List<MyUser> list = query.getResultList();
        for(MyUser myUser : list){
            System.out.println(myUser);
        }
    }

    @Test
    @Transactional
    @Commit
    void test6() {
        List<MyUser> list = myUserRepository.findByName2("신길동");
        System.out.println(list);
    }
}
