package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
public class VarietyFormBean {

    @NotEmpty(message="Variety name must not be empty")
    private String varietyName;

    private String color;

    private String category;
}
