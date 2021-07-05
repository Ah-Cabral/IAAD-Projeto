/*-=-=-=-= GET METHOD -=-=-=-=-=*/ 
let cardAVGRates = document.querySelector('.card-avg-rates');
let tbody = document.querySelector('.card-avg-rates').getElementsByTagName('tbody')[0];

//Function addRow, that will put a newRow and a newCell in the table
//and after this will input the content inside the cell

function addRow(newRow, containerValue){
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();
    let newValue = document.createTextNode(containerValue);
    newCell.appendChild(newValue);
};

let printRates = function(data){

    let container = {};

    tbody.innerHTML = ''

    cardAVGRates.style.display = 'block';

    data.map(item => {
        container['CompanhiaAerea'] = item.Companhia_aerea;
        container['MediaTarifa'] = Math.trunc(item.Média_tarifa);
        // Insert a row at the end of table
        var newRow = tbody.insertRow();
        addRow(newRow, container['CompanhiaAerea']);
        addRow(newRow, container['MediaTarifa']);
    });
};

//Function listRates, that will list all the 
//content of the table and will put inside a list.

function listRates() {
    fetch('http://localhost:3306/avg-rate-list')
    .then(response => response.json())
    .then(data => printRates(data))
};

/*-=-=-=-= CLOSE LIST FUNCTION -=-=-=-=-=-=*/
function closeList(){
    cardAVGRates.style.display = 'none'
}