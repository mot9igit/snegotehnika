import Swiper from 'swiper';
import { Navigation, Pagination, Autoplay, Scrollbar } from 'swiper/modules';

import { Fancybox } from "@fancyapps/ui/dist/fancybox/";
import "@fancyapps/ui/dist/fancybox/fancybox.css";

import 'swiper/css';

import { addToCart, removeFromCart, setQty, clearCart, getCart, updateCartCount } from './cart';

Fancybox.bind("[data-fancybox]", {
  dragToClose: false,
});

// Modal
let activeModal = null;

const openModal = (id) => {
  const target = document.getElementById(id);
  if (!target) return;
  target.classList.add("modal--open");
  target.setAttribute("aria-hidden", "false");
  document.documentElement.classList.add("modal-open");
  activeModal = target;
};
const closeModal = () => {
  if (!activeModal) return;
  activeModal.classList.remove("modal--open");
  activeModal.setAttribute("aria-hidden", "true");
  document.documentElement.classList.remove("modal-open");
  activeModal = null;
};

document.querySelectorAll("[data-modal-open]").forEach((btn) => {
  btn.addEventListener("click", (event) => {
    event.preventDefault();
    openModal(btn.dataset.modalOpen);
  });
});

document.querySelectorAll("[data-modal]").forEach((modal) => {
  modal.addEventListener("click", (event) => {
    if (event.target === modal || event.target.closest("[data-modal-close]")) {
      closeModal();
    }
  });
});

document.addEventListener("keydown", (event) => {
  if (event.key === "Escape" && activeModal) {
    closeModal();
  }
});


// Model choice accordion
document.querySelectorAll(".model__choice__dropdown").forEach((dropdown) => {
  const btn = dropdown.querySelector(".model__choice__btn");
  const list = dropdown.querySelector(".model__choice__list");
  if (!btn || !list) return;

  btn.addEventListener("click", (event) => {
    event.stopPropagation();
    dropdown.classList.toggle("is-open");
  });

  list.addEventListener("click", (event) => {
    const item = event.target.closest(".model__choice__item");
    if (!item) return;
    const text = dropdown.querySelector(".model__choice__btn__text");
    if (text) text.textContent = item.textContent;
    const radio = item.querySelector('input[type="radio"]');
    if (radio) radio.checked = true;
    list.querySelectorAll(".model__choice__item").forEach((el) => {
      el.classList.toggle("active", el === item);
    });
    dropdown.classList.remove("is-open");
  });
});

document.addEventListener("click", (event) => {
  if (!event.target.closest(".model__choice__dropdown")) {
    document.querySelectorAll(".model__choice__dropdown.is-open").forEach((dropdown) => {
      dropdown.classList.remove("is-open");
    });
  }
});


// side-navigation
const sideNavigationBtn = document.querySelector('.side__navigation__close');
const sideNavigationContent = document.querySelector('.side__navigation');

if (sideNavigationBtn && sideNavigationContent) {
  sideNavigationBtn.addEventListener('click', () => {
    sideNavigationContent.classList.toggle('hide');
  });
}



// Cart count
updateCartCount();


// Header search placeholder
const searchInput = document.querySelector('.header-search-form input');
const defaultPlaceholder = 'Введите фразу для поиска';
const mobilePlaceholder = 'Поиск';

const updateSearchPlaceholder = () => {
  if (!searchInput) return;
  searchInput.placeholder = window.innerWidth <= 430 ? mobilePlaceholder : defaultPlaceholder;
};

updateSearchPlaceholder();
window.addEventListener('resize', updateSearchPlaceholder);



// Scroll lock
const lockBodyScroll = () => {
  document.body.style.overflow = 'hidden';
  document.documentElement.style.overflow = 'hidden';
};

const unlockBodyScroll = () => {
  document.body.style.overflow = '';
  document.documentElement.style.overflow = '';
};

const syncScrollLock = () => {
  if (
    MenuSidebar?.classList.contains('active') ||
    CatalogInner?.classList.contains('active')
  ) {
    lockBodyScroll();
  } else {
    unlockBodyScroll();
  }
};

// Menu
const MenuBtn = document.querySelector('.header__menu__btn');
const MenuSidebar = document.querySelector('.header__menu__sidebar');

if (MenuBtn && MenuSidebar) {
  MenuBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    MenuBtn.classList.toggle('active');
    MenuSidebar.classList.toggle('active');

    CatalogBurger?.classList.remove('active');
    CatalogInner?.classList.remove('active');
    syncScrollLock();
  });
}

document.addEventListener('click', (e) => {
  if (!MenuBtn || !MenuSidebar) return;
  if (
    !MenuBtn.contains(e.target) &&
    !MenuSidebar.contains(e.target)
  ) {
    MenuBtn.classList.remove('active');
    MenuSidebar.classList.remove('active');
    syncScrollLock();
  }
});



