{set $rows = $_modx->resource.catalog_info | fromJSON}

{if $rows?}
<div class="catalog__info">
  <div class="swiper__catalog__inner">
    <div class="swiper__catalog">
      <div class="swiper-wrapper">
        {foreach $rows as $row}
          <div class="swiper-slide">
            <div class="catalog__info__item">
              <div class="catalog__info__item__inner">
                <div class="catalog__info__item__left">
                  {if $row.icon}
                    <img src="{$row.icon}" alt="{$row.title}">
                  {/if}
                </div>
                <div class="catalog__info__item__right">
                  <h3>{$row.title}</h3>
                  <p>{$row.text}</p>
                </div>
              </div>
            </div>
          </div>
        {/foreach}
      </div>
      <div class="dart-container">
        <div class="swiper__catalog-scrollbar"></div>
      </div>
    </div>
  </div>
</div>
{/if}