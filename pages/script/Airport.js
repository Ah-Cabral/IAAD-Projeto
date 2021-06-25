/*-=-=-=-= GET METHOD -=-=-=-=-=*/ 

let cardAirport = document.querySelector('.card-airport');
let tbody = document.querySelector('.card-airport').getElementsByTagName('tbody')[0];

//Function listAirport, that will list all the 
//content of the table and will put inside a list.

function listAirport() {
    fetch('http://localhost:1337/airport-list')
    .then(response => response.json())
    .then(data => printAirports(data))
};

//Function addRow, that will put a newRow and a newCell in the table
//and after this will input the content inside the cell

function addRow(newRow, containerValue){
    // Insert a cell at the end of the row
    let newCell = newRow.insertCell();
    let newCode = document.createTextNode(containerValue);
    newCell.appendChild(newCode);
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

/*-=-=-=-= CLOSE LIST FUNCTION -=-=-=-=-=-=*/
function closeList(){
    cardAirport.style.display = 'none'
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

function addAirport(){
    
    let codigoAeroporto = htmlspecialchars(document.getElementById('codigo_aeroporto').value);
    let nomeAeroporto = htmlspecialchars(document.getElementById('nomeAero').value);
    let cidadeAeroporto = htmlspecialchars(document.getElementById('cidade').value);
    let estadoAeroporto = htmlspecialchars(document.getElementById('estado').value);
    
    fetch('http://localhost:1337/airport-add', {
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Codigo_aeroporto: codigoAeroporto,
            Nome: nomeAeroporto,
            Cidade: cidadeAeroporto,
            Estado: estadoAeroporto
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))

    codigoAeroporto.innerText = '';
}

/*-=-=-=-= PUT METHOD -=-=-=-=*/

function updateAirport(){
    
    let codigoAeroporto = htmlspecialchars(document.getElementById('codigo_aeroporto').value);
    let nomeAeroporto = htmlspecialchars(document.getElementById('nomeAero').value);
    let cidadeAeroporto = htmlspecialchars(document.getElementById('cidade').value);
    let estadoAeroporto = htmlspecialchars(document.getElementById('estado').value);
    
    fetch('http://localhost:1337/airport-update', {
        method: 'PUT',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Codigo_aeroporto: codigoAeroporto,
            Nome: nomeAeroporto,
            Cidade: cidadeAeroporto,
            Estado: estadoAeroporto
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))
}

/*-=-=-=-= DELETE METHOD -=-=-=-=*/

function dropAirport(){
    
    let codigoAeroporto = htmlspecialchars(document.getElementById('codigo_aeroporto').value);
    
    fetch('http://localhost:1337/airport-delete', {
        method: 'DELETE',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Codigo_aeroporto: codigoAeroporto,
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.log(error))
}