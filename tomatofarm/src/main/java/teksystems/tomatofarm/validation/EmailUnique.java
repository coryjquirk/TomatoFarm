package teksystems.tomatofarm.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailUniqueImpl.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailUnique {

	String message() default "{UserEmailUnique}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

}