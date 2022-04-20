package teksystems.tomatofarm.database.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "plants")
public class Plant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "variety_id")
    private Integer varietyId;

    @ToString.Exclude
    @OneToMany(mappedBy = "plot", fetch = FetchType.LAZY )
    private List<PlotsPlants> plotsPlants = new ArrayList();
}