// Catalog
const CatalogBurger = document.querySelector('.header__catalog__toggle');
const CatalogInner = document.querySelector('.header__catalog__dropdown')
const CatalogMore = document.querySelector('.header__catalog__content');
const items = document.querySelectorAll('.header__catalog__item');
const groups = document.querySelectorAll('.header__catalog__dropdown .dropdown_group');
// Открытие каталога
if (CatalogBurger && CatalogInner) {
  CatalogBurger.addEventListener('click', () => {
    CatalogBurger.classList.toggle('active');
    CatalogInner.classList.toggle('active');

    MenuBtn?.classList.remove('active');
    MenuSidebar?.classList.remove('active');
    syncScrollLock();
  });
}
// Закрытие каталога при нажатии вне каталога
document.addEventListener("click", (e) =>{
  if (!CatalogBurger || !CatalogInner) return;
  if (
    !CatalogBurger.contains(e.target) &&
    !CatalogInner.contains(e.target)
  ) {
    CatalogBurger.classList.remove('active');
    CatalogInner.classList.remove('active');
    syncScrollLock();
  }
});

// Пункт левого списка <li id="[[+id]]"> ищет свой блок <div class="dropdown_group" data-parent-id="[[+id]]">
const getGroup = (item) => {
  const id = item.id || item.dataset.id || item.dataset.category;
  if (!id) return null;
  return document.querySelector(`.header__catalog__dropdown .dropdown_group[data-parent-id="${CSS.escape(id)}"]`);
};

const showGroup = (group) => {
  group.style.display = 'block';
  group.classList.add('active');
  const panel = group.querySelector('.header__catalog__panel');
  if (panel) panel.classList.add('active');
};

const hideGroup = (group) => {
  group.style.display = 'none';
  group.classList.remove('active');
  const panel = group.querySelector('.header__catalog__panel');
  if (panel) panel.classList.remove('active');
};

const resetGroups = () => {
  groups.forEach(group => {
    if (CatalogMore && group.parentElement !== CatalogMore) {
      CatalogMore.append(group);
    }
    hideGroup(group);
  });
  items.forEach(el => {
    el.classList.remove("active");
    el.classList.remove("hidden");
  });
  if (CatalogMore) CatalogMore.classList.remove("active");
};

function openMobile(item) {
  const group = getGroup(item);
  if (!group) return;
  syncScrollLock();
  if (item.classList.contains("active")) {
      item.classList.remove("active");
      hideGroup(group);
      CatalogMore?.append(group);
      items.forEach(el => {
          el.classList.remove("hidden");
      });
      return;
  }
  items.forEach(el => {
      el.classList.remove("active");
      el.classList.remove("hidden");
  });
  groups.forEach(el => {
      hideGroup(el);
  });
  item.classList.add("active");
  showGroup(group);
  item.after(group);
  items.forEach(el => {
      if (el !== item) {
          el.classList.add("hidden");
      }
  });

}

function openDesktop(item) {
  const group = getGroup(item);
  if (!group) return;
  items.forEach(el => el.classList.remove("active"));
  groups.forEach(el => hideGroup(el));
  item.classList.add("active");
  CatalogMore.classList.add("active");
  showGroup(group);
}

let isDesktop = window.innerWidth > 992;
window.addEventListener('resize', () => {
  const nextIsDesktop = window.innerWidth > 992;
  if (nextIsDesktop === isDesktop) return;
  isDesktop = nextIsDesktop;
  resetGroups();
});

items.forEach(item => {
  item.addEventListener("mouseenter", () => {
    if (window.innerWidth > 992) {
      openDesktop(item);
    }
  })

  item.addEventListener("click", (e) => {
    e.stopPropagation();
    if (window.innerWidth > 992) {
      openDesktop(item);
    } else {
      openMobile(item);
    }
  })
})

// Offers__swiper
const dartContainerRef =
  document.querySelector(".dart_footer .dart-container") ||
  document.querySelector(".dart-container");

const getSliderOffset = () => {
  if (!dartContainerRef) return 0;
  const rect = dartContainerRef.getBoundingClientRect();
  const paddingLeft = parseFloat(getComputedStyle(dartContainerRef).paddingLeft) || 0;
  return rect.left + paddingLeft;
};

const onResize = (fn) => {
  let raf = null;
  return () => {
    if (raf !== null) return;
    raf = requestAnimationFrame(() => {
      raf = null;
      fn();
    });
  };
};

