function listAirport() {
    fetch('https://localhost:1337/airport-list')
    .then(response => response.json())
    .then(data => console.log(data))
}