{set $product_code = $code | default : ($_pls$_pls["article"] ?: '-')}
{set $product_price = $price | default : $_pls$_pls["price"]}
{set $vendor_logo = $brand | default : $_pls$_pls["vendor.logo"]}
{set $vendor_name = $brand_name | default : ($_pls$_pls["vendor.name"] ?: 'Производитель')}
{set $old_price = $old_price | default : $_pls$_pls["old_price"]}
{set $intro_video = $video | default : ''}
{set $gallery_placeholder = $_modx->runSnippet('msGallery', [
        'tpl' => '@FILE chunks/tpl_gallery_big.tpl',
        'limit' => 99
    ])}

<section class='def-section product-card' itemscope itemtype='http://schema.org/Product' id='msProduct'>
    <form action='{->resource.id | url}' class='ms2_form msoptionsprice-product' method='post'>
        <input type='hidden' name='id' value='{->resource.id}'>
        <input type='hidden' name='count' value='1'>

        <div class='dart-container'>
            <h1 class='product-card__title' itemprop='name'>
                {->resource.longtitle ?: ->resource.pagetitle}
                {if ->getPlaceholder('cf.city')}{->getPlaceholder('cf.city_r')}{/if}
            </h1>

            <div class='product-card__intro__container'>
                <div class='product-card__intro__top'>
                    <div class='product-card__intro__top__container'>
                        {if $vendor_logo}
                            <span class='product-card__intro__top__manufacturer'>
                                {$vendor_name}
                                <img class='product-card__intro__top__logo' src='{$vendor_logo}' alt='{$vendor_name | htmlent}'>
                            </span>
                        {/if}
                        <span class='product-card__intro__top__product-code'>
                            Код товара:<span> {$product_code}</span>
                        </span>
                        <span class='product-card__intro__top__availability'>
                            {->parseChunk('tpl.marketingTools.available', [
                                'id' => $_modx->resource.id
                            ])}
                        </span>
                    </div>
                </div>

                <div class='swiper__images__intro' data-slider='product__intro'>
                    {$gallery_placeholder}
                    <div class='scrollbar' data-scrollbar='product__intro'></div>
                </div>

                <div class='product-card__intro__info'>
                    <div class='product-card__intro__info__cart'>
                        {if $_pls$_pls["price"] > 0 && ($_modx->resource.hideprice != 1 || $_modx->hasSessionContext('mgr')) && $available == 1}
                            <button type='submit' name='ms2_action' value='cart/add' class='dart-btn dart-btn-primary dart-btn-block'>Купить</button>
                        {/if}
                    </div>

                    <div class='product-card__intro__info__buttons'>
                        <a href='{$_modx->resource.id | url}' data-id='{$_modx->resource.id}' class='product-card__intro__info__receiveCatalog btn-get-price'>
                            <div>
                                <span>рассчитать стоимость</span>
                                <p>с учётом доставки и способа оплаты</p>
                            </div>
                            <svg class='button__icon'><use xlink:href='#buttonArrow'></use></svg>
                        </a>
                        <a href='#fullparams' class='product-card__intro__info__characteristic'>
                            характеристики снегохода
                            <svg class='button__icon'><use xlink:href='#buttonArrow'></use></svg>
                        </a>
                    </div>

                    <div class='product-card__intro__info__price'>
                        {if $_pls$_pls["price"] > 0 && ($_modx->resource.hideprice != 1 || $_modx->hasSessionContext('mgr'))}
                            <span>от <b class='msoptionsprice-cost msoptionsprice-{$_modx->resource.id} add_linked_price'>{$_pls$_pls["price"]}</b> ₽</span>
                        {else}
                            {if $_modx->resource.hideprice != 1}
                                <span><b>Цена по запросу</b></span>
                            {/if}
                        {/if}
                        <p>Цена зависит от комплектации, доставки и спецпредложения.</p>
                    </div>
                </div>

                {if $_pls"image"}
                    <div class='product-card__intro__info__schema' hidden itemprop='offers' itemscope itemtype='http://schema.org/Offer'>
                        <meta itemprop='priceCurrency' content='RUB'>
                        <meta itemprop='price' content='{$_pls$_pls["price"] | replace : ' ' : '' | number:2:'.':''}'>
                    </div>
                {/if}
            </div>
        </div>
    </form>

    {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext('mgr')}
        {->runSnippet('!msAddLinked.input', [
            'tpl' => 'tpl_product_card_set_msal'
        ])}
    {/if}
</section>
