{if $complects}
    <div class="product-card__set">
        <div class="dart-container">
            <div class="product-card__set__top">
                <h3><b>Рассчитайте цену</b> за комплект</h3>
                <p>{$subtitle | default : 'Выберете комплектующие к снегоходу и узнайте полную стоимость снегохода с учётом доставки и способа оплаты'}</p>
            </div>
            {foreach $complects as $complect}
                <div class="product-card__set__inner">
                    <div class="product-card__set__img__container">
                        <img src="{$complect['data']['image'] | default : '/img/product__card/set/set_image.png'}" alt="" class="product-card__set__img">
                    </div>
                    <div class="product-card__set__list-wrapper">
                        <div class="product-card__set__list">
                            {foreach $complect['products'] as $product}
                                {if $product['price'] > 0}
                                    {$_modx->getChunk('{$item_tpl | default : "tpl_product_card_complect_item"}', [
                                        'name' => $product['pagetitle'],
                                        'price' => ($product['price'] | number : 0 : '.' : ' ') ~ ' ₽',
                                        'image' => $product['image'],
                                        'modal' => $modal
                                    ])}
                                {/if}
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
            {/foreach}
        </div>
    </div>
{/if}