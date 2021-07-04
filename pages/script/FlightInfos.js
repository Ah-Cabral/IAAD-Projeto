/*-=-=-=-= GET METHOD -=-=-=-=-=*/ 
let cardAirport = document.querySelector('.card-airport');
let tbody = document.querySelector('.card-airport').getElementsByTagName('tbody')[0];

//Function listAirport, that will list all the 
//content of the table and will put inside a list.

function listAirport() {
    fetch('http://localhost:8080/airport-list')
    .then(response => response.json())
    .then(data => printAirports(data))
};

//Function addRow, that will put a newRow and a newCell in the table
//and after this will input the content inside the cell

function addRow(newRow, containerValue){
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();
    let newValue = document.createTextNode(containerValue);
    newCell.appendChild(newValue);
};

//Function printAirports, that will 
let printAirports = function(data){

    let container = {};

    tbody.innerHTML = ''

    cardAirport.style.display = 'block';

    data.map(item => {
        container['codigoDoAeroporto'] = item.Codigo_aeroporto;
        container['Nome'] = item.nome;
        container['Cidade'] = item.Cidade;
        container['Estado'] = item.Estado;
        // Insert a row at the end of table
        var newRow = tbody.insertRow();
        addRow(newRow, container['codigoDoAeroporto']);
        addRow(newRow, container['Nome']);
        addRow(newRow, container['Cidade']);
        addRow(newRow, container['Estado']);
    });
};