const swiperEl = document.querySelector('.swiper');
if (swiperEl) {
  const applySwiperOffset = () => {
    swiperEl.style.setProperty("--slides-offset", `${getSliderOffset()}px`);
  };

  applySwiperOffset();

  const swiper = new Swiper(swiperEl, {
    direction: 'horizontal',
    spaceBetween: 22,
    loop: true,
    slidesPerView: 'auto',
    modules:[Navigation],
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  window.addEventListener("resize", onResize(applySwiperOffset));
}

// slider catalog
const sliderCards = document.querySelectorAll(".swiper__catalog");
if (sliderCards.length > 0) {
  sliderCards.forEach((sliderCard) => {
    const applySliderOffset = (swiperCard) => {
      const offset = getSliderOffset();
      sliderCard.style.setProperty("--slides-offset", `${offset}px`);
      if (!swiperCard) return;
      swiperCard.params.slidesOffsetBefore = offset;
      swiperCard.update();
    };

    applySliderOffset();

    const swiperCard = new Swiper(sliderCard, {
      slidesOffsetBefore: getSliderOffset(),
      slidesPerView: 'auto',
      modules: [Scrollbar],
      scrollbar: {
        el: sliderCard.parentElement.querySelector(".swiper__catalog-scrollbar"),
        draggable: true,
        hide: false,
      },
      breakpoints: {
        1800: { spaceBetween: 20, allowTouchMove: false, scrollbar: false },
        1200: { spaceBetween: 18, allowTouchMove: true, scrollbar: false },
        991: { spaceBetween: 14 },
        768: { spaceBetween: 12 },
        0: { spaceBetween: 10 },
      },
    });

    window.addEventListener("resize", onResize(() => applySliderOffset(swiperCard)));
  });
}

// swiper__new__blokcs
const newBlocksSwipers = document.querySelectorAll(".swiper__new__blocks");
newBlocksSwipers.forEach((slider) => {
  new Swiper(slider, {
    spaceBetween: 22,
    breakpoints: {
      1800: { slidesPerView: 4 },
      1200: { slidesPerView: 3 },
      991: { slidesPerView: 2.4 },
      768: { slidesPerView: 2, spaceBetween: 20 },
      0: { slidesPerView: 1.2, spaceBetween: 14 },
    },
  });
});

// swipers__product-card__features
const sliders = document.querySelectorAll('[data-slider]')
sliders.forEach((slider) => {
  const sliderName = slider.dataset.slider;
  let scope = slider.closest('.product-card__features__item') || slider.parentElement;
  if (slider.closest('.wholesale')) {
    while (
      scope &&
      scope.tagName !== 'BODY' &&
      !scope.querySelector(`[data-slider-prev="${sliderName}"]`) &&
      !scope.querySelector(`[data-slider-next="${sliderName}"]`)
    ) {
      scope = scope.parentElement;
    }
  }
  const next = scope.querySelector(`[data-slider-next="${sliderName}"]`)
  const prev = scope.querySelector(`[data-slider-prev="${sliderName}"]`)
  const panel = slider.closest('[data-tab__content]');
  const scrollbarScope = (panel && slider.closest('.wholesale')) ? panel : scope;
  const scrollbar = scrollbarScope.querySelector(`[data-scrollbar="${sliderName}"]`)
  const slidesCount = slider.querySelectorAll('.swiper-slide').length;

  const isTabs = slider.closest('.product-card__tabs');

  const updateTabsArrows = () => {
    if (!isTabs || !next || !prev) return;
    const fitsAll = slidesCount <= 4 && window.innerWidth >= 1800;
    next.style.display = fitsAll ? 'none' : '';
    prev.style.display = fitsAll ? 'none' : '';
  };

  const isProductsSlider = slider.classList.contains('swiper__product-card__products');

  updateTabsArrows();
  window.addEventListener('resize', onResize(updateTabsArrows));

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
      1800: {slidesPerView: slider.classList.contains('swiper__images__intro') ? 3 : 4,},
      1200: {slidesPerView: 3},
      991: {slidesPerView: 2.4},
      768: {slidesPerView: 'auto', spaceBetween: 22},
      0: {slidesPerView: 'auto', spaceBetween: 14}
    }
  });
});

// wholesale shared photo-gallery buttons: advance only the active panel's swiper
const wholesaleBtns = document.querySelectorAll('.wholesale__photo-gallery [data-slider-next="photo-gallery"], .wholesale__photo-gallery [data-slider-prev="photo-gallery"]');
wholesaleBtns.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.stopImmediatePropagation();
    const key = btn.dataset.sliderNext ? 'next' : 'prev';
    const activePanel = document.querySelector('.wholesale__photo-gallery__swiper[data-tab__content]:not([style*="display: none"])');
    if (!activePanel) return;
    const sl = activePanel.querySelector('[data-slider="photo-gallery"]');
    if (sl && sl.swiper) key === 'next' ? sl.swiper.slideNext() : sl.swiper.slidePrev();
  }, true);
});

// Product-card__set__list

