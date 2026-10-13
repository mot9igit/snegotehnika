{if $filters?}
	
{/if}
<div class="msearch2" id="mse2_mfilter">
    <div class="catalog__sort">
        <span class="catalog__sort__label" data-sort-trigger>
            <span class="catalog__sort__label__text">сортировка:</span>
            <svg class="catalog__sort__label__icon"><use xlink:href="#accordion__plus"></use></svg>
        </span>

        <div class="catalog__sort__select" id="mse2_sort">
            <a href="#" data-sort="resource|pagetitle" data-dir="[[+mse2_sort:is=`resource|pagetitle:desc`:then=`desc`]]" data-default="desc" class="sort catalog__sorting__item[[+mse2_sort:is=`resource|pagetitle:asc`:then=` active`]]">по наименованию<span></span></a>
            <a href="#" data-sort="resource|createdon" data-dir="[[+mse2_sort:is=`resource|createdon:desc`:then=`desc`]]" data-default="desc" class="sort catalog__sorting__item[[+mse2_sort:is=`resource|createdon:desc`:then=` active`]]">новинки<span></span></a>
            <a href="#" data-sort="ms|old_price" data-dir="[[+mse2_sort:is=`ms|old_price:desc`:then=`desc`]]" data-default="desc" class="sort catalog__sorting__item[[+mse2_sort:is=`ms|old_price:desc`:then=` active`]]">акции<span></span></a>
            <a href="#" data-sort="ms|price" data-dir="[[+mse2_sort:is=`ms|price:desc`:then=`desc`]]" data-default="asc" class="sort catalog__sorting__item[[+mse2_sort:is=`ms|price:asc`:then=` active`]]">по цене<span></span></a>
            <a href="#" data-sort="ms|available" data-dir="[[+mse2_sort:is=`ms|available:desc`:then=`desc`]]" data-default="asc" class="sort catalog__sorting__item[[+mse2_sort:is=`ms|available:asc`:then=` active`]]">по наличию<span></span></a>
        </div>
    </div>

    <div class="catalog__container">
        <div class="dart-row" id="mse2_results">
            {$results}
        </div>
    </div>

    <div class="paging mse2_pagination">
        <nav>
            {'ppage.nav' | placeholder}
        </nav>
    </div>
</div>