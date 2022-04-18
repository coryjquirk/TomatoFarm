package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
public class PlotFormBean {
    private Integer id;

    @NotNull(message="Plot must be assigned to a user")
    private Integer userId;

    private String soilMakeup;

    private String cultivationStyle;

    @NotNull(message="Total spaces must be specified")
    @Range(min = 1)
    private Integer spacesTotal;
}