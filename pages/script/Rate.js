/*-=-=-=-= GET METHOD -=-=-=-=-=*/ 
let cardRates = document.querySelector('.card-rates');
let tbody = document.querySelector('.card-rates').getElementsByTagName('tbody')[0];

//Function listRates, that will list all the 
//content of the table and will put inside a list.

function listRate() {
    fetch('http://localhost:3306/rate-list')
    .then(response => response.json())
    .then(data => printRates(data))
};

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

    cardRates.style.display = 'block';

    data.map(item => {
        container['NumeroVoo'] = item.Numero_voo;
        container['CodigoTarifa'] = item.Codigo_tarifa;
        container['Quantidade'] = item.Quantidade;
        container['Restricoes'] = item.Restricoes;
        // Insert a row at the end of table
        var newRow = tbody.insertRow();
        addRow(newRow, container['NumeroVoo']);
        addRow(newRow, container['CodigoTarifa']);
        addRow(newRow, container['Quantidade']);
        addRow(newRow, container['Restricoes']);
    });
};

/*-=-=-=-= CLOSE LIST FUNCTION -=-=-=-=-=-=*/
function closeList(){
    cardRates.style.display = 'none'
}


/*-=-=-=-= POST METHOD -=-=-=-=*/
function htmlspecialchars(text) {
    return text
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function addRate(){
    
    let numeroVoo = htmlspecialchars(document.getElementById('numero_voo').value);
    let codigoTarifa = htmlspecialchars(document.getElementById('codigo_tarifa').value);
    let quantidade = htmlspecialchars(document.getElementById('quantidade').value);
    let restricoes = htmlspecialchars(document.getElementById('restricoes').value);
    
    fetch('http://localhost:3306/rate-add', {
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Numero_voo: numeroVoo,
            Codigo_tarifa: codigoTarifa,
            Quantidade: quantidade,
            Restricoes: restricoes
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))

    numeroVoo.innerText = '';

}

/*-=-=-=-= PUT METHOD -=-=-=-=*/

function updateRate(){
    
    let numeroVoo = htmlspecialchars(document.getElementById('numero_voo').value);
    let codigoTarifa = htmlspecialchars(document.getElementById('codigo_tarifa').value);
    let quantidade = htmlspecialchars(document.getElementById('quantidade').value);
    let restricoes = htmlspecialchars(document.getElementById('restricoes').value);
    
    fetch('http://localhost:3306/airport-update', {
        method: 'PUT',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Numero_voo: numeroVoo,
            Codigo_tarifa: codigoTarifa,
            Quantidade: quantidade,
            Restricoes: restricoes
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))
}

/*-=-=-=-= DELETE METHOD -=-=-=-=*/

function dropRate(){

    let numeroVoo = htmlspecialchars(document.getElementById('numero_voo').value);
    let codigoTarifa = htmlspecialchars(document.getElementById('codigo_tarifa').value);
    
    fetch('http://localhost:3306/rate-delete', {
        method: 'DELETE',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Numero_voo: numeroVoo,
            Codigo_tarifa: codigoTarifa,
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))
}