package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString
public class EditUserFormBean {
    private Integer id;

    @Email(message = "@Email from spring validator")
    @Pattern(regexp = "[a-z0-9]+@[a-z]+\\.[a-z]{2,3}", message = "Email format invalid in regex check")
    private String email;

    private String firstName;

    private String lastName;

    private Integer role;
    //isAdmin will replace role
    private boolean admin;
}
