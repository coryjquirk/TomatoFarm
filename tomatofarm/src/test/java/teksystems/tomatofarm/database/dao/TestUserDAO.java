package teksystems.tomatofarm.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
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
        User user = User.builder().firstName("Joe").lastName("Mauer").email("jmauer@twins.com").password("password").build();
        userRepository.save(user);

        Assertions.assertThat(user.getId()).isGreaterThan(0);
    }
    @Test
    @Order(2)
    public void getUserTest() {
        User user = userRepository.findById(1);
        Assertions.assertThat(user.getId()).isEqualTo(1);
    }
    @Test
    @Order(3)
    public void getUserListTest() {
        List<User> userList = userRepository.findAll();
        Assertions.assertThat(userList.size()).isGreaterThan(0);
    }
    @Test
    @Order(4)
    @Rollback(value = false)
    public void updateUserTest() {
        User user = userRepository.findById(1);
        user.setFirstName("Joseph");
        Assertions.assertThat(userRepository.findById(1).getFirstName()).isEqualTo(user.getFirstName());
    }
    @Test
    @Order(5)
    @Rollback(value = false)
    public void deleteUserTest(){
        User user = userRepository.findById(1);
        userRepository.delete(user);
        Optional<User> optionalUser = Optional.ofNullable(userRepository.findById(user.getId()));
        User temporaryUser = null;
        if(optionalUser.isPresent()){
            temporaryUser = userRepository.findById(user.getId());
        }
        Assertions.assertThat(temporaryUser).isNull();
    }
}