<div class="product-card__set__list__item">
    <div class="product-card__set__list__item__img">
        <img src="{$image | default : '/img/product__card/set/Rectangle 17.jpg'}" alt="">
    </div>
    <div class="product-card__set__list__item__inner">
        <div class="product-card__set__list__item__name">{$name}</div>
        <div class="product-card__set__list__item__bottom">
            <div class="product-card__set__list__item__price">{$price}</div>
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