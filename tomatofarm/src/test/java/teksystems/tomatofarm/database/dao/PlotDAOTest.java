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
import teksystems.tomatofarm.database.entity.Plot;

import java.util.List;
import java.util.Optional;

@Slf4j
@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class PlotDAOTest {
    @Autowired
    private PlotDAO plotRepository;
    @Test
    @Order(1)
    @Rollback(value = false)
    public void savePlot(){
        Plot plot = new Plot(1, "hydroponic", "indoor hydroponics", 50, 0);
        plotRepository.save(plot);
        Assertions.assertThat(plot.getId()).isGreaterThan(0);
    }
    @Test
    @Order(2)
    @Rollback(value = false)
    public void getPlotTest(){
        Plot plotById = plotRepository.findById(1);
        Assertions.assertThat(plotById.getId()).isEqualTo(1);

    }
    @Test
    @Order(3)
    @Rollback(value = false)
    public void getPlotListTest(){
        List<Plot> plotList = plotRepository.findAll();
        List<Plot> plotsBySoilMakeup = plotRepository.findBySoilMakeup("hydroponic");
        List<Plot> plotByCultivationStyle = plotRepository.findByCultivationStyle("indoor hydroponics");
        Assertions.assertThat(plotList.size()).isGreaterThan(0);
        Assertions.assertThat(plotsBySoilMakeup.size()).isGreaterThan(0);
        Assertions.assertThat(plotByCultivationStyle.size()).isGreaterThan(0);
    }
    @Test
    @Order(4)
    @Rollback(value = false)
    public void findDistinctTest(){
        List<String> distinctSoil = plotRepository.findDistinctSoil();
        List<String> distinctCultivationStyle = plotRepository.findDistinctCultivationStyle();
        Assertions.assertThat(distinctSoil.size()).isEqualTo(1);
        Assertions.assertThat(distinctCultivationStyle.size()).isEqualTo(1);
    }
    @Test
    @Order(5)
    @Rollback(value = false)
    public void findByUserIdTest(){
        List<Plot> plots = plotRepository.findByUserId(1);
        Assertions.assertThat(plots.size()).isGreaterThan(0);
        plots.forEach((plot)-> {
            Assertions.assertThat(plot.getUserId()).isEqualTo(1);
        });
    }
    @Test
    @Order(6)
    @Rollback(value = false)
    public void updatePlotTest(){
        Plot plot = plotRepository.findById(1);
        plot.setCultivationStyle("outdoor traditional");
        Assertions.assertThat(plotRepository.findById(1).getCultivationStyle()).isEqualTo(plot.getCultivationStyle());
    }
    @Test
    @Order(7)
    @Rollback(value = false)
    public void deletePlotTest(){
        Plot plot = plotRepository.findById(1);
        plotRepository.delete(plot);
        Optional<Plot> optionalPlot = Optional.ofNullable(plotRepository.findById(plot.getId()));
        Plot temporaryPlot = null;
        if (optionalPlot.isPresent()){
            temporaryPlot = plotRepository.findById(plot.getId());
        }
        Assertions.assertThat(temporaryPlot).isNull();
    }
}
