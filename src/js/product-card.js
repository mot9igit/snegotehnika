import Swiper from 'swiper';
import { Navigation, Scrollbar } from 'swiper/modules';
import 'swiper/css';

document.querySelectorAll('[data-slider="product__intro"]').forEach((slider) => {
  const name = slider.dataset.slider;
  const scope = slider.closest('.product-card__intro__container') || slider.parentElement;
  const next = scope.querySelector(`[data-slider-next="${name}"]`);
  const prev = scope.querySelector(`[data-slider-prev="${name}"]`);
  const scrollbar = scope.querySelector(`[data-scrollbar="${name}"]`);

  new Swiper(slider, {
    spaceBetween: 22,
    modules: [Navigation, Scrollbar],
    navigation: {
      nextEl: next,
      prevEl: prev,
    },
    scrollbar: {
      el: scrollbar,
      draggable: true,
    },
    breakpoints: {
      1800: { slidesPerView: 3 },
      1200: { slidesPerView: 3 },
      991: { slidesPerView: 2.4 },
      768: { slidesPerView: 'auto', spaceBetween: 22 },
      0: { slidesPerView: 'auto', spaceBetween: 14 }
    }
  });
});