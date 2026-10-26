<?php

$limit = (int)($scriptProperties['limit'] ?? 20);
$offset = (int)($scriptProperties['offset'] ?? 0);
$tpl = !empty($scriptProperties['tpl']) ? $scriptProperties['tpl'] : '@FILE chunks/tpl_faq_row.tpl';
$thread = 'question-' . (int)$modx->resource->id;

$corePath = $modx->getOption('ec_core_path', null, $modx->getOption('core_path') . 'components/easycomm/');
$modx->addPackage('easycomm', $corePath . 'model/');

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
    'limit' => $limit,
    'offset' => $offset,
    'return' => 'data',
);

$pdoFetch->setConfig(array_merge($default, $scriptProperties), false);
$messages = $pdoFetch->run();

if (empty($messages) || !is_array($messages)) {
    return '';
}

$output = array();
foreach ($messages as $row) {
    $parts = preg_split('/\s+/u', trim($row['user_name']), -1, PREG_SPLIT_NO_EMPTY);
    $initials = mb_substr($parts[0] ?? '', 0, 1) . mb_substr($parts[1] ?? '', 0, 1);
    $row['initials'] = $initials !== '' ? $initials : '?';
    $output[] = $pdoFetch->getChunk($tpl, $row, true);
}

return '<!--faq:v5-->' . implode("\n", $output);
