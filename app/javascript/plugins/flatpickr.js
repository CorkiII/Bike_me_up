import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  const dateElements = document.querySelectorAll('.datepicker');
  if (dateElements.length > 0) {
    flatpickr("#range_start", {
      altInput: true,
      allowInput: true,
      plugins: [new rangePlugin({ input: "#range_end"})]
    });
  }
}

export { initFlatpickr };
