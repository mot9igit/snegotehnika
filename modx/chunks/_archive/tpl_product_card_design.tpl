{set $product_title = $title | default : $_modx->resource.pagetitle}
{set $product_code = $code | default : 'stv0020'}
{set $product_price = $price | default : '1 200 000 ₽'}
{set $product_brand = $brand | default : ''}
{set $product_stock = $stock | default : 'В наличии 4 шт.'}
{set $intro_video = '/img/product__card/videos/swiper-intro/product-card__intro__video.mp4'}

{set $breadcrumbs = $crumbs | default : [
    ['title' => 'Главная', 'link' => '/index.html'],
    ['title' => 'Каталог', 'link' => '/catalog.html'],
    ['title' => 'Снегоходы', 'link' => '/catalog.html'],
    ['title' => $product_title, 'link' => '']
]}

{set $gallery = $images | default : [
    '/img/product__card/images/slider-1_img-1.jpg',
    '/img/product__card/images/slider-1_img-2.jpg',
    '/img/product__card/images/slider-1_img-3.jpg',
    '/img/product__card/images/slider-1_img-4.jpg'
]}

{set $feature_groups = $features | default : [
    ['name' => 'engine', 'title' => 'Двигатель и Трансмиссия:', 'items' => [
        ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'info' => 'engine-lonchin', 'caption' => 'Модернизированный 4-тактный двигатель Лончин'],
        ['poster' => '/img/product__card/videos/swiper-engine/poster_reverse_box.jpg', 'info' => 'engine-reverse', 'caption' => 'Усиленная коробка реверса'],
        ['poster' => '/img/product__card/videos/swiper-engine/poster_gear_shift_box.jpg', 'info' => 'engine-gearbox', 'caption' => 'Надежный механизм переключения передач'],
        ['poster' => '/img/product__card/videos/swiper-engine/poster_CVT_belt.jpg', 'info' => 'engine-cvt-belt', 'caption' => 'Ремень вариатора Rubena']
    ]],
    ['name' => 'undercarriage', 'title' => 'Ходовая часть и Шасси:', 'items' => [
        ['poster' => '/img/product__card/videos/swiper-undercarriage/poster_Independent_lightweight_suspension.jpg', 'info' => 'undercarriage-suspension', 'caption' => 'Независимая облегченная подвеска'],
        ['poster' => '/img/product__card/videos/swiper-undercarriage/poster_polar_explorer_caterpillar.jpg', 'info' => 'undercarriage-track', 'caption' => 'Гусеница Полярник'],
        ['poster' => '/img/product__card/videos/swiper-undercarriage/poster_SKF_bearings.jpg', 'info' => 'undercarriage-bearings', 'caption' => 'Подшипники SKF'],
        ['poster' => '/img/product__card/videos/swiper-undercarriage/poster_new_steering.jpg', 'info' => 'undercarriage-steering', 'caption' => 'Новое рулевое управление'],
        ['poster' => '/img/product__card/videos/swiper-undercarriage/poster_open_type_frame.jpg', 'info' => 'undercarriage-frame', 'caption' => 'Рама открытого типа']
    ]],
    ['name' => 'equipment', 'title' => 'Оснащение и Экстерьер:', 'items' => [
        ['poster' => '/img/product__card/videos/swiper-equipment/poster_design.jpg', 'info' => 'equipment-design', 'caption' => 'Агрессивный современный дизайн'],
        ['poster' => '/img/product__card/videos/swiper-equipment/poster_folding_hood.jpg', 'info' => 'equipment-hood', 'caption' => 'Откидной капот'],
        ['poster' => '/img/product__card/videos/swiper-equipment/poster_headlight.jpg', 'info' => 'equipment-headlight', 'caption' => 'Мощная светодиодная фара'],
        ['poster' => '/img/product__card/videos/swiper-equipment/poster_canisters.jpg', 'info' => 'equipment-canisters', 'caption' => 'Добавили крепление экспедиционных канистр'],
        ['poster' => '/img/product__card/videos/swiper-equipment/poster_electrical_equipment.jpg', 'info' => 'equipment-electrics', 'caption' => 'Управление электрооборудованием']
    ]]
]}

