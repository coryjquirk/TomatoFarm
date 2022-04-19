package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Range;

@Getter
@Setter
@ToString
public class PlotEditFormBean {
    private Integer id;

    private Integer userId;

    private String soilMakeup;

    private String cultivationStyle;

    @Range(min = 1)
    private Integer spacesTotal;

    private Integer spacesTaken;
}
