{set $tile_img = $image ?: ($tv_image ?: '')}
{set $tile_hideprice = $hideprice ?: $_modx->runSnippet('pdoField', ['id' => $id, 'field' => 'hideprice'])}
{set $tile_price = ($price ?: '') | replace : '&#160;' : '' | replace : '&nbsp;' : '' | replace : ' ' : '' | replace : '.' : ''}
{set $tile_price = $tile_price ?: 0}
<div class="product-card__products__item">
    <div class="product-card__products__item__img">
        <a href="[[~[[+id]]]]">
            {if $tile_img}
                <img src="{$tile_img | phpthumbon : 'w=600&h=450&zc=1&q=95'}" alt="{$pagetitle | htmlent}" loading="lazy">
            {else}
                <img src="/img/catalog/img.png" alt="{$pagetitle | htmlent}" loading="lazy">
            {/if}
        </a>
    </div>
    <div class="product-card__products__item__inner">
        <div class="product-card__products__item__top">
            {if $available}
                <span class="product-card__item__parameter product-card__item__parameter--in-stock">В наличии</span>
            {/if}
            {if ($old_price ?: 0) > 0}
                <div class="product-card__products__item__tags">
                    <span class="product-card__item__parameter product-card__item__parameter--stock">Акция</span>
                </div>
            {/if}
        </div>
        <div class="product-card__products__item__content">
            <a href="[[~[[+id]]]]" class="product-card__products__item__name">{$pagetitle}</a>
            <div class="product-card__products__item__bottom">
                {if $tile_price > 0 && !$tile_hideprice}
                    <div class="product-card__products__item__price">от<b> {$tile_price | number : 0 : '.' : ' '} ₽</b></div>
                {/if}
                <a href="[[~[[+id]]]]" class="product-card__products__item__link">
                    <svg>
                        <use xlink:href="#buttonArrow"></use>
                    </svg>
                </a>
            </div>
        </div>
    </div>
</div>