{set $spec_groups = $specs | default : [
    ['title' => 'Габариты и масса', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Двигатель', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Оснащение', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Електрооборудование', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Емкости', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Подвеска', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]],
    ['title' => 'Шасси', 'params' => [
        ['name' => 'Вес', 'value' => '314 кг'],
        ['name' => 'Грузоподъемность', 'value' => '270 кг / на сцепке 550 кг'],
        ['name' => 'Количество мест', 'value' => '2'],
        ['name' => 'Габариты', 'value' => '3100×910×1335 мм']
    ]]
]}

{set $video_reviews = $video_reviews | default : [
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика'],
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика'],
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика'],
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика'],
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика'],
    ['poster' => '/img/product__card/videos/swiper-engine/poster_engine_loncihn.jpg', 'caption' => 'Описание видео ролика']
]}

{set $delivery_points = $delivery | default : [
    'Предоплата 100% на расчетный счет',
    'Оплата по QR коду на р/с – без комиссии',
    'Предоплата 50%, оставшиеся 50% по готовности снегохода',
    'В пределах 1000 км от Рыбинска – предоплата за доставку, за технику оплата при получении',
    'Более 1000 км от Рыбинска – предоплата 10 000 руб. Отгрузка через ТК ПЭК, оплата при получении наложенным платежом (комиссия 5%)'
]}

{set $related_products = $related | default : [
    ['name' => 'Снегоход Шихан', 'price' => '300 000 ₽', 'image' => '/img/product__card/bottom/img.jpg', 'tags' => ['Новинка', 'Акция']],
    ['name' => 'Снегоход Шихан', 'price' => '300 000 ₽', 'image' => '/img/product__card/bottom/img.jpg', 'tags' => ['Акция']],
    ['name' => 'Снегоход Шихан', 'price' => '300 000 ₽', 'image' => '/img/product__card/bottom/img.jpg', 'tags' => []],
    ['name' => 'Снегоход Шихан', 'price' => '300 000 ₽', 'image' => '/img/product__card/bottom/img.jpg', 'tags' => ['Акция']],
    ['name' => 'Снегоход Шихан', 'price' => '300 000 ₽', 'image' => '/img/product__card/bottom/img.jpg', 'tags' => ['Новинка']]
]}

{set $product_tags = $tags | default : ['Название тега', 'Тег']}

<div class="product-card">
    <div class="dart-container">
        <ul class="breadcrumbs">
            {foreach $breadcrumbs as $crumb}
                <li>
                    {if $crumb.link}
                        <a href="{$crumb.link}">{$crumb.title}</a>
                    {else}
                        <span>{$crumb.title}</span>
                    {/if}
                </li>
            {/foreach}
        </ul>
        <h1 class="product-card__title">{$h1_prefix | default : 'снегоход восток с'} <b>{$h1_accent | default : 'двигателем Loncin'}</b></h1>

        <div class="product-card__intro__container">
            <div class="product-card__intro__top">
                <div class="product-card__intro__top__container">
                    <span class="product-card__intro__top__manufacturer">
                        Производитель
                        <img class="product-card__intro__top__logo" src="{$brand_logo | default : '/img/logo.svg'}" alt="">
                    </span>
                    <span class="product-card__intro__top__product-code">
                        Код товара:<span> {$product_code}</span>
                    </span>
                    <span class="product-card__intro__top__availability">{$product_stock}</span>
                    <div class="yandex-rating">
                        <div class="product-card__reviews__item__rating-badge">
                            <span class="product-card__stars">
                                <span class="product-card__stars__star"></span>
                                <span class="product-card__stars__star"></span>
                                <span class="product-card__stars__star"></span>
                                <span class="product-card__stars__star"></span>
                                <span class="product-card__stars__star"></span>
                            </span>
                        </div>
                        <p>Рейтинг в Яндекс отзывах</p>
                    </div>
                </div>
                <div class="swiper__buttons">
                    <button type="button" data-slider-prev="product__intro" class="swiper-button-prev">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                        </svg>
                    </button>
                    <button type="button" data-slider-next="product__intro" class="swiper-button-next">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style="transform: rotate(180deg);">
                            <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="swiper__images__intro" data-slider="product__intro">
                <div class="swiper-wrapper">
                    {foreach $gallery as $image}
                        <div class="swiper-slide">
                            <a href="{$image}" data-fancybox="intro">
                                <img src="{$image}" loading="lazy" alt="">
                            </a>
                        </div>
                    {/foreach}
                </div>
                <div class="scrollbar" data-scrollbar="product__intro"></div>
            </div>

            <div class="product-card__intro__info">
                <div class="yandex-rating">
                    <div class="product-card__reviews__item__rating-badge">
                        <span class="product-card__stars">
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                        </span>
                    </div>
                    <p>Рейтинг в Яндекс отзывах</p>
                </div>
                <div class="product-card__intro__info__buttons">
                    <a href="#" class="product-card__intro__info__receiveCatalog" data-modal-open="modal-price_calculation">
                        <div>
                            <span>рассчитать стоимость</span>
                            <p>с учётом доставки и способа оплаты</p>
                        </div>
                        <svg class="button__icon">
                            <use xlink:href="#buttonArrow"></use>
                        </svg>
                    </a>
                    <a href="#tab-specifications" class="product-card__intro__info__characteristic" data-tab-link="specifications">
                        характеристики снегохода
                        <svg class="button__icon">
                            <use xlink:href="#buttonArrow"></use>
                        </svg>
                    </a>
                </div>
                <div class="product-card__intro__info__price">
                    <span>от <b>{$product_price}</b></span>
                    <p>Цена зависит от комплектации, доставки и спецпредложения.</p>
                </div>
            </div>

            <div class="video__container" data-fancybox data-src="{$intro_video}">
                <video class="video__item" poster="/img/product__card/videos/swiper-intro/product-card__intro__poster.jpg">
                    <source src="{$intro_video}" type="video/mp4">
                </video>
                <button class="video__play" type="button">
                    <img src="/img/icons/video_Play.svg" alt="">
                </button>
            </div>
        </div>

        <section class="product-card__tabs">
            <div class="product-card__tabs__top">
                Меню характеристики
                <div class="product-card__tabs__top__icon">
                    <svg width="17" height="14" viewBox="0 0 17 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8.1063 9.58272L12.774 12.1002L15.2915 7.43258M12.774 12.1002L11.0538 6.35209C9.86632 2.38372 5.6869 0.129528 1.71852 1.31705L1 1.53207" stroke="#F93131" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>
            </div>

            <div class="product-card__tabs__nav">
                <button type="button" class="product-card__tabs__nav__item active" data-tab="features">
                    Особенности
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
                <button type="button" class="product-card__tabs__nav__item" data-tab="specifications">
                    Характеристики
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
                <button type="button" class="product-card__tabs__nav__item" data-tab="videoReviews">
                    Видео обзоры
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
                <button type="button" class="product-card__tabs__nav__item" data-tab="questions">
                    Вопрос-ответ
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
                <button type="button" class="product-card__tabs__nav__item" data-tab="reviews">
                    Отзывы
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
                <button type="button" class="product-card__tabs__nav__item" data-tab="delivery">
                    Оплата и доставка
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                        <rect width="24" height="24" rx="6" fill="white"/>
                        <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
                    </svg>
                </button>
            </div>

            <div data-tab__content="features" class="product-card__features">
                <h3 class="product-card__features__title"><b>Особенности конструкции</b> {$h1_accent | default : 'снегохода Восток'}</h3>

                {foreach $feature_groups as $group}
                    <div class="product-card__features__item">
                        <div class="product-card__features__item__top">
                            <span class="product-card__features__item__parameter">{$group.title}</span>
                            <div class="swiper__buttons">
                                <button type="button" data-slider-prev="{$group.name}" class="swiper-button-prev">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                        <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                                    </svg>
                                </button>
                                <button type="button" data-slider-next="{$group.name}" class="swiper-button-next">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style="transform: rotate(180deg);">
                                        <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div data-slider="{$group.name}" class="swiper__product-card__features">
                            <div class="swiper-wrapper">
                                {foreach $group.items as $slide}
                                    <div class="swiper-slide">
                                        <div class="video__container" data-fancybox data-src="{$intro_video}">
                                            <video class="video__item" poster="{$slide.poster}">
                                                <source src="{$intro_video}" type="video/mp4">
                                            </video>
                                            <button class="video__play" type="button">
                                                <img src="/img/icons/video_Play.svg" alt="">
                                            </button>
                                            <button type="button" class="product-card__features__info" data-modal-open="modal-video-info" data-video-info="{$slide.info}">
                                                {$slide.caption}
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                                                    <rect width="24" height="24" rx="6" fill="currentColor"/>
                                                    <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="white"/>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                            <div class="scrollbar scrollbar--features" data-scrollbar="{$group.name}"></div>
                        </div>
                    </div>
                {/foreach}
            </div>

            <div data-tab__content="specifications" class="product-card__specifications">
                <h3>технические <b>характеристики</b></h3>
                {if $description}
                    {$description}
                {else}
                    <p>Снегоход Восток с двигателем Loncin - идеально подходит для рыбалки и охоты. Находится в разделе Снегоходы для рыбалки</p>
                    <p>Вся техника производства СнегоТехника в Рыбинске проходит предпродажную подготовку и имеет гарантию 1 год.</p>
                    <p>Оставьте заявку на сайте — менеджер подробно расскажет о модели и рассчитает стоимость с доставкой!</p>
                {/if}
                <div class="accordion">
                    <div class="accordion__inner">
                        {foreach $spec_groups as $index => $group}
                            <div class="accordion__item{if $index == 0} active{/if}">
                                <button class="accordion__button" type="button">
                                    <span>{$group.title}</span>
                                    <svg class="accordion__icon">
                                        <use xlink:href="#accordion__plus"></use>
                                    </svg>
                                </button>
                                <div class="accordion__content">
                                    {foreach $group.params as $param_index => $param}
                                        <div class="accordion__parameter{if $param_index % 2 == 0} accordion__parameter--gray{/if}">{$param.name}</div>
                                        <div class="accordion__parameter{if $param_index % 2 == 0} accordion__parameter--gray{/if}">{$param.value}</div>
                                    {/foreach}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
                <div class="product-card__specifications__buttons">
                    <a href="{$spec_doc | default : '#'}" class="product-card__specifications__button">
                        скачать характеристику
                        <i class="icon-material-symbols-light_picture-as-pdf-outline-sharp"></i>
                    </a>
                    <a href="{$manual_doc | default : '#'}" class="product-card__specifications__button">
                        скачать инструкцию
                        <i class="icon-material-symbols-light_picture-as-pdf-outline-sharp"></i>
                    </a>
                </div>
            </div>

            <div data-tab__content="videoReviews" class="product-card__videoReviews">
                <h3><b>ВИДЕО ОБЗОР.</b> {mb_strtoupper($product_title)}</h3>
                <div class="product-card__videoReviews__swiper__top">
                    <div class="swiper__buttons">
                        <button type="button" data-slider-prev="videoReviews" class="swiper-button-prev">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                            </svg>
                        </button>
                        <button type="button" data-slider-next="videoReviews" class="swiper-button-next">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style="transform: rotate(180deg);">
                                <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <div data-slider="videoReviews" class="swiper__product-card__videoReviews">
                    <div class="swiper-wrapper">
                        {foreach $video_reviews as $review}
                            <div class="swiper-slide">
                                <div class="video__container" data-fancybox data-src="{$intro_video}">
                                    <video class="video__item" poster="{$review.poster}">
                                        <source src="{$intro_video}" type="video/mp4">
                                    </video>
                                    <button class="video__play" type="button">
                                        <img src="/img/icons/video_Play.svg" alt="">
                                    </button>
                                </div>
                                <span>{$review.caption}</span>
                            </div>
                        {/foreach}
                    </div>
                    <div class="scrollbar" data-scrollbar="videoReviews"></div>
                </div>
            </div>

            <div data-tab__content="questions">
                {$_modx->getChunk('tpl_faq', ['title' => 'Вопросы и ответы', 'modal' => 'modal-questions'])}
            </div>

            <div data-tab__content="reviews">
                {$_modx->getChunk('tpl_reviews', ['modal' => 'modal-reviews'])}
            </div>

            <div data-tab__content="delivery" class="product-card__delivery">
                <h3>Условия <b>оплаты и доставки</b></h3>
                <div class="product-card__delivery__content">
                    <div class="product-card__delivery__content__left">
                        <div class="product-card__delivery__content__left__container">
                            <h4>Быстрая оплата По QR-коду</h4>
                            <p>Перед оплатой по QR-коду обязательно подтверждайте наличие товара у менеджера</p>
                        </div>
                        <div class="product-card__delivery__content__left__qr">
                            <img src="{$qr_image | default : '/img/product__card/images/qr.png'}" alt="">
                        </div>
                    </div>
                    <div class="product-card__delivery__content__right">
                        <ul>
                            {foreach $delivery_points as $point}
                                <li>
                                    <svg class="product-card__delivery__content__right__icon">
                                        <use xlink:href="#plus-added"></use>
                                    </svg>
                                    <p>{$point}</p>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

{$_modx->getChunk('tpl_product_card_set', ['modal' => 'modal-price_calculation'])}

<div class="product-card__bottom">
    <div class="dart-container">
        {foreach [{'name' => 'recommended', 'title' => 'рекомендованные', 'class' => 'product-card__products__item__top--three'}, {'name' => 'related', 'title' => 'похожие', 'class' => 'product-card__products__item__top--three'}] as $block}
            <div class="product-card__bottom__item">
                <div class="product-card__bottom__item__top">
                    <h3><b>{$block.title}</b> товары</h3>
                    <div class="swiper__buttons">
                        <button type="button" data-slider-prev="{$block.name}" class="swiper-button-prev">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                            </svg>
                        </button>
                        <button type="button" data-slider-next="{$block.name}" class="swiper-button-next">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" style="transform: rotate(180deg);">
                                <path d="M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z" fill="currentColor"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <div data-slider="{$block.name}" class="swiper__product-card__products">
                    <div class="swiper-wrapper">
                        {foreach $related_products as $item}
                            <div class="swiper-slide">
                                <div class="product-card__products__item">
                                    <div class="product-card__products__item__img">
                                        <img src="{$item.image}" alt="">
                                    </div>
                                    <div class="product-card__products__item__inner">
                                        <div class="product-card__products__item__top{if $item.tags} product-card__products__item__top--has-tags{/if}{if count($item.tags) == 2} product-card__products__item__top--three{/if}">
                                            <span class="product-card__item__parameter product-card__item__parameter--in-stock">{$item.stock | default : 'В наличии 3шт.'}</span>
                                            {if $item.tags}
                                                <div class="product-card__products__item__tags">
                                                    {foreach $item.tags as $tag}
                                                        <span class="product-card__item__parameter{if $tag == 'Новинка'} product-card__item__parameter--new{else} product-card__item__parameter--stock{/if}">{$tag}</span>
                                                    {/foreach}
                                                </div>
                                            {/if}
                                        </div>
                                        <div class="product-card__products__item__content">
                                            <a href="{$item.link | default : '#'}" class="product-card__products__item__name">{$item.name}</a>
                                            <div class="product-card__products__item__bottom">
                                                <div class="product-card__products__item__price">от<b> {$item.price}</b></div>
                                                <a href="{$item.link | default : '#'}" class="product-card__products__item__link">
                                                    <svg>
                                                        <use xlink:href="#buttonArrow"></use>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/foreach}

        <ul class="product-card__tags">
            {foreach $product_tags as $tag}
                <li>
                    <a href="{$tag.link | default : '#'}">{$tag}</a>
                </li>
            {/foreach}
        </ul>

        <p class="product-card__text">
            {foreach ($seo_text | default : [
                'Захватите зиму по максимуму с техникой для ледяной рыбалки!',
                'У нас — только проверенные снегоходы и надежное снаряжение, которые превратят путь к заветной лунке в часть приключения. Доберитесь до самых рыбных мест быстро, комфортно и безопасно, а вся ваша экипировка будет надежно защищена от мороза и непогоды.',
                'Отправляйтесь за трофеем с уверенностью — наша техника создана для тех, кто ценит каждую минуту зимней рыбалки.'
            ]) as $paragraph}
                <span>{$paragraph}</span>
            {/foreach}
        </p>
    </div>
