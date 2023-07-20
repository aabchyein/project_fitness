const search = document.querySelector('#search');
const map = document.querySelector('#map');
const mapUrl = 'https://www.google.com/maps/embed/v1/place';

function updateMap() {
    const input = search.value;
    const url = `${mapUrl}?q=${encodeURIComponent(input)}`;

    map.setAttribute('src', url);
}

search.addEventListener('keyup', updateMap);
search.addEventListener('change', updateMap);