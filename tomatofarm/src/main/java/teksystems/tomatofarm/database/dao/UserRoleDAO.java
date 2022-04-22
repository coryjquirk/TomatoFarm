package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.UserRole;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface UserRoleDAO extends JpaRepository<UserRole, Long> {
    List<UserRole> findByUserId(@Param("userId") Integer userId);

    void deleteByUserRoleAndUserId(String userRole, Integer userId);
}