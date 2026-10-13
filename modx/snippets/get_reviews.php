<?php
/**
 * Отзывы товара для карточки (вкладка «Отзывы»).
 * Данные — EasyComm: тред review-{id} (тот же, что у рейтинга ecThreadRating).
 * Считает инициалы, дату по-русски, звёзды рейтинга и сводку (средний балл, число оценок).
 *
 * Вызов: {'@FILE snippets/get_reviews.php' | snippet}
 * Возвращает HTML первых &limit (3) отзывов; остальное и сводка — в плейсхолдерах:
 *   reviews_rest   — HTML остальных отзывов (для скрытого списка «показать больше»)
 *   reviews_rating — средний балл («4,9»)
 *   reviews_count  — число отзывов со словом («3 оценки»)
 *   reviews_stars  — HTML звёзд сводки
 * Параметры:
 *   &limit — сколько показать сразу (по умолчанию 3)
 *   &chunk — чанк строки (по умолчанию '@FILE chunks/tpl_reviews_row.tpl')
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$limit = (int)($scriptProperties['limit'] ?? 3);
$tpl = !empty($scriptProperties['chunk']) ? $scriptProperties['chunk'] : '@FILE chunks/tpl_reviews_row.tpl';
$thread = 'review-' . (int)$modx->resource->id;

// Пакет EasyComm (сообщения/треды)
$corePath = $modx->getOption('ec_core_path', null, $modx->getOption('core_path') . 'components/easycomm/');
$modx->addPackage('easycomm', $corePath . 'model/');

/* @var pdoFetch $pdoFetch */
$fqn = $modx->getOption('pdoFetch.class', null, 'pdotools.pdofetch', true);
if ($pdoClass = $modx->loadClass($fqn, '', false, true)) {
    $pdoFetch = new $pdoClass($modx, $scriptProperties);
}
elseif ($pdoClass = $modx->loadClass($fqn, MODX_CORE_PATH . 'components/pdotools/model/', false, true)) {
    $pdoFetch = new $pdoClass($modx, $scriptProperties);
}
else {
    return '';
}

$default = array(
    'class' => 'ecMessage',
    'disableConditions' => true,
    'select' => $modx->toJSON(array(
        'ecMessage' => $modx->getSelectColumns('ecMessage', 'ecMessage'),
        'ecThread' => $modx->getSelectColumns('ecThread', 'Thread', 'thread_'),
    )),
    'innerJoin' => $modx->toJSON(array(
        'ecThread' => array('alias' => 'Thread', 'on' => '`ecMessage`.`thread` = `Thread`.`id`'),
    )),
    'where' => $modx->toJSON(array(
        'Thread.name' => $thread,
        'ecMessage.published' => 1,
        'ecMessage.deleted' => 0,
    )),
    'sortby' => 'date',
    'sortdir' => 'DESC',
    'limit' => 100,
    'return' => 'data',
);

$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);
$messages = $pdoFetch->run();

// Звёзды: N залитых + (5-N) серых
$makeStars = function ($rating) {
    $out = '';
    for ($i = 1; $i <= 5; $i++) {
        $out .= $i <= $rating
            ? '<span class="product-card__stars__star"></span>'
            : '<span class="product-card__stars__star" style="--star-color:#d9d9d9"></span>';
    }
    return $out;
};

$months = array(1 => 'января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');

// Сводка: средний балл (только если у отзывов есть оценки) и счётчик
$total = is_array($messages) ? count($messages) : 0;
$sum = 0;
$rated = 0;
foreach ($messages as $m) {
    if (!empty($m['rating'])) {
        $sum += (int)$m['rating'];
        $rated++;
    }
}
$avg = $rated ? $sum / $rated : 0;
$modx->setPlaceholder('reviews_rating', $rated ? str_replace('.', ',', number_format($avg, 1)) : '');
$modx->setPlaceholder('reviews_stars', $rated ? $makeStars((int)round($avg)) : '');

// Склонение: «N оценок», а если оценок нет — «N отзывов»
$count = $rated ? $rated : $total;
if ($rated) {
    $one = 'оценка';
    $few = 'оценки';
    $many = 'оценок';
}
else {
    $one = 'отзыв';
    $few = 'отзыва';
    $many = 'отзывов';
}
$last = $count % 10;
$last2 = $count % 100;
if ($last == 1 && $last2 != 11) {
    $word = $one;
}
elseif ($last >= 2 && $last <= 4 && ($last2 < 10 || $last2 >= 20)) {
    $word = $few;
}
else {
    $word = $many;
}
$modx->setPlaceholder('reviews_count', $count ? $count . ' ' . $word : '');

if (!$total) {
    return '';
}

// Строки: первые &limit — в вывод, остальное — в плейсхолдер reviews_rest
$output = array();
$rest = array();
foreach ($messages as $idx => $row) {
    // Оценка отзыва: поле rating есть не у всех — без неё звёзды не показываем
    $rating = !empty($row['rating']) ? (int)$row['rating'] : 0;
    // Инициалы: «Герман Рузов» -> ГР, «Михаил» -> М
    $parts = preg_split('/\s+/u', trim($row['user_name']), -1, PREG_SPLIT_NO_EMPTY);
    $initials = mb_substr($parts[0] ?? '', 0, 1) . mb_substr($parts[1] ?? '', 0, 1);
    $row['initials'] = $initials !== '' ? $initials : '?';
    $row['stars'] = $rating ? $makeStars($rating) : '';
    // Дата как на старом сайте: «30 сентября 2025, 13:18»
    $ts = strtotime($row['date']);
    $row['date_ru'] = $ts ? date('j', $ts) . ' ' . $months[(int)date('n', $ts)] . ' ' . date('Y, H:i', $ts) : '';
    $html = $pdoFetch->getChunk($tpl, $row, true);
    if ($idx < $limit) {
        $output[] = $html;
    }
    else {
        $rest[] = $html;
    }
}

$modx->setPlaceholder('reviews_rest', implode("\n", $rest));

// Маркер версии — виден в HTML, чтобы проверять, какой сниплет отработал
return '<!--rev:v2-->' . implode("\n", $output);
