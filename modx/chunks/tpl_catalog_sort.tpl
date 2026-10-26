{set $options = 'resource|pagetitle:asc#по наименованию#1;resource|createdon:desc#новинки#0;ms|old_price:desc#акции#0;ms|price:asc#по цене#1;ms|available:asc#по наличию#1'}
{set $request = $_modx->request}
{set $pageUrl = $_modx->makeUrl($_modx->resource.id)}
{set $default = 'ms|available:asc'}

{set $current = $default}
{set $page = ''}
{if $request}
	{set $current = $request->getParam('sort','string',$default)}
	{set $page = $request->getParam('ppage.nav','string','')}
{/if}

{set $currentParts = explode(':', $current)}
{set $curField = $currentParts[0]}
{set $curDir = 'asc'}
{if count($currentParts) > 1}{set $curDir = $currentParts[1]}{/if}

<div class="catalog__sort">
	<span class="catalog__sort__label" data-sort-trigger>
		<span class="catalog__sort__label__text">сортировка:</span>
		<svg class="catalog__sort__label__icon"><use xlink:href="#accordion__plus"></use></svg>
	</span>
	<div class="catalog__sort__select">
		{foreach explode(';', $options) as $option}
			{set $optionParts = explode('#', $option)}
			{set $sortParts = explode(':', $optionParts[0])}
			{set $optField = $sortParts[0]}
			{set $optDir = 'asc'}
			{if count($sortParts) > 1}{set $optDir = $sortParts[1]}{/if}
			{set $optTitle = $optField}
			{if count($optionParts) > 1}{set $optTitle = $optionParts[1]}{/if}
			{set $optToggle = '0'}
			{if count($optionParts) > 2}{set $optToggle = $optionParts[2]}{/if}

{set $isActive = $optField == $curField}
			{set $targetDir = $optDir}
			{if $isActive && $optToggle == '1'}
				{if $curDir == 'asc'}{set $targetDir = 'desc'}{else}{set $targetDir = 'asc'}{/if}
			{/if}

{set $value = sprintf('%s:%s', $optField, $targetDir)}
			{set $qs = sprintf('sort=%s', urlencode($value))}
			{if $page}{set $qs = sprintf('%s&ppage.nav=%s', $qs, urlencode($page))}{/if}
			{set $url = "{$pageUrl}?{$qs}"}

<a href="{$url}" class="catalog__sorting__item{if $isActive} active{/if}{if $optToggle == '1'} catalog__sorting__item--choice{/if}{if $isActive && $curDir == 'desc'} sort-desc{/if}">{$optTitle}{if $optToggle == '1'}<span class="icon-arrow-top"></span>{/if}</a>
		{/foreach}
	</div>
</div>