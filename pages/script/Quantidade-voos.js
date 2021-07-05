/*-=-=-=-= GET METHOD -=-=-=-=-=*/ 
let cardQuantVoos = document.querySelector('.card-quant-voos');
let tbody = document.querySelector('.card-quant-voos').getElementsByTagName('tbody')[0];

//Function addRow, that will put a newRow and a newCell in the table
//and after this will input the content inside the cell

function addRow(newRow, containerValue){
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();
    let newValue = document.createTextNode(containerValue);
    newCell.appendChild(newValue);
};

let printQuantVoos = function(data){

    let container = {};

    tbody.innerHTML = ''

    cardQuantVoos.style.display = 'block';

    data.map(item => {
        container['Nome'] = item.nome;
        container['QuantVoos'] = item.quant_voos_partem;
        // Insert a row at the end of table
        var newRow = tbody.insertRow();
        addRow(newRow, container['Nome']);
        addRow(newRow, container['QuantVoos']);
    });
};

//Function listRates, that will list all the 
//content of the table and will put inside a list.

function listQuantVoos() {
    fetch('http://localhost:3306/flight-count-list')
    .then(response => response.json())
    .then(data => printQuantVoos(data))
};

/*-=-=-=-= CLOSE LIST FUNCTION -=-=-=-=-=-=*/
function closeList(){
    cardQuantVoos.style.display = 'none'
}