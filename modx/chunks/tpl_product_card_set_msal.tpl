{if $inputs}
    <div class="product-card__set">
        <div class="dart-container">
            <div class="product-card__set__top">
                <h3><b>Рассчитайте цену</b> за комплект</h3>
                <p>{$subtitle | default : 'Выберете комплектующие к снегоходу и узнайте полную стоимость снегохода с учётом доставки и способа оплаты'}</p>
            </div>
            <div class="product-card__set__inner">
                <div class="product-card__set__img__container">
                    <img src="{$_modx->resource.image | default : '/img/product__card/set/set_image.png'}" alt="" class="product-card__set__img">
                </div>
                <div class="product-card__set__list-wrapper">
                    <div class="product-card__set__list">
                        {foreach $inputs as $input}
                            <div class="product-card__set__list__item">
                                <div class="product-card__set__list__item__img">
                                    <img src="{$input['image'] | default : '/img/product__card/set/Rectangle 17.jpg'}" alt="">
                                </div>
                                <div class="product-card__set__list__item__inner">
                                    <div class="product-card__set__list__item__name">{$input['pagetitle']}</div>
                                    <div class="product-card__set__list__item__bottom">
                                        <div class="product-card__set__list__item__price">{$input['price']}</div>
                                        <button type="button" class="product-card__set__list__item__icon__container" data-modal-open="{$modal | default : 'modal--added-to-cart'}">
                                            <svg class="product-card__set__list__item__icon">
                                                <use xlink:href="#plus"></use>
                                            </svg>
                                            <svg class="product-card__set__list__item__icon product-card__set__list__item__icon--added">
                                                <use xlink:href="#plus-added"></use>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="product-card__set__list__scrollbar" data-set-scrollbar>
                        <div class="product-card__set__list__scrollbar__drag"></div>
                    </div>
                    <div class="product-card__set__list__receiveCatalog">
                        <a href="#" class="product-card__set__list__receiveCatalog__btn" data-modal-open="{$modal | default : 'modal-price_calculation'}">
                            <div>
                                <span>рассчитать стоимость</span>
                                <p>с учётом доставки и способа оплаты</p>
                            </div>
                            <svg class="button__icon">
                                <use xlink:href="#buttonArrow"></use>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}