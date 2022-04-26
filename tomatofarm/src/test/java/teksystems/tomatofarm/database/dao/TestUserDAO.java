package teksystems.tomatofarm.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;
import teksystems.tomatofarm.database.entity.User;

import java.util.List;
import java.util.Optional;

@Slf4j
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
        User user1 = new User("Joe", "Mauer", "jmauer@twins.com", "password");
        User user2 = new User("Justin", "Morneau", "jmorneau@twins.com", "password");
        userRepository.save(user1);
        userRepository.save(user2);
        Assertions.assertTrue(user1.getId() > 0);
    }
    @ParameterizedTest
    @Order(2)
    @ValueSource(strings = {"jmauer@twins.com", "jmorneau@twins.com"})
    public void findUserTest(String email){
        User user = userRepository.findByEmail(email);
        Assertions.assertNotNull(user);
    }
    @Test
    @Order(3)
    public void getUserTest() {
        User user = userRepository.findById(1);
        Assertions.assertEquals(1, user.getId());
    }
    @Test
    @Order(4)
    public void getUserListTest() {
        List<User> userList = userRepository.findAll();
        Assertions.assertTrue(userList.size() > 0);
    }
    @Test
    @Order(5)
    @Rollback(value = false)
    public void updateUserTest() {
        User user = userRepository.findById(1);
        user.setFirstName("Joseph");
        Assertions.assertEquals(userRepository.findById(1).getFirstName(), user.getFirstName());
    }
    @Test
    @Order(6)
    @Rollback(value = false)
    public void deleteUserTest(){
        User user = userRepository.findById(1);
        userRepository.delete(user);
        Optional<User> optionalUser = Optional.ofNullable(userRepository.findById(user.getId()));
        User temporaryUser = null;
        if(optionalUser.isPresent()){
            temporaryUser = userRepository.findById(user.getId());
        }
        Assertions.assertNull(temporaryUser);
    }
}