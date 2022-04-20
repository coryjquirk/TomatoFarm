package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Plot;

import java.util.List;

@Repository
public interface PlotDAO extends JpaRepository<Plot, Long> {

    public Plot findById(@Param("id") Integer id);

    public List<Plot> findAll();

    public List<Plot> findByUserId(Integer userId);

    @Query("SELECT DISTINCT p.soilMakeup FROM Plot p")
    List<String> findDistinctSoil();

    @Query("SELECT DISTINCT p.cultivationStyle FROM Plot p")
    List<String> findDistinctCultivationStyle();
}