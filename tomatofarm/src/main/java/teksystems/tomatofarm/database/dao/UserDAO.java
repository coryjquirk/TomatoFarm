package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    User findById(@Param("id") Integer id);

    List<User> findAll();

    List<User> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    List<User> findByLastNameIgnoreCaseContaining(@Param("lastName") String lastName);

    List<User> findByEmailIgnoreCaseContaining(@Param("emailAddress") String emailAddress);

    @Query(value = "select * from users where email = :email", nativeQuery = true)
    User findByEmail(@Param("email") String email);


}