package com.mainuddin.springsecurity.repository;
import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import com.mainuddin.springsecurity.model.Loans;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoanRepository extends CrudRepository<Loans, Long> {
    // @PreAuthorize("hasRole('USER')")
    List<Loans> findByCustomerIdOrderByStartDtDesc(long customerId);

}