document.querySelectorAll('.product-card__set__list__item__icon__container').forEach((btn, index) => {
  btn.addEventListener('click', () => {
    const item = btn.closest('.product-card__set__list__item');
    if (!item) return;
    item.classList.add('active');
    const name = item.querySelector('.product-card__set__list__item__name')?.textContent.trim();
    const price = parseInt((item.querySelector('.product-card__set__list__item__price')?.textContent || '').replace(/[^0-9]/g, ''), 10) || 0;
    const img = item.querySelector('.product-card__set__list__item__img img')?.getAttribute('src') || '';
    addToCart({
      id: `set-item-${index}`,
      name,
      price,
      img,
    });
  });
});

// чтобы не переходило на fancybox при клике на кнопку/ссылку открытия модалки
const featuresModalTriggers = document.querySelectorAll('.swiper__product-card__features .video__container [data-modal-open]');
featuresModalTriggers.forEach((trigger) => {
  trigger.addEventListener('click', (event) => {
    event.stopPropagation();
  });
});

// Modal video info: заголовок и список преимуществ по ключу data-video-info
const videoInfoContent = {
  'engine-lonchin': {
    title: 'Модернизированный 4-тактный двигатель Лончин',
    pros: [
      'Быстрый разгон снегохода до 60 км/ч.',
      'Стабильная работа двигателя на холостом ходу.',
      'Уверенный запуск двигателя при низких температурах.',
    ],
  },
  'engine-reverse': {
    title: 'Усиленная коробка реверса',
    pros: [
      'Плавное включение заднего хода.',
      'Усиленная конструкция выдерживает повышенные нагрузки.',
      'Долгий срок службы без обслуживания.',
    ],
  },
  'engine-gearbox': {
    title: 'Надежный механизм переключения передач',
    pros: [
      'Четкое включение передач при любой температуре.',
      'Проверенная на практике надежность механизма.',
      'Простой и удобный алгоритм переключения.',
    ],
  },
  'engine-cvt-belt': {
    title: 'Ремень вариатора Rubena',
    pros: [
      'Износостойкий ремень проверенного производителя.',
      'Стабильная передача мощности на гусеницу.',
      'Уверенное поведение на высоких скоростях.',
    ],
  },
  'undercarriage-suspension': {
    title: 'Независимая облегченная подвеска',
    pros: [
      'Плавный ход по неровностям и ухабам.',
      'Меньший вес улучшает маневренность.',
      'Уверенное поведение на пересеченной местности.',
    ],
  },
  'undercarriage-track': {
    title: 'Гусеница Полярник',
    pros: [
      'Отличное сцепление на глубоком снегу.',
      'Высокая износостойкость при движении по насту.',
      'Уверенное преодоление перепадов высот.',
    ],
  },
  'undercarriage-bearings': {
    title: 'Подшипники SKF',
    pros: [
      'Проверенное качество компонентов SKF.',
      'Устойчивость к нагрузкам и перепадам температур.',
      'Сниженное трение и долгий ресурс.',
    ],
  },
  'undercarriage-steering': {
    title: 'Новое рулевое управление',
    pros: [
      'Точная и информативная обратная связь.',
      'Легкость управления на любой скорости.',
      'Меньше усилий при маневрировании.',
    ],
  },
  'undercarriage-frame': {
    title: 'Рама открытого типа',
    pros: [
      'Открытая конструкция упрощает обслуживание.',
      'Высокая жесткость при умеренном весе.',
      'Удобная компоновка узлов и агрегатов.',
    ],
  },
  'equipment-design': {
    title: 'Агрессивный современный дизайн',
    pros: [
      'Современный облик, отражающий характер.',
      'Продуманная эргономика посадки.',
      'Аккуратная интеграция всех элементов.',
    ],
  },
  'equipment-hood': {
    title: 'Откидной капот',
    pros: [
      'Быстрый доступ к узлам под капотом.',
      'Упрощает обслуживание в полевых условиях.',
      'Прочный и надежный механизм фиксации.',
    ],
  },
  'equipment-headlight': {
    title: 'Мощная светодиодная фара',
    pros: [
      'Яркое освещение трассы в темноте.',
      'Экономия энергии благодаря светодиодам.',
      'Долгий ресурс работы без замены.',
    ],
  },
  'equipment-canisters': {
    title: 'Добавили крепление экспедиционных канистр',
    pros: [
      'Надежная фиксация экспедиционных канистр.',
      'Расширяет возможности дальних поездок.',
      'Крепление не мешает основным узлам снегохода.',
    ],
  },
  'equipment-electrics': {
    title: 'Управление электрооборудованием',
    pros: [
      'Удобное управление всеми электросистемами.',
      'Надежная защита от перегрузок.',
      'Простая диагностика при обслуживании.',
    ],
  },
};

