package com.mainuddin.springsecurity.repository;

import java.util.List;

import com.mainuddin.springsecurity.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

    @Query(value = "from Notice n where CURDATE() BETWEEN noticBegDt AND noticEndDt")
    List<Notice> findAllActiveNotices();
}
