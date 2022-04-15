package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Variety;

@Repository
public interface VarietyDAO extends JpaRepository<Variety, Long> {

    public Variety getById(@Param("id") Long id);

}
