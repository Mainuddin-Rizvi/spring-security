package com.mainuddin.springsecurity.repository;

import java.util.List;

import com.mainuddin.springsecurity.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param;

@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

    @Query("SELECT n FROM Notice n WHERE :currentDate BETWEEN n.noticBegDt AND n.noticEndDt")
    List<Notice> findAllActiveNotices(@Param("currentDate") java.sql.Date currentDate);

}