const videoInfoModal = document.querySelector('#modal-video-info');
const videoInfoTitle = videoInfoModal?.querySelector('[data-modal-video-title]');
const videoInfoPros = videoInfoModal?.querySelector('[data-modal-video-pros]');

const escapeVideoInfoHtml = (value) =>
  value.replace(/[&<>"]/g, (ch) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[ch]));

document.querySelectorAll('[data-modal-open="modal-video-info"]').forEach((btn) => {
  btn.addEventListener('click', () => {
    const data = videoInfoContent[btn.dataset.videoInfo];
    if (!data || !videoInfoModal) return;
    videoInfoTitle.textContent = data.title;
    videoInfoPros.innerHTML = data.pros.map((pro) => `<li>${escapeVideoInfoHtml(pro)}</li>`).join('');
  });
});

// Modal offers: акция и описание по ключу data-offer
const offerContent = {
  'offer-1': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-2': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-3': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-4': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-5': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-6': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
  'offer-7': {
    title: 'Приведи друга и получи 5000₽ на карту',
    img: '/img/modals/img.jpg',
    text: 'Описание акции. Подробные условия участия — замените этот текст реальным описанием.',
  },
};

const offersModal = document.querySelector('#modal-offers');
const offersTitle = offersModal?.querySelector('[data-offers-title]');
const offersImg = offersModal?.querySelector('[data-offers-img]');
const offersText = offersModal?.querySelector('[data-offers-text]');

document.querySelectorAll('[data-modal-open="modal-offers"]').forEach((btn) => {
  btn.addEventListener('click', () => {
    const data = offerContent[btn.dataset.offer];
    if (!data || !offersModal) return;
    offersTitle.textContent = data.title;
    if (offersImg) offersImg.src = data.img;
    offersText.textContent = data.text;
  });
});

// Modal price calculation: открытие из каталога (название подставляет бекенд)

// Video
const videoBlocks = document.querySelectorAll('.video__container');

videoBlocks.forEach((block) => {
  const video = block.querySelector('.video__item');
  const playButton = block.querySelector('.video__play');
  const isFancybox = block.hasAttribute('data-fancybox');

  playButton.addEventListener('click', (event) => {
    if (isFancybox) return;
    event.stopPropagation();

    video.play();
    playButton.style.opacity = '0';
  });

  video.addEventListener('click', () => {
    if (isFancybox) return;
    if (video.paused) {
      video.play();
      playButton.style.opacity = '0';
    } else {
      video.pause();
      playButton.style.opacity = '1';
    }
  });
});

// Catalog__sort
const catalogSortSelect = document.querySelector('.catalog__sort__select');
const catalogSortItems = document.querySelectorAll('.catalog__sorting__item');
const catalogSortTrigger = document.querySelector('[data-sort-trigger]');
const catalogSortMobile = window.matchMedia('(max-width: 991px)');

// Аккордион на tablets/мобайле (≤991px):
// открытие/закрытие списка — только кликом по спану
catalogSortTrigger?.addEventListener('click', (e) => {
  if (!catalogSortMobile.matches) return;
  e.stopPropagation();
  catalogSortSelect?.classList.toggle('catalog__sort__select--open');
  catalogSortTrigger.classList.toggle('catalog__sort__label--open');
});

// Выбор сортировки
catalogSortItems.forEach((item) => {
  item.addEventListener('click', (e) => {
    e.stopPropagation();
    const isActive = item.classList.contains('active');
    const hasArrow = item.classList.contains('catalog__sorting__item--choice');

    // Повторный клик по активному пункту со стрелкой меняет направление
    if (isActive) {
      if (hasArrow) item.classList.toggle('sort-desc');
      return;
    }

    catalogSortItems.forEach((el) => {
      el.classList.remove('active', 'sort-desc');
    });
    item.classList.add('active');
  });
});

// Accordion
const accordionItems = document.querySelectorAll('.accordion__item');
const accordion = document.querySelector('.accordion');

if (accordion && accordionItems.length > 0) {
  const setActiveAccordion = (index) => {
    accordionItems.forEach((el, i) => el.classList.toggle('active', i === index));
  };

  setActiveAccordion(0);

  accordionItems.forEach((item) => {
    item.querySelector('.accordion__button').addEventListener('click', () => {
      const isActive = item.classList.contains('active');
      accordionItems.forEach((el) => el.classList.remove('active'));
      if (!isActive) item.classList.add('active');
    });
  });
}

// product-card__questions / reviews expand-collapse
const facAnswers = document.querySelectorAll('.product-card__fac__answer, .product-card__reviews__item');
facAnswers.forEach(answer => {
  const text = answer.querySelector('.product-card__fac__answer__container p, .product-card__reviews__item > p');
  const expand = answer.querySelector('.faq__expand:not(.faq__expand--collapse)');
  if (text && expand && text.scrollHeight <= text.clientHeight) {
    expand.style.display = 'none';
  }
});
const expandButtons = document.querySelectorAll('.faq__expand:not(.faq__expand--collapse)');
expandButtons.forEach(button =>{
  button.addEventListener('click', () => {
    const item = button.closest('.product-card__fac__answer, .product-card__reviews__item');
    item.classList.add('active');
  });
});
const collapseButtons = document.querySelectorAll('.faq__expand--collapse');
collapseButtons.forEach(button =>{
  button.addEventListener('click', () => {
    const item = button.closest('.product-card__fac__answer, .product-card__reviews__item');
    item.classList.remove('active');
  });
});

// cart__payment__promocode button active state
const promocodeInput = document.querySelector('.cart__payment__promocode input');
const promocodeButton = document.querySelector('.cart__payment__promocode button');
if (promocodeInput && promocodeButton) {
  const updatePromocode = () => {
    const hasText = promocodeInput.value.trim().length > 0;
    promocodeButton.classList.toggle('active', hasText);
    promocodeButton.disabled = !hasText;
  };
  promocodeInput.addEventListener('input', updatePromocode);
  updatePromocode();
}

// Cart page rendering
const formatCartPrice = (value) => Number(value || 0).toLocaleString('ru-RU').replace(/\s/g, '\u00A0');

const parseCartPrice = (text) => Number(text.replace(/[^0-9]/g, ''));

const escapeHtml = (str) =>
  String(str ?? '').replace(/[&<>"']/g, (c) => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
  }[c]));

const cartProductsContainer = document.querySelector('[data-cart-products]');
const cartEmptyState = document.querySelector('[data-cart-empty]');
const productsSumEl = document.querySelector('[data-cart-products-sum]');
const deliverySumEl = document.querySelector('[data-cart-delivery-sum]');
const totalSumEl = document.querySelector('[data-cart-total-sum]');

const recalcCartTotal = () => {
  if (!productsSumEl && !totalSumEl) return;
  let productsTotal = 0;
  document.querySelectorAll('.cart__product').forEach((product) => {
    const qty = Number(product.querySelector('.quantity-value').textContent) || 0;
    productsTotal += qty * (Number(product.dataset.price) || 0);
  });
  const delivery = deliverySumEl ? parseCartPrice(deliverySumEl.textContent) : 0;
  if (productsSumEl) productsSumEl.textContent = formatCartPrice(productsTotal);
  if (totalSumEl) totalSumEl.textContent = formatCartPrice(productsTotal + delivery);
};

const renderCart = () => {
  if (!cartProductsContainer) return;
  const cart = getCart();
  cartProductsContainer.innerHTML = '';

  cart.forEach((product) => {
    const row = document.createElement('div');
    row.className = 'cart__product';
    row.dataset.price = product.price;
    row.dataset.id = product.id;
    row.innerHTML = `
      <div class="cart__product__left">
        <img src="${escapeHtml(product.img || '/img/cart/product__img.jpg')}" alt="" class="cart__product__img">
        <div class="cart__product__left__container">
          <span>${escapeHtml(product.sku || product.id)}</span>
          <a href="#">${escapeHtml(product.name)}</a>
        </div>
      </div>
      <div class="cart__product__right">
        <div class="cart__product__quantity">
          <div class="cart__product__quantity__inner">
            <button class="quantity-minus">-</button>
            <span class="quantity-value">${product.qty}</span>
            <button class="quantity-plus">+</button>
          </div>
        </div>
        <div class="cart__product__right__container">
          <button type="button">
            <svg><use xlink:href="#product-delete"></use></svg>
          </button>
          <div class="cart__product__right__price">
            <span>${formatCartPrice(product.price * product.qty)}</span> руб.
          </div>
        </div>
      </div>`;

    const qtyEl = row.querySelector('.quantity-value');
    row.querySelector('.quantity-minus').addEventListener('click', () => setQty(product.id, (Number(qtyEl.textContent) || 1) - 1));
    row.querySelector('.quantity-plus').addEventListener('click', () => setQty(product.id, (Number(qtyEl.textContent) || 1) + 1));
    row.querySelector('.cart__product__right__container button').addEventListener('click', () => removeFromCart(product.id));

    cartProductsContainer.appendChild(row);
  });

  const isEmpty = cart.length === 0;
  if (cartEmptyState) cartEmptyState.style.display = isEmpty ? '' : 'none';
  ['.cart__delivery', '.cart__address', '.cart__right'].forEach((sel) => {
    document.querySelectorAll(sel).forEach((el) => {
      el.style.display = isEmpty ? 'none' : '';
    });
  });
  recalcCartTotal();
};

if (cartProductsContainer) {
  renderCart();
}

const clearCartBtn = document.querySelector('.cart__top__button');
if (clearCartBtn) {
  clearCartBtn.addEventListener('click', () => clearCart());
}

window.addEventListener('cart:change', () => {
  updateCartCount();
  if (cartProductsContainer) renderCart();
});

// Modal added-to-cart quantity
document.querySelectorAll('.modal__cart__item .cart__product__quantity').forEach((quantity) => {
  const qtyEl = quantity.querySelector('.quantity-value');
  const minusBtn = quantity.querySelector('.quantity-minus');
  const plusBtn = quantity.querySelector('.quantity-plus');
  if (!qtyEl || !minusBtn || !plusBtn) return;

  minusBtn.addEventListener('click', () => {
    qtyEl.textContent = Math.max(1, (Number(qtyEl.textContent) || 1) - 1);
  });
  plusBtn.addEventListener('click', () => {
    qtyEl.textContent = (Number(qtyEl.textContent) || 1) + 1;
  });
});

// Modal added-to-cart: actions
document.querySelector('.modal__cart__button')?.addEventListener('click', closeModal);
document.querySelector('.modal__cart__button-red')?.addEventListener('click', () => {
  window.location.href = '/pages/cart.html';
});

document.querySelectorAll('.modal__cart__item .modal__cart__btn').forEach((btn, index) => {
  btn.addEventListener('click', () => {
    const item = btn.closest('.modal__cart__item');
    if (!item) return;
    const name = item.querySelector('.modal__cart__item__left__info p')?.textContent?.trim();
    const price = parseInt((item.querySelector('.modal__cart__item__left__info span')?.textContent || '').replace(/[^0-9]/g, ''), 10) || 0;
    const qty = Number(item.querySelector('.quantity-value')?.textContent) || 1;
    const img = item.querySelector('.modal__cart__item__left img')?.getAttribute('src') || '';
    addToCart({ id: `modal-item-${index + 1}`, name, price, img, qty });
    const qtyEl = item.querySelector('.quantity-value');
    if (qtyEl) qtyEl.textContent = '1';
  });
});


// Scroll__footer
const scrollTopButton = document.querySelector('[data-scroll-top]');

if (scrollTopButton) {
  scrollTopButton.addEventListener('click', () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  });
}

