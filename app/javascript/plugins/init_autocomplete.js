// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bike_address');
  console.log(addressInput)
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
