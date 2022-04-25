package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Plant;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;

import java.util.List;

@Repository
public interface PlotDAO extends JpaRepository<Plot, Long> {

    Plot findById(@Param("id") Integer id);

    List<Plot> findByUserId(Integer userId);
    List<Plot> findBySoilMakeup(String soilMakeup);
    List<Plot> findByCultivationStyle(String cultivationStyle);

    @Query("SELECT DISTINCT p.soilMakeup FROM Plot p")
    List<String> findDistinctSoil();

    @Query("SELECT DISTINCT p.cultivationStyle FROM Plot p")
    List<String> findDistinctCultivationStyle();

    @Query("SELECT p FROM Plot p WHERE p.userId = :id")
    //id is a user ID
    List<Plot> myCoolQuery(@Param("id") Integer id);
}