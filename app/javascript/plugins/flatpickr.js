import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const dateElements = document.querySelectorAll('.datepicker');
  if (dateElements.length > 0) {
    flatpickr(dateElements, {});
  }
}

export { initFlatpickr };
