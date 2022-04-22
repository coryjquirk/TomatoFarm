package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Variety;

import java.util.List;

@Repository
public interface VarietyDAO extends JpaRepository<Variety, Long> {
    @Query("SELECT DISTINCT v.category FROM Variety v")
    List<String> findDistinctCategory();

    Variety findById(Integer id);

    @Query(value = "SELECT v.variety_name FROM varieties v WHERE v.variety_name = :variety_name", nativeQuery = true)
    String findByVarietyName(@Param("variety_name") String varietyName);
}
