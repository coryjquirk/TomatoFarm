package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Variety;

import java.util.List;

@Repository
public interface VarietyDAO extends JpaRepository<Variety, Long> {
    @Query("SELECT DISTINCT v.category FROM Variety v")
    List<String> findDistinctCategory();

    Variety findById(Integer id);
}
