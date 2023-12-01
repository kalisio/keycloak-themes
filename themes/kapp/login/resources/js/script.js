document.addEventListener("DOMContentLoaded", function() {
    let dropdownMenu = document.getElementById('kc-locale-dropdown');
    let currentLocaleLink = dropdownMenu.querySelector('#kc-current-locale-link');
    let languageList = dropdownMenu.querySelector('ul');

    languageList.style.display = 'none';

    currentLocaleLink.addEventListener('click', function(event) {
        event.preventDefault();
        if (languageList.style.display === 'none') {
            languageList.style.display = 'block';
        } else {
            languageList.style.display = 'none';
        }
    });
});