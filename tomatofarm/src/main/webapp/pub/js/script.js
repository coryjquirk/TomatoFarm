console.log("Hello from Tomato Farm's JavaScript")
const plotTable = document.getElementById("plotTable");
const rowCt = plotTable.rows.length;
function availableSpaces() {
    for (let i = 1; i < rowCt; i++) {
        //ridiculous JavaScript way of accessing table cell values
        let spacesTakenCellVal = plotTable.rows[i].cells[4].innerHTML.valueOf();
        let spacesTotalCellVal = plotTable.rows[i].cells[6].innerHTML.valueOf();
        //if available <= total, available cell is red
        plotTable.rows[i].cells[5].innerHTML = spacesTotalCellVal - spacesTakenCellVal;
        if(spacesTotalCellVal - spacesTakenCellVal <= 0){
            plotTable.rows[i].cells[5].style="background-color:#FF8055;"
        }
    }
}
availableSpaces();

function showPassword() {
    var x = document.getElementById("password");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}