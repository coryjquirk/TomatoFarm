package teksystems.tomatofarm.database.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "plots_plants")
public class PlotsPlants {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "plot_id")
    private Integer plotId;

    @Column(name = "plant_id")
    private Integer plantId;
}
