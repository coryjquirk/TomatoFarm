package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
public class VarietyFormBean {
    private Integer id;

    @NotEmpty(message="Variety name must not be empty")
    private String varietyName;

    private String color;

    @NotEmpty(message="You must select a category")
    private String category;
}
