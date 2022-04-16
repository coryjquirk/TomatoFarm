package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import teksystems.tomatofarm.database.entity.User;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

//    public User findById(@Param("id") Long id);
    public User findById(@Param("id") Integer id);

    public List<User> findAll();

    public List<User> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    @Query("SELECT DISTINCT u.firstName, u.lastName FROM User u")
    List<String> findDistinctUserFirstLastName();

    @Query(value = "select * from users where email = :email", nativeQuery = true)
    public User findByEmail(@Param("email") String email);
}