
function map() {

    let street = document.getElementById("adresse").innerHTML
    let streetSupp = document.getElementById("cpltAdresse").innerHTML
    let city = document.getElementById("villeCp").innerHTML
    let address = street.substring(street.indexOf(":") + 1) + " " + streetSupp.substring(streetSupp.indexOf(":") + 1) + " " + city.substring(city.indexOf(":") + 1);

    window.open("https://www.google.fr/maps/place/"+address)
}


document.getElementById("map").addEventListener("click", map)