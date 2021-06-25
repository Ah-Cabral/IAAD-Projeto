var cardAirport = document.querySelector('.card-airport');
var tbody = document.querySelector('.card-airport').getElementsByTagName('tbody')[0];

let printAirports = function(data){

    var container = {};

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

function addRow(newRow, containerValue){

    // Insert a cell at the end of the row
    var newCell = newRow.insertCell();
    var newCode = document.createTextNode(containerValue);
    newCell.appendChild(newCode);
};

function listAirport() {
    fetch('http://localhost:1337/airport-list')
    .then(response => response.json())
    .then(data => printAirports(data))
};