// tabs mobile dropdown + tab switching
const initTabsNav = (navSelector, itemSelector, openClass) => {
  const nav = document.querySelector(navSelector);
  if (!nav) return;
  const items = Array.from(nav.querySelectorAll(itemSelector));
  let scope = nav.parentElement;
  while (scope && !scope.querySelector('[data-tab__content]')) {
    scope = scope.parentElement;
  }
  const panels = scope ? Array.from(scope.querySelectorAll('[data-tab__content]')) : [];

  const selectTab = (target) => {
    items.forEach((it) => it.classList.toggle('active', it === target));
    nav.classList.remove(openClass);
    const key = target.getAttribute('data-tab');
    let shownPanel = null;
    panels.forEach((panel) => {
      const show = panel.getAttribute('data-tab__content') === key;
      panel.style.display = show ? '' : 'none';
      if (show) shownPanel = panel;
      if (!show) {
        panel.querySelectorAll('[data-slider]').forEach((sl) => {
          if (sl.swiper) sl.swiper.slideTo(0, 0);
        });
      }
    });
    if (shownPanel) {
      requestAnimationFrame(() => {
        shownPanel.querySelectorAll('[data-slider]').forEach((sl) => {
          if (sl.swiper) sl.swiper.update();
        });
      });
    }
  };

  nav.addEventListener('click', (e) => {
    const btn = e.target.closest(itemSelector);
    if (!btn) return;
    if (btn.classList.contains('active') && !nav.classList.contains(openClass)) {
      nav.classList.add(openClass);
      return;
    }
    selectTab(btn);
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest(navSelector)) {
      nav.classList.remove(openClass);
    }
  });

  const initialTab = items.find((it) => it.classList.contains('active')) || items[0];
  if (initialTab) selectTab(initialTab);
};

