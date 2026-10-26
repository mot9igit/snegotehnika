<?php
$modx->log(1, 'get_card_bottom4 START');
try {
    $id = (int)$modx->resource->id;
    $parent = (int)$modx->resource->parent;
    $see = '';
    if ($parent) {
        $tvTable = $modx->getTableName('modTemplateVar');
        $tvrTable = $modx->getTableName('modTemplateVarResource');
        $sql = "SELECT rv.value FROM {$tvrTable} rv"
            . " INNER JOIN {$tvTable} tv ON tv.id = rv.tmplvarid"
            . " WHERE rv.contentid = {$parent} AND tv.name = 'see_podborki' LIMIT 1";
        $q = $modx->query($sql);
        if ($q) {
            $see = (string)$modx->getValue($q);
        }
    }
    $arrowPath = 'M9.62247 17.5019C9.73584 17.6075 9.82678 17.7349 9.88984 17.8765'
        . 'C9.95291 18.018 9.98682 18.1708 9.98956 18.3257C9.99229 18.4807 9.96379 18.6346 9.90575 18.7783'
        . 'C9.84772 18.9219 9.76134 19.0525 9.65176 19.162C9.54219 19.2716 9.41167 19.358 9.26799 19.416'
        . 'C9.12431 19.4741 8.97041 19.5026 8.81548 19.4998C8.66054 19.4971 8.50774 19.4632 8.3662 19.4001'
        . 'C8.22465 19.337 8.09726 19.2461 7.99162 19.1327L1.83746 12.9786C1.62137 12.7622 1.5 12.4689 1.5 12.1632'
        . 'C1.5 11.8574 1.62137 11.5641 1.83746 11.3477L7.99162 5.19357C8.09726 5.0802 8.22465 4.98927 8.3662 4.9262'
        . 'C8.50774 4.86313 8.66054 4.82922 8.81548 4.82649C8.97041 4.82375 9.12431 4.85225 9.26799 4.91029'
        . 'C9.41167 4.96832 9.54219 5.05471 9.65176 5.16428C9.76134 5.27385 9.84772 5.40437 9.90575 5.54805'
        . 'C9.96379 5.69174 9.99229 5.84563 9.98956 6.00057C9.98682 6.1555 9.95291 6.3083 9.88984 6.44985'
        . 'C9.82678 6.59139 9.73584 6.71878 9.62247 6.82442L5.43765 11.0092L20.3461 11.0092'
        . 'C20.6521 11.0092 20.9456 11.1308 21.162 11.3472C21.3784 11.5636 21.5 11.8571 21.5 12.1632'
        . 'C21.5 12.4692 21.3784 12.7627 21.162 12.9791C20.9456 13.1955 20.6521 13.3171 20.3461 13.3171'
        . 'L5.43765 13.3171L9.62247 17.5019Z';
    $arrow = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none">'
        . '<path d="' . $arrowPath . '" fill="currentColor"/></svg>';
    $arrowNext = str_replace('<svg ', '<svg style="transform: rotate(180deg);" ', $arrow);
    $rec = '';
    if ($see) {
        $rec = $modx->runSnippet('msProducts', [
            'parents' => $see,
            'tpl' => '@FILE chunks/tpl_card_slide.tpl',
            'outputSeparator' => '</div><div class="swiper-slide">',
            'where' => ['class_key' => 'msProduct'],
            'limit' => 15,
        ]);
    }
    else {
        $modx->runSnippet('!modRelation', [
            'field' => 'pagetitle',
            'separator' => ' ',
            'limitWord' => 3,
            'element' => 'msProducts',
            'parents' => $see ?: 2,
            'tpl' => '@FILE chunks/tpl_card_slide.tpl',
            'outputSeparator' => '</div><div class="swiper-slide">',
            'sortby' => 'RAND()',
            'toPlaceholder' => 'relation',
        ]);
        $rec = $modx->getPlaceholder('relation');
        if (!$rec) {
            $rec = $modx->runSnippet('msProducts', [
                'parents' => $see ?: 2,
                'tpl' => '@FILE chunks/tpl_card_slide.tpl',
                'outputSeparator' => '</div><div class="swiper-slide">',
                'where' => ['class_key' => 'msProduct'],
                'limit' => 15,
            ]);
        }
    }
    $rel = $modx->runSnippet('msProducts', [
        'parents' => $parent,
        'resources' => '-' . $id,
        'limit' => 8,
        'tpl' => '@FILE chunks/tpl_card_slide.tpl',
        'outputSeparator' => '</div><div class="swiper-slide">',
    ]);
    $out = '';
    if ($rec) {
        $out .= '<div class="product-card__bottom__item" id="section_rec_1">'
            . '<div class="product-card__bottom__item__top">'
            . '<h3><b>&#1056;&#1077;&#1082;&#1086;&#1084;&#1077;&#1085;&#1076;&#1086;&#1074;&#1072;&#1085;&#1085;&#1099;&#1077;</b> &#1090;&#1086;&#1074;&#1072;&#1088;&#1099;</h3>'
            . '<div class="swiper__buttons">'
            . '<button type="button" data-slider-prev="recommended" class="swiper-button-prev">'
            . $arrow . '</button>'
            . '<button type="button" data-slider-next="recommended" class="swiper-button-next">'
            . $arrowNext . '</button>'
            . '</div></div>'
            . '<div data-slider="recommended" class="swiper__product-card__products">'
            . '<div class="swiper-wrapper">'
            . '<div class="swiper-slide">' . $rec . '</div>'
            . '</div></div></div>';
    }
    if ($rel) {
        $out .= '<div class="product-card__bottom__item">'
            . '<div class="product-card__bottom__item__top">'
            . '<h3><b>&#1055;&#1086;&#1093;&#1086;&#1078;&#1080;&#1077;</b> &#1090;&#1086;&#1074;&#1072;&#1088;&#1099;</h3>'
            . '<div class="swiper__buttons">'
            . '<button type="button" data-slider-prev="related" class="swiper-button-prev">'
            . $arrow . '</button>'
            . '<button type="button" data-slider-next="related" class="swiper-button-next">'
            . $arrowNext . '</button>'
            . '</div></div>'
            . '<div data-slider="related" class="swiper__product-card__products">'
            . '<div class="swiper-wrapper">'
            . '<div class="swiper-slide">' . $rel . '</div>'
            . '</div></div></div>';
    }
    $modx->log(1, 'get_card_bottom4 OK rec=' . strlen((string)$rec) . ' rel=' . strlen((string)$rel) . ' see=' . $see);
    return $out ? '<!--recblocks:v5-->' . $out : '';
}
catch (Throwable $e) {
    $modx->log(1, 'get_card_bottom4 ERR: ' . $e->getMessage() . ' | ' . $e->getFile() . ':' . $e->getLine());
    return '';
}
