package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.PlotsPlants;

import java.util.List;

@Repository
public interface PlotsPlantsDAO extends JpaRepository<PlotsPlants, Long> {

    @Query(value = "SELECT * FROM plots_plants p WHERE p.plot_id = :plot_id", nativeQuery = true)
    List<PlotsPlants> findPlotsPlantsByPlotId(@Param("plot_id") Integer plotId);
}
