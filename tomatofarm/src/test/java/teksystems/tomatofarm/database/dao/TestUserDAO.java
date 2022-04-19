package teksystems.tomatofarm.database.dao;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.annotation.Rollback;

@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class TestUserDAO {
    @Autowired
    private UserDAO userRepository;

    @Test
    @Order(1)
    @Rollback(value = false)
    public void saveUserTest() {

    }
    @Test
    @Order(2)
    public void getUserTest() {

    }
    @Test
    @Order(3)
    public void getListOfUsers() {

    }
    @Test
    @Order(4)
    @Rollback(value = false)
    public void updateUserTest() {

    }
}