initTabsNav('.product-card__tabs__nav', '.product-card__tabs__nav__item', 'product-card__tabs__nav--open');
initTabsNav('.delivery__tabs__nav', '.delivery__tabs__nav__item', 'delivery__tabs__nav--open');
initTabsNav('.wholesale__photo-gallery__tabs__nav', '.wholesale__photo-gallery__tabs__nav__item', 'wholesale__photo-gallery__tabs__nav--open');
initTabsNav('.contacts__tabs__nav', '.contacts__tabs__nav__item', 'contacts__tabs__nav--open');

// авто-высота textarea (растёт при вводе)
const autoResizeTextareas = (root) => {
  if (!root) return;
  const TAs = Array.from(root.querySelectorAll('textarea'));
  const APPLY_ROWS = () => {
    const rows = window.innerWidth <= 768 ? 3 : 5;
    TAs.forEach((ta) => {
      ta.rows = rows;
    });
  };
  const autoResize = (ta) => {
    ta.style.height = 'auto';
    ta.style.height = `${ta.scrollHeight}px`;
  };
  APPLY_ROWS();
  TAs.forEach((ta) => {
    autoResize(ta);
    ta.addEventListener('input', () => autoResize(ta));
  });
  window.addEventListener('resize', () => {
    APPLY_ROWS();
    TAs.forEach((ta) => autoResize(ta));
  });
};
autoResizeTextareas(document.querySelector('.contacts__support__inputs'));

