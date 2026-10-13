<?php
/**
 * Список моделей для дропдауна «Модель техники» в модалке отзыва (form_review.tpl).
 * Товары из категории текущего товара; текущий товар помечен active/checked
 * прямо здесь (в разметке). Возвращает HTML пунктов <li> для ul.model__choice__list.
 *
 * Вызов из чанка: {'@FILE snippets/get_review_models.php' | snippet}
 * В чанке не должно быть {set}/запросов — при заливке они не доезжают.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$parent = (int)$modx->resource->parent;
if (!$parent) {
    return '';
}

/* @var pdoResources приходит с pdoTools */
$rows = $modx->runSnippet('pdoResources', array(
    'parents' => $parent,
    'depth' => 0,
    'limit' => 0,
    'select' => '{"id":"id","pagetitle":"pagetitle"}',
    'sortby' => 'pagetitle',
    'return' => 'data',
));

$out = '';
$currentId = (int)$modx->resource->id;
foreach ((array)$rows as $row) {
    $id = (int)$row['id'];
    $title = htmlspecialchars($row['pagetitle'], ENT_QUOTES, 'UTF-8');
    $current = $id === $currentId;
    $out .= '<li class="model__choice__item' . ($current ? ' active' : '') . '">'
        . '<input type="radio" name="model" id="ec-model-' . $id . '" value="' . $title . '" data-id="' . $id . '"' . ($current ? ' checked' : '') . '>'
        . '<label for="ec-model-' . $id . '">' . $title . '</label>'
        . '</li>';
}

return $out;
