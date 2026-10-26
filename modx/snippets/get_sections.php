<?php
$time_start = microtime(true);
if($modx->user->id == 72){
	$tolog = 1;
}else{
	$tolog = 0;
}
if($tolog){
	$time = round((microtime(true) - $time_start), 2);
	$modx->log(xPDO::LOG_LEVEL_ERROR, $time." с - Начало парсинга контента Блоков", array(
		'target' => 'FILE',
		'options' => array(
			'filename' => 'monitoring_'.$modx->resource->id.'.log'
		)
	));
}
if(!$docid){
  $resource = $modx->resource;
}else{
  $resource = $modx->getObject("modResource", $docid);
}
if($tvname){
	$resource_id = $resource->get("id");

$pdo = $modx->getParser()->pdoTools;
		$output = '';
		$tvcontent = json_decode($resource->getTVValue($tvname), 1);
		if(!$tvcontent){
			$tvcontent = array();
		}

$only = isset($only) ? $only : '';
		$exclude = isset($exclude) ? $exclude : '';
		$onlyOut = isset($onlyOut) ? $onlyOut : '';
		$excludeOut = isset($excludeOut) ? $excludeOut : '';
		$striph2 = isset($striph2) ? $striph2 : '';

$outChunk = isset($outChunk) ? $outChunk : '';

$features = isset($features) ? $features : '';
		$gi = 0;
		foreach($tvcontent as $section){
			if($only !== '' || $exclude !== ''){
				$hit = ($only === '');
				foreach($section as $k => $v){
					if($k === 'chunk') continue;
					if(!is_string($v)) continue;
					if($only !== '' && !$hit && mb_stripos($v, $only) !== false){ $hit = true; }
					if($exclude !== '' && mb_stripos($v, $exclude) !== false){ $hit = false; break; }
				}
				if(!$hit) continue;
			}
			if($tolog){
				$time = round((microtime(true) - $time_start), 2);
				$modx->log(xPDO::LOG_LEVEL_ERROR, $time." с - Парсинг блока ".$section["chunk"], array(
					'target' => 'FILE',
					'options' => array(
						'filename' => 'monitoring_'.$modx->resource->id.'.log'
					)
				));
			}
			$renderChunk = ($features || $outChunk === '') ? $section["chunk"] : $outChunk;
			$chunkOut = $pdo->getChunk($renderChunk, $section);
			if($striph2 && !$features){
				$chunkOut = preg_replace('#<h2>.*?</h2>#is', '', $chunkOut, 1);
			}
			if($onlyOut !== '' && strpos($chunkOut, $onlyOut) === false){
				continue;
			}
			if($excludeOut !== '' && strpos($chunkOut, $excludeOut) !== false){
				continue;
			}
			if($features){

$gtitle = '';
				if(preg_match('#<h2[^>]*>(.*?)</h2>#is', $chunkOut, $hm)){
					$gtitle = trim(strip_tags($hm[1]));
					if(preg_match('/^Особенности/iu', $gtitle)){
						$gtitle = '';
					}
				}
				$gi++;
				$items = array();
				if(preg_match_all('#<!-- item -->(.*?)<!-- / item -->#s', $chunkOut, $im)){
					foreach($im[1] as $itemHtml){
						$caption = '';
						if(preg_match('#<span class="title">(.*?)</span>#s', $itemHtml, $cm)){
							$caption = trim(html_entity_decode(strip_tags($cm[1]), ENT_QUOTES, 'UTF-8'));
						}
						$poster = '';
						if(preg_match('#<img[^>]*\bsrc="([^"]+)"#i', $itemHtml, $pm)){
							$poster = $pm[1];
						}
						$video = '';
						if(preg_match('#<a[^>]*\bhref="(https?://[^"]+)"[^>]*data-fancybox#i', $itemHtml, $vm)){
							$video = $vm[1];
						}
						if($caption === '' && $poster === ''){
							continue;
						}
						$pros = array();
						if(preg_match_all('#<p[^>]*>(.*?)</p>#s', $itemHtml, $prm)){
							foreach($prm[1] as $one){
								$one = trim(html_entity_decode(strip_tags($one), ENT_QUOTES, 'UTF-8'));
								if($one !== ''){
									$pros[] = $one;
								}
							}
						}
						$n = count($items) + 1;
						$items[] = array(
							'caption' => $caption,
							'poster' => $poster,
							'video' => $video,
							'info' => 'f' . $gi . '-' . $n,
							'pros_json' => json_encode($pros, JSON_UNESCAPED_UNICODE),
						);
					}
				}
				if($outChunk === '' || !$items){
					continue;
				}
				$chunkOut = $pdo->getChunk($outChunk, array(
					'name' => 'features' . $gi,
					'title' => $gtitle,
					'items' => $items,
				));
			}
			$output .= $chunkOut;
		}

if($tolog){
			$time = round((microtime(true) - $time_start), 2);
			$modx->log(xPDO::LOG_LEVEL_ERROR, $time." с - Конец парсинга блоков", array(
				'target' => 'FILE',
				'options' => array(
					'filename' => 'monitoring_'.$modx->resource->id.'.log'
				)
			));
		}
		return $output;	

}else{
  echo "ERROR: не указан TV!";
}