</div>

{set $model_options = $models | default : [
    'Снегоход Восток с двигателем Loncin',
    'Снегоход 4Т с двигателем Лончин',
    'Снегоход Шихан',
    'Снегоход 2Т с двигателем РМЗ'
]}

<div class="modal" id="modal-price_calculation" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <div class="modal__top">
                <h2><b>Расчет цены</b> {$product_title}</h2>
            </div>
            <form action="{$form_action | default : '/'}">
                <input type="text" name="city" placeholder="Ваш город" required>
                <div class="modal__choice__item">
                    <h4>Выберите способ доставки</h4>
                    <div class="modal__choice__item__container">
                        <input type="radio" id="self-pickup" name="delivery-choice" checked>
                        <label for="self-pickup" class="modal__choice">
                            <span class="check-circle"></span>
                            <div>Самовывоз + подарок</div>
                        </label>
                        <input type="radio" id="special-rate" name="delivery-choice">
                        <label for="special-rate" class="modal__choice">
                            <span class="check-circle"></span>
                            <div>ТК спецтариф - скидка до 20%</div>
                        </label>
                    </div>
                </div>
                <div class="modal__choice__item">
                    <h4>Счет, квитанция для оплаты в банке</h4>
                    <div class="modal__choice__item__container">
                        <input type="radio" id="bank-account" name="payment-choice" checked>
                        <label for="bank-account" class="modal__choice">
                            <span class="check-circle"></span>
                            <div>Счет, квитанция для оплаты в банке</div>
                        </label>
                        <input type="radio" id="bank" name="payment-choice">
                        <label for="bank" class="modal__choice">
                            <span class="check-circle"></span>
                            <div>Банк. карта <b>Безопасно и быстро</b></div>
                        </label>
                    </div>
                </div>
                <div class="modal__phone">
                    <p>Ваш телефон:</p>
                    <input type="tel" name="phone" placeholder="+79991234567" required>
                </div>
                <div class="modal__captcha"></div>
                <button type="submit" class="modal__btn">
                    получить расчет
                    <svg>
                        <use xlink:href="#buttonArrow"></use>
                    </svg>
                </button>
                <input type="checkbox" id="modal__calculation__approval" name="approval" required>
                <label for="modal__calculation__approval" class="modal__approval">
                    <span class="check-circle"></span>
                    <div>нажимая на кнопку, я соглашаюсь с <a href="{$privacy_link | default : '#'}">политикой о конфиденциальности</a></div>
                </label>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="modal--added-to-cart" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <div class="modal__top">
                <h2>товар добавлен в корзину</h2>
                <p>Вы можете оформить заказ или продолжить покупки. <b>Минимальная сумма для заказа составляет 1000 руб.</b></p>
            </div>
            <div class="modal__cart">
                <div class="modal__cart__buttons">
                    <button class="modal__cart__button">продолжить покупки</button>
                    <button class="modal__cart__button-red">оформить заказ</button>
                </div>
                <h3>ВАМ МОЖЕТ ПРИГОДИТЬСЯ:</h3>
                <div class="modal__cart__inner">
                    {foreach ($cart_suggestions | default : [
                        ['name' => 'Гусеница Рыбинка', 'price' => '13 809 руб.'],
                        ['name' => 'Гусеница Рыбинка', 'price' => '13 809 руб.']
                    ]) as $suggestion}
                        <div class="modal__cart__item">
                            <div class="modal__cart__item__left">
                                <img src="{$suggestion.image | default : '/img/cart/product__img.jpg'}" alt="">
                                <div class="modal__cart__item__left__info">
                                    <p>{$suggestion.name}</p>
                                    <span>{$suggestion.price}</span>
                                </div>
                            </div>
                            <div class="modal__cart__item__right">
                                <div class="cart__product__quantity">
                                    <div class="cart__product__quantity__inner">
                                        <button class="quantity-minus">-</button>
                                        <span class="quantity-value">1</span>
                                        <button class="quantity-plus">+</button>
                                    </div>
                                </div>
                                <button class="modal__cart__btn">
                                    в корзину
                                    <svg width="35" height="35" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_846_6354)">
                                            <path d="M12.959 31.1111C14.1671 31.1111 15.1465 30.1317 15.1465 28.9236C15.1465 27.7155 14.1671 26.7361 12.959 26.7361C11.7509 26.7361 10.7715 27.7155 10.7715 28.9236C10.7715 30.1317 11.7509 31.1111 12.959 31.1111Z" fill="currentColor"/>
                                            <path d="M26.25 31.1111C27.4581 31.1111 28.4375 30.1317 28.4375 28.9236C28.4375 27.7155 27.4581 26.7361 26.25 26.7361C25.0419 26.7361 24.0625 27.7155 24.0625 28.9236C24.0625 30.1317 25.0419 31.1111 26.25 31.1111Z" fill="currentColor"/>
                                            <path d="M31.7725 9.14693C31.6844 9.05879 31.5733 8.98759 31.4472 8.93843C31.3211 8.88928 31.1831 8.8634 31.0433 8.86265H11.3244L11.9401 10.3993H29.8025L27.2738 19.6192H13.0671L8.73882 8.50154C8.69201 8.38357 8.61071 8.27653 8.50186 8.18957C8.39301 8.10261 8.25985 8.0383 8.11373 8.00213L4.23058 7.03404C4.11118 7.00427 3.98572 6.99388 3.86137 7.00345C3.73702 7.01302 3.6162 7.04236 3.50583 7.0898C3.28292 7.18562 3.11606 7.34935 3.04196 7.54497C2.96786 7.74059 2.99259 7.95208 3.1107 8.13291C3.22882 8.31375 3.43065 8.44911 3.67179 8.50922L7.07191 9.35437L11.4191 20.495L9.86588 21.5246L9.74276 21.6245C9.35855 21.9837 9.14078 22.4403 9.12695 22.9157C9.11312 23.3912 9.3041 23.8556 9.66699 24.2291C9.92514 24.4838 10.2532 24.6859 10.6248 24.8193C10.9965 24.9527 11.4015 25.0137 11.8075 24.9974H27.6147C27.8659 24.9974 28.1068 24.9165 28.2844 24.7724C28.462 24.6283 28.5618 24.4329 28.5618 24.2291C28.5618 24.0253 28.462 23.8299 28.2844 23.6858C28.1068 23.5417 27.8659 23.4608 27.6147 23.4608H11.6559C11.5469 23.4577 11.4406 23.432 11.3474 23.3859C11.2542 23.3398 11.1772 23.2751 11.1239 23.1978C11.0706 23.1206 11.0427 23.0335 11.043 22.945C11.0433 22.8564 11.0717 22.7695 11.1255 22.6925L13.4081 21.1558H28.0314C28.2504 21.1601 28.4644 21.1028 28.6371 20.9935C28.8098 20.8843 28.9304 20.7298 28.9786 20.5565L31.9809 9.8C32.0097 9.68546 32.0059 9.56709 31.9698 9.45392C31.9337 9.34075 31.8662 9.23575 31.7725 9.14693Z" fill="currentColor"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_846_6354">
                                                <rect width="35" height="35" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal-reviews" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <form action="{$form_action | default : '/'}">
                <div class="modal__top">
                    <h2>оставить отзыв о снеготехнике</h2>
                    <span>Ваше мнение поможет другим покупателям сделать правильный выбор</span>
                </div>
                <div class="modal__model__choice">
                    <h4>Модель техники</h4>
                    <div class="model__choice__dropdown">
                        <button class="model__choice__btn" type="button">
                            <span class="model__choice__btn__text">выберите модель</span>
                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.25 7.5L9 11.25L12.75 7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </button>
                        <ul class="model__choice__list">
                            {foreach $model_options as $index => $model}
                                {set $model_id = $index + 1}
                                <li class="model__choice__item">
                                    <input type="radio" name="model" id="model-{$model_id}" value="{$model}"{if $index == 0} required{/if}>
                                    <label for="model-{$model_id}">{$model}</label>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                <div class="modal__reviews__item">
                    <h4>Ваш отзыв</h4>
                    <textarea name="modal-reviews-text" rows="6" placeholder="Текст..." required></textarea>
                </div>
                <div class="modal__reviews__item">
                    <input type="text" name="modal-reviews-name" placeholder="Ваше имя" required>
                </div>
                <div class="modal__reviews__item">
                    <input type="email" name="modal-reviews-email" placeholder="Email" required>
                </div>
                <div class="modal__captcha"></div>
                <button type="submit" class="modal__btn">
                    отправить отзыв
                    <svg>
                        <use xlink:href="#buttonArrow"></use>
                    </svg>
                </button>
                <input type="checkbox" id="modal__reviews__approval" name="approval" required>
                <label for="modal__reviews__approval" class="modal__approval">
                    <span class="check-circle"></span>
                    <div>нажимая на кнопку, я соглашаюсь с <a href="{$privacy_link | default : '#'}">политикой о конфиденциальности</a></div>
                </label>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="modal-questions" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <form action="{$form_action | default : '/'}">
                <div class="modal__top">
                    <h2>Задать вопрос</h2>
                    <span>Ответим в ближайшее время</span>
                </div>
                <input type="text" name="name" placeholder="Ваше имя" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="tel" name="phone" placeholder="+7(___)___-__-__" required>
                <div class="modal__model__choice">
                    <h4>Модель техники</h4>
                    <div class="model__choice__dropdown">
                        <button class="model__choice__btn" type="button">
                            <span class="model__choice__btn__text">выберите модель</span>
                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.25 7.5L9 11.25L12.75 7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </button>
                        <ul class="model__choice__list">
                            {foreach $model_options as $index => $model}
                                {set $model_id = $index + 1}
                                <li class="model__choice__item">
                                    <input type="radio" name="fac_model" id="fac_model-{$model_id}" value="{$model}"{if $index == 0} required{/if}>
                                    <label for="fac_model-{$model_id}">{$model}</label>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                <div class="modal__reviews__item">
                    <h4>Ваш вопрос</h4>
                    <textarea name="fac-question-text" rows="6" placeholder="Текст..." required></textarea>
                </div>
                <div class="modal__captcha"></div>
                <button type="submit" class="modal__btn">
                    отправить вопрос
                    <svg>
                        <use xlink:href="#buttonArrow"></use>
                    </svg>
                </button>
                <input type="checkbox" id="modal__questions__approval" name="approval" required>
                <label for="modal__questions__approval" class="modal__approval">
                    <span class="check-circle"></span>
                    <div>нажимая на кнопку, я соглашаюсь с <a href="{$privacy_link | default : '#'}">политикой о конфиденциальности</a></div>
                </label>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="modal-video-info" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <div class="modal__video__info">
                <h3 data-modal-video-title>Модернизированный 4-тактный двигатель Лончин</h3>
                <ol data-modal-video-pros>
                    <li>Быстрый разгон снегохода до 60 км/ч.</li>
                    <li>Стабильная работа двигателя на холостом ходу.</li>
                    <li>Уверенный запуск двигателя при низких температурах</li>
                </ol>
            </div>
        </div>
    </div>
</div>