// подсветка активного пункта меню в шапке под текущую страницу
const highlightActiveNavLink = () => {
  const currentHref = new URL(location.href).pathname.replace(/\/+$/, '');
  document.querySelectorAll('.navigation .nav__link').forEach((link) => {
    const linkHref = new URL(link.href, location.href).pathname.replace(/\/+$/, '');
    link.classList.toggle('active', linkHref === currentHref);
  });
};
highlightActiveNavLink();

// синхронизация кастомной полосы прокрутки списка «Рассчитайте цену за комплект»
const setScrollbars = document.querySelectorAll('[data-set-scrollbar]');
setScrollbars.forEach((scrollbar) => {
  const wrapper = scrollbar.closest('.product-card__set__list-wrapper');
  const list = wrapper && wrapper.querySelector('.product-card__set__list');
  const drag = scrollbar.querySelector('.product-card__set__list__scrollbar__drag');
  if (!list || !drag) return;

  const updateScrollbar = () => {
    const maxScroll = list.scrollWidth - list.clientWidth;
    if (maxScroll <= 0) {
      drag.style.width = '0%';
      return;
    }
    const trackWidth = scrollbar.clientWidth;
    const dragWidth = Math.max((list.clientWidth / list.scrollWidth) * trackWidth, 40);
    drag.style.width = `${dragWidth}px`;
    const progress = list.scrollLeft / maxScroll;
    drag.style.transform = `translateX(${(trackWidth - dragWidth) * progress}px)`;
  };

  list.addEventListener('scroll', updateScrollbar, {passive: true});
  window.addEventListener('resize', updateScrollbar);
  requestAnimationFrame(updateScrollbar);

  scrollbar.addEventListener('click', (event) => {
    if (event.target === drag) return;
    const rect = scrollbar.getBoundingClientRect();
    const trackWidth = scrollbar.clientWidth;
    const dragWidth = parseFloat(drag.style.width) || 40;
    const pos = (event.clientX - rect.left);
    const progress = (pos - dragWidth / 2) / (trackWidth - dragWidth);
    list.scrollLeft = Math.max(0, Math.min(1, progress)) * (list.scrollWidth - list.clientWidth);
  });

  drag.addEventListener('mousedown', (event) => {
    event.preventDefault();
    const trackWidth = scrollbar.clientWidth;
    const dragWidth = parseFloat(drag.style.width) || 40;
    const maxScroll = list.scrollWidth - list.clientWidth;
    if (maxScroll <= 0) return;
    scrollbar.classList.add('is-dragging');

    const onMove = (moveEvent) => {
      const rect = scrollbar.getBoundingClientRect();
      const pos = moveEvent.clientX - rect.left;
      const progress = (pos - dragWidth / 2) / (trackWidth - dragWidth);
      list.scrollLeft = Math.max(0, Math.min(1, progress)) * maxScroll;
    };
    const onUp = () => {
      scrollbar.classList.remove('is-dragging');
      document.removeEventListener('mousemove', onMove);
      document.removeEventListener('mouseup', onUp);
    };
    document.addEventListener('mousemove', onMove);
    document.addEventListener('mouseup', onUp);
  });
});

// New-blocks tags: collapse to 2 lines, show "Показать Все" button on overflow
document.querySelectorAll(".new__blocks__tags").forEach((block) => {
  const list = block.querySelector(".new__blocks__tags__container");
  const button = block.querySelector(".button__show__items");
  if (!list || !button) return;

  const update = () => {
    list.style.maxHeight = "";
    list.style.overflow = "";
    block.classList.remove("is-collapsed");

    const first = list.querySelector("li");
    if (!first) return;

    const liHeight = first.getBoundingClientRect().height;
    const rowGap = parseFloat(getComputedStyle(list).rowGap) || 15;
    const twoLines = liHeight * 2 + rowGap;

    if (list.scrollHeight > twoLines + 1) {
      block.classList.add("is-collapsed");
      list.style.maxHeight = twoLines + "px";
      list.style.overflow = "hidden";
    }
  };

  button.addEventListener("click", () => {
    block.classList.remove("is-collapsed");
    list.style.maxHeight = "";
    list.style.overflow = "";
  });

  let resizeTimer;
  window.addEventListener("resize", () => {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(update, 150);
  });

  update();
});
