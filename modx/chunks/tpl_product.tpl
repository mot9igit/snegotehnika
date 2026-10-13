{* Плитка товара в каталоге — чанк mFilter2 (&tpl) и pdoPage, вызывается как chunks/tpl_product.tpl.
   Восстановлен 13.10.2026 по макету pages/catalog.html: исходный файл на сервере утерян
   (pdoTools: Template chunks/tpl_product.tpl not found → пустые списки в каталоге).
   Блок характеристик (Габариты/Мощность/...) пока не выводится — источник данных уточняется. *}
{set $tile_img = $image ?: ($tv_image ?: '')}
{* Списки (mFilter2/pdoPage) не отдают поле hideprice — запрашиваем его у товара напрямую,
   иначе цена видна даже там, где её показывать нельзя. *}
{set $tile_hideprice = $hideprice ?: $_modx->runSnippet('pdoField', ['id' => $id, 'field' => 'hideprice'])}
{* Цена приходит уже отформатированной («405 000» / «405.000» с разделителями) —
   вычищаем пробелы/nbsp/точки, приводим к числу и форматируем заново. *}
{set $tile_price = ($price ?: '') | replace : '&#160;' : '' | replace : '&nbsp;' : '' | replace : ' ' : '' | replace : '.' : ''}
{set $tile_price = $tile_price ?: 0}
<div class="catalog__item">
    <div class="catalog__item__img">
        <a href="[[~[[+id]]]]">
            {if $tile_img}
                <img src="{$tile_img | phpthumbon : 'w=600&h=450&zc=1&q=95'}" alt="{$pagetitle | htmlent}" loading="lazy">
            {else}
                <img src="/img/catalog/img.png" alt="{$pagetitle | htmlent}" loading="lazy">
            {/if}
        </a>
    </div>
    <div class="catalog__item__inner">
        <div class="catalog__item__header">
            <div class="catalog__item__header__top">
                {if $available}
                    <span class="catalog__item__parameter">В наличии</span>
                {/if}
                {if ($old_price ?: 0) > 0}
                    <div class="catalog__item__container__parameter">
                        <span class="catalog__item__parameter catalog__item__parameter--stock">Акция</span>
                    </div>
                {/if}
            </div>
            <a href="[[~[[+id]]]]" class="catalog__item__name">{$pagetitle}</a>
        </div>
        <div class="catalog__item__footer">
            {if $tile_price > 0 && !$tile_hideprice}
                <span>от <b>{$tile_price | number : 0 : '.' : ' '} ₽</b></span>
            {/if}
            <div class="catalog__item__footer__buttons">
                <button type="button" class="catalog__item__footer__calculation" data-modal-open="modal-price_calculation">
                    <p>рассчитать стоимость</p>
                    <span class="icon-calculyator"></span>
                </button>
                <a href="[[~[[+id]]]]" class="catalog__item__footer__link">
                    <svg>
                        <use xlink:href="#buttonArrow"></use>
                    </svg>
                </a>
            </div>
        </div>
    </div>
</div>
