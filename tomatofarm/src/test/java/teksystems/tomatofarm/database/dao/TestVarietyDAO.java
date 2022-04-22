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
import teksystems.tomatofarm.database.entity.Variety;

import java.util.List;
import java.util.Optional;

@Slf4j
@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class TestVarietyDAO {
    @Autowired
    private VarietyDAO varietyRepository;

    @Test
    @Order(1)
    @Rollback(value = false)
    public void saveVarietyTest() {
        Variety variety = Variety.builder().varietyName("alien flavor").color("purple").category("heirloom").imageUrl("https://photos1.blogger.com/blogger2/5868/4130/1600/tomatopurple.jpg").build();
        varietyRepository.save(variety);
        Assertions.assertThat(variety.getId()).isGreaterThan(0);
    }
    @Test
    @Order(2)
    public void getVarietyTest() {
        Variety variety = varietyRepository.findById(1);
        Assertions.assertThat(variety.getId()).isEqualTo(1);
    }
    @Test
    @Order(3)
    public void getVarietyListTest() {
        List<Variety> varietyList = varietyRepository.findAll();
        Assertions.assertThat(varietyList.size()).isGreaterThan(0);
    }
    @Test
    @Order(4)
    @Rollback(value = false)
    public void updateVarietyTest() {
        Variety variety = varietyRepository.findById(1);
        variety.setVarietyName("purple boy");
        Assertions.assertThat(varietyRepository.findById(1).getVarietyName()).isEqualTo(variety.getVarietyName());
    }
    @Test
    @Order(5)
    @Rollback(value = false)
    public void deleteVarietyTest(){
        Variety variety = varietyRepository.findById(1);
        varietyRepository.delete(variety);
        Optional<Variety> optionalVariety = Optional.ofNullable(varietyRepository.findById(variety.getId()));
        Variety temporaryVariety = null;
        if(optionalVariety.isPresent()){
            temporaryVariety = varietyRepository.findById(variety.getId());
        }
        Assertions.assertThat(temporaryVariety).isNull();
    }
}