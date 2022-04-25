package teksystems.tomatofarm.formbean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.entity.Plot;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
public class PlantFormBean {
//TODO: let's get this working and then I'll add validations
    private Integer id;
    @NotNull
    private Integer plotId;
    @NotNull
    private Integer varietyId;
    @NotNull
    private Integer plantsQty;

//    public void setSpacesAvailable(Integer plotId){
//        Plot plot = plotRepository.findById(plotId);
//        Integer spacesTaken = plot.getSpacesTaken();
//        Integer spacesTotal = plot.getSpacesTotal();
//        this.spacesAvailable = spacesTotal - spacesTaken;
//    }
}