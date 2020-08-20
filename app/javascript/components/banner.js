import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Paris", "Marseille", "Bordeaux", "Lyon", "Nantes", "Guéret"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
