{* Основной чанк карточки товара — единая точка входа, вызывается из шаблона страницы.
   Внутри: интро + табы (tpl_product_card_tabs) + Комплектация (msAddLinked → tpl_product_card_set_msal). *}
{set $product_code = $_modx->getPlaceholder('article') ?: ($_modx->resource.article ?: ($_pls['article'] ?: '-'))}
{set $ms_price = $_modx->getPlaceholder('price') | replace : '&#160;' : '' | replace : '&nbsp;' : '' | replace : ' ' : ''}
{set $product_price = $ms_price ?: ($_modx->resource.price ?: 0)}
{set $ms_old_price = $_modx->getPlaceholder('old_price') | replace : '&#160;' : '' | replace : '&nbsp;' : '' | replace : ' ' : ''}
{set $old_price = $ms_old_price ?: ($_modx->resource.old_price ?: 0)}
{set $ms_image = $_modx->getPlaceholder('image') ?: ($_modx->resource.image ?: ($_pls['image'] ?: ''))}
{set $vendor_logo = $brand ?: ($_modx->getPlaceholder('vendor.logo') ?: ($_modx->resource.vendor_logo ?: $_pls['vendor.logo']))}
{set $vendor_name = $brand_name ?: ($_modx->getPlaceholder('vendor.name') ?: ($_modx->getPlaceholder('vendor') ?: $_pls['vendor.name']))}
{set $intro_video = $video ?: ''}
{set $gallery_placeholder = $_modx->runSnippet('msGallery', [
    'tpl' => '@FILE chunks/tpl_gallery_intro.tpl',
    'limit' => 99
])}

<section class='def-section product-card' itemscope itemtype='http://schema.org/Product' id='msProduct'>
    <form action='{$_modx->resource.id | url}' class='ms2_form msoptionsprice-product' method='post'>
        <input type='hidden' name='id' value='{$_modx->resource.id}'>
        <input type='hidden' name='count' value='1'>

        <div class='dart-container'>
            <h1 class='product-card__title' itemprop='name'>
                {$_modx->resource.longtitle ?: $_modx->resource.pagetitle}
            </h1>

            <div class='product-card__intro__container'>
                <div class='product-card__intro__top'>
                    <div class='product-card__intro__top__container'>
                        <span class='product-card__intro__top__manufacturer'>
                            Производитель
                            <img class='product-card__intro__top__logo' src='{$vendor_logo ?: '/assets/templates/snegotehnika/img/logo3.svg'}' alt='{$vendor_name ?: 'Производитель'}'>
                        </span>
                        <span class='product-card__intro__top__product-code'>
                            Код товара:<span> {$product_code}</span>
                        </span>
                        <span class='product-card__intro__top__availability'>
                            <span class="available">
                                <span class="available_label available_{$_modx->resource.available}">
                                    {if $_modx->resource.available == 1}
                                        В наличии
                                    {else}
                                        Нет в наличии
                                    {/if}
                                </span>
                            </span>
                        </span>
                        <div class='yandex-rating'>
                            {$_modx->runSnippet('!ecThreadRating', [
                                'thread' => 'review-' ~ $_modx->resource.id,
                                'tpl' => '@FILE chunks/tpl_product_card_rating.tpl'
                            ])}
                            <p>Рейтинг в Яндекс отзывах</p>
                        </div>
                    </div>
                    <div class='swiper__buttons'>
                        <button type='button' data-slider-prev='product__intro' class='swiper-button-prev'>
                            <svg width='24' height='24' viewBox='0 0 24 24' fill='none'>
                                <path d='M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z' fill='currentColor'/>
                            </svg>
                        </button>
                        <button type='button' data-slider-next='product__intro' class='swiper-button-next'>
                            <svg width='24' height='24' viewBox='0 0 24 24' fill='none' style='transform: rotate(180deg);'>
                                <path d='M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171L5.43765 13.3171L9.62247 17.5019Z' fill='currentColor'/>
                            </svg>
                        </button>
                    </div>
                </div>

                <div class='swiper__images__intro' data-slider='product__intro'>
                    <div class='swiper-wrapper'>
                        {$gallery_placeholder}
                    </div>
                    <div class='scrollbar' data-scrollbar='product__intro'></div>
                </div>

                <div class='product-card__intro__info'>
                    <div class='yandex-rating'>
                        {$_modx->runSnippet('!ecThreadRating', [
                            'thread' => 'review-' ~ $_modx->resource.id,
                            'tpl' => '@FILE chunks/tpl_product_card_rating.tpl'
                        ])}
                        <p>Рейтинг в Яндекс отзывах</p>
                    </div>

                    <div class='product-card__intro__info__buttons'>
                        <a href='{$_modx->resource.id | url}' data-id='{$_modx->resource.id}' class='product-card__intro__info__receiveCatalog btn-get-price'>
                            <div>
                                <span>рассчитать стоимость</span>
                                <p>с учётом доставки и способа оплаты</p>
                            </div>
                            <svg class='button__icon'><use xlink:href='#buttonArrow'></use></svg>
                        </a>
                        <a href='#fullparams' data-tab-link='specifications' class='product-card__intro__info__characteristic'>
                            характеристики снегохода
                            <svg class='button__icon'><use xlink:href='#buttonArrow'></use></svg>
                        </a>
                    </div>

                    {if $product_price > 0 && $_modx->resource.hideprice != 1}
                        <div class='product-card__intro__info__price'>
                            <span>от <b class='msoptionsprice-cost msoptionsprice-{$_modx->resource.id} add_linked_price'>{$product_price | number : 0 : '.' : ' '}</b> ₽</span>
                            <p>Цена зависит от комплектации, доставки и спецпредложения.</p>
                        </div>
                    {/if}
                </div>

                {if $gallery_placeholder && $_modx->resource.hideprice != 1 && $product_price > 0}
                    <div class='product-card__intro__info__schema' hidden itemprop='offers' itemscope itemtype='http://schema.org/Offer'>
                        <meta itemprop='priceCurrency' content='RUB'>
                        <meta itemprop='price' content='{$product_price | number : 2 : '.' : ''}'>
                    </div>
                {/if}
            </div>

            {* Табы должны лежать внутри .product-card и .dart-container — стили вложены так же *}
            {$_modx->getChunk('@FILE chunks/tpl_product_card_tabs.tpl')}
        </div>
    </form>

    {* Комплектация (msAddLinked): tpl строго через @FILE — компонент рендерит чанк
       самим pdoTools, путь тот же, что у врезок табов; простое имя даёт print_r-массив *}
    {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext('mgr')}
        {$_modx->runSnippet('!msAddLinked.input', [
            'tpl' => '@FILE chunks/tpl_product_card_set_msal.tpl'
        ])}
    {/if}
</section>