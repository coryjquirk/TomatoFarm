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
@Table(name = "plots")
public class Plot {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    //remember, plots are not to be created without an assigned user
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "soil_makeup")
    private String soilMakeup;

    @Column(name = "cultivation_style")
    private String cultivationStyle;

    @Column(name = "spaces_total")
    private Integer spacesTotal;

    @Column(name = "spaces_taken")
    private Integer spacesTaken;

}