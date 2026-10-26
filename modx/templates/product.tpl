{extends 'file:templates/index.tpl'}
{block 'content'}
{* {if $_modx->resource.show_big_form != 1} *}
    {include 'file:chunks/base_breadcrumbs.tpl'}
{* {/if} *}
<!-- CONTENT -->
{$_modx->runSnippet("!msOptionsPrice.initialize", [])}
{* <div class="flyer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 col-12">
                <a href="{$_modx->resource.id | url}">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</a>
            </div>
            <div class="col-md-6 col-12 text-right">
                <div class="inliner vam">
                    <span class="price">
                        {if $_pls['price'] > 0 && $_modx->resource.hideprice != 1}
                            {if ($_modx->user.id | umember : 'opt') && $_pls['opt_price'] > 0}
                                <span class="msoptionsprice-cost msoptionsprice-{$_modx->resource.id}">
                                    {$_pls['opt_price']}
                                </span> <i class="fa fa-ruble"></i>
                            {else}
                                <span class="msoptionsprice-cost msoptionsprice-{$_modx->resource.id}">
                                    {$_pls['price']}
                                </span> <i class="fa fa-ruble"></i>
                            {/if}
                        {else}
                            {if $_modx->resource.hideprice != 1}
                                <small>Цена по запросу</small>
                            {/if}
                        {/if}
                    </span>

                    <form action="{$id | url}" class="ms2_form msoptionsprice-product" method="post">
                        <input type="hidden" name="id" value="{$_modx->resource.id}"/>
                        <input type="hidden" name="count" value="1"/>
                        {if $available == 1}
                            {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext("mgr")}
                                <button type="submit" name="ms2_action" value="cart/add" class="btn btn-primary">Купить</button>
        					{else}
        					    <button class="btn btn-primary btn-get-price" data-id="{$_modx->resource.id}">Расчитать цену</button>
        					{/if}
        				{else}
                            <a href="#" data-toggle="modal" data-target="#get_analog" class="btn btn-primary analog_href" data-product="{$_modx->resource.pagetitle}">Подобрать аналог</a>
                        {/if}
                    </form>

                </div>
            </div>
        </div>
    </div>
</div> *}
{* {if $_modx->resource.show_big_form == 1}
    {set $image = $_modx->runSnippet("phpthumbon", [
	"input" => $_modx->resource.show_big_form_image,
	"options" => "w=1920&h=800&zc=1&q=99"
	])}
	{if $image}
        <div class="main_block__mobile_img">
            {if $_modx->resource.show_big_form_image_mobile}
                <img src="{$_modx->resource.show_big_form_image_mobile}" alt="">
            {else}
                <img src="{$image}" alt="">
            {/if}
        </div>
    {/if}
    <section class="main_block {$class}" style="background-image: url({$image})">

        <div class="container">
            <div class="caption">
                <span class="title">{if $_modx->resource.show_big_form_title}{$_modx->resource.show_big_form_title}{else}{$_modx->resource.longtitle|ucase ?: $_modx->resource.pagetitle|ucase} {/if}</span>
                {if $_modx->resource.show_big_form_subtitle}
                    <p>{$_modx->resource.show_big_form_subtitle}</p>
                {/if}
                {if $_modx->resource.show_big_form_bullets}
                <div class="bullets">
                    {set $rows = json_decode($_modx->resource.show_big_form_bullets, true)}
            	    {foreach $rows as $key => $row}
                        <!-- item -->
                        <div class="item">
                            <div class="item__icon">
                                <i class="fa {$row.icon?:'fa-check'}"></i>
                            </div>
                            <div class="item__text">
                                <span class="title">{$row.title}</span>
                                {$row.text}
                            </div>
                        </div>
                        <!-- / item -->
                    {/foreach}
                </div>
                {/if}
                <div class="form_container">
                    {$_modx->runSnippet("!AjaxForm", [
                	  'snippet' => 'FormIt',
                	  'form' => '@FILE chunks/form_screen_advanced.tpl',
                	  'hooks' => 'nospam,dartCRM,FormItSaveForm,email',
                	  'emailTpl' => '@FILE chunks/email_email.tpl',
                	  'emailSubject' => $title,
                	  'emailTo' => $_modx->getPlaceholder('+conf_to_email'),
                	  'emailFrom' => $_modx->config.emailsender,
                	  'formName' => "Заявка с первого экрана",
                	  'validate' => 'page:required,phone:required,username:blank',
                	  'title' => $_modx->resource.show_big_form_title,
                	  'anchor' => $_modx->resource.show_big_form_anchor? : 'Отправить',
                	  'event' => $_modx->resource.show_big_form_event? : 'firstscreen'
                	  ])}
                </div>
            </div>
        </div>
    </section>
{/if} *}

{'@FILE chunks/tpl_product_card.tpl' | chunk}

{* {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext("mgr")}
        {$_modx->runSnippet("!msAddLinked.input", [
            "priceTarget" => ".add_linked_price",
            'link' => 2,
            "limit" => "20",
            "product" => $_modx->resource.id,
            "tpl" => "@FILE chunks/tpl_addicted.tpl",
            "toPlaceholder" => "addLinked"
        ])}
    {/if} *}
{set $show_old = 0}
{if $show_old}
<section class="def-section content" itemscope itemtype="http://schema.org/Product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product-details">
                    <h1 itemprop="name">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle} {if $_modx->getPlaceholder("cf.city")}{$_modx->getPlaceholder("cf.city_r")}{/if}</h1>



                    <form action="{$id | url}" class="ms2_form msoptionsprice-product" method="post">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="product-gallery msoptionsprice-gallery">
                                    <div class="bigger">
                                        {$_modx->runSnippet("msGallery", [
                                            'tpl' => '@FILE chunks/tpl_gallery_big.tpl'
                                        ])}


                                        {if $_pls["vendor.logo"]}
                                            <img src="{$_pls["vendor.logo"]}" class="vendor" alt="{$_pls["vendor.name"] | htmlent}">
                                        {/if}
                                    </div>
                                    <!-- small gal -->
                                    <div class="small-gallery owl-carousel">

                                        {if $_modx->resource.videoLink}
                                        {set $el = json_decode($_modx->resource.videoLink, true)}
                                        <div class="item" data-rid="{$_modx->resource.id}" data-iid="{$el['videoId']}">
                                            {set $image = $el['image']}
                                            {if $image}
                                                {set $imgs = $_modx->runSnippet("phpthumbon",[
                                                    "input" => "assets/files/"~$image,
                                                    "options" => "w=113&h=85&zc=1"
                                                ])}
                                            {else}
                                                {set $imgs = $_modx->runSnippet("phpthumbon",[
                                                    "input" => $_modx->getPlaceholder("+conf_noimage"),
                                                    "options" => "w=113&h=85&zc=1"
                                                ])}
                                            {/if}
                                            <img src="{if $image}{$image}{else}{$imgs}{/if}" alt="{$el['title'] | htmlent}">
                                        </div>
                                        {/if}


                                        {$_modx->runSnippet("msGallery", [
                                            'tpl' => '@FILE chunks/tpl_gallery_small.tpl'
                                        ])}


                                    </div>
                                    <!-- / small gal -->
                                </div>
                            </div>
                            {if $content}
                				<div class="text-block">
                					<div class="w">
                					   {$content}
                					</div>
                				</div>
                			{/if}
                            <div class="col-lg-6">
                                <div class="product-description">

                                    <div class="description">
                            			<p itemprop="description">{$_modx->resource.introtext}</p>
                            		</div>
                            		<div class="meta-info">
                                        <div class="item">
                                            {$_modx->parseChunk('tpl.marketingTools.available', [
                                                'id' => $_modx->resource.id
                                            ])}
                                        </div>
                                        <div class="item">
                                            {$_modx->runSnippet("!addComparison", [
                                                'list_id' => 10,
                                                'list' => $_modx->resource.parent | resource: "list_name",
                                                'id' => $_modx->resource.id
                                            ])}
                                        </div>
                                    </div>
                                    {if ($_modx->user.id | umember : 'opt')}
                                        <div class="opt_info">

                                    		{if $old_price > 0}
                                    		    {if $price > 0}<span>Опт: <strong style="background-color: yellow;white-space: nowrap;">{$price} <i class="fa fa-ruble"></i></strong></span>{/if}
                                    			{set $raz = ($old_price | replace: " " : "") - ($price | replace: " " : "")}
                                    			{$_modx->runSnippet('@FILE snippets/discount_percent.php', [
                                    				'id' => $_modx->resource.id,
                                    				'price' => $price,
                                    				"old_price" => $old_price
                                    			])}
                                    			<br/><span>Розница: <strong class="">{$old_price} <i class="fa fa-ruble"></i></strong></span><br/>
                                    			<span>Маржа: <strong>{$_modx->getPlaceholder("diff_"~$_modx->resource.id)} <i class="fa fa-ruble"></i> ({$_modx->getPlaceholder("percent_"~$_modx->resource.id)}%)</strong></span>
                                    		{else}
                                    		    {if $price > 0}<span>Розница: <strong style="background-color: yellow;white-space: nowrap;">{$price} <i class="fa fa-ruble"></i></strong></span>{/if}
                                    		{/if}
                                    		{if ($_modx->user.id | umember : 'Administrator')}
                                    			<br/><span>Закупочная: <strong class="">{$pur_price} <i class="fa fa-ruble"></i></strong></span>
                                    		{/if}
                                		</div>
                                	{/if}
                                    <div class="characters">
                                        {if $_pls["vendor.name"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Производитель</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_pls["vendor.name"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_pls["made_in"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Страна</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_pls["made_in"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_pls["article"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Артикул</span>
                                            </div>
                                            <div class="value">
                                                <span class="msoptionsprice-article msoptionsprice">{$_pls["article"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_pls["material"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Марка материала</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_pls["material"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_pls["metall"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Металл</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_pls["metall"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_pls["catalog_number"]}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Номер по каталогу</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_pls["catalog_number"]}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_modx->resource.tags}
                                        <div class="item inliner vam">
                                            <div class="label">
                                                <span>Теги</span>
                                            </div>
                                            <div class="value">
                                                <span>{$_modx->resource.tags | join: ', '}</span>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $_modx->resource.parent | resource : 'options'}
                                            {$_modx->runSnippet("msProductOptions", [
                                                'onlyOptions' => $_modx->resource.parent | resource : 'options',
                                                'product' => $id,
                                                'tpl' => '@FILE chunks/tpl_main_opt_product.tpl'
                                            ])}
                                        {/if}
                                        <a href="#fullparams" class="all_characters toanchor">
                                            <span>Все характеристики</span>
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                    </div>
                                    {$_modx->runSnippet("!msAddLinked.input", [
                                        "priceTarget" => ".add_linked_price",
                                        'link' => 2,
                                        "limit" => "15",
                                        "product" => $_modx->resource.id,
                                        "tpl" => "@FILE chunks/tpl_addicted.tpl",
                                        "toPlaceholder" => "addLinked",
                                    ])}
                                    <div class="product-form">
                                        <div class="options">
                                            {$_modx->runSnippet("!msOptionsPrice.option", [
                                                'options' => 'color,modifikacziya,vatt',
                                                'product' => $_modx->resource.id,
                                                'tpl' => '@FILE chunks/tpl_product_option.tpl'
                                            ])}
                                        </div>
                                        <input type="hidden" name="id" value="{$_modx->resource.id}">
                                        {if $available == 1}
                                            <div class="row">
                                                <div class="col-sm-4 col-12">
                                                    <div class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                        <meta itemprop="priceCurrency" content="RUB"/>
                                                        <meta itemprop="price" content="{$_pls['price'] | replace : " " : "" | number:2:'.':''}"/>
                                                        <div>
                                                        {if $_pls['price'] > 0 && ($_modx->resource.hideprice != 1 || $_modx->hasSessionContext("mgr"))}
                                                            <span class="msoptionsprice-cost msoptionsprice-{$_modx->resource.id} add_linked_price">
                                                                {$_pls['price']}
                                                            </span> <i class="fa fa-ruble"></i>
                                                        {else}
                                                            {if $_modx->resource.hideprice != 1}
                                                                <small>Цена по запросу</small>
                                                            {/if}
                                                        {/if}
                                                        </div>
                                                        {if $_pls['old_price'] > 0 && $_modx->resource.hideprice != 1}
                                                            <span class="old_price">
                                                                {$_pls['old_price']} <i class="fa fa-ruble"></i>
                                                            </span>
                                                        {/if}
                                                    </div>
                                                    <div class="hidden" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                                            			<span itemprop="ratingValue">{var $out = $_modx->runSnippet('!ecThreadRating', ['tpl' => 'ratingTpl', "thread" => "review-"~$_modx->resource.id])} {$output ?: '5'}</span> звезд -
                                            			основано на <span itemprop="reviewCount">{var $output = '!ecMessagesCount' | snippet: ['tpl' => 'ratingTpl', "thread" => "review-"~$_modx->resource.id]} {$output ?: '1'}</span> отзывах
                                            		 </div>
                                                </div>
                                                {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext("mgr")}
                                                    <div class="col-sm-4 col-6">

                                                        <div class="cb-qnt sl-quantity inliner vam">
                                                            <button type="button"
                                                                class="btn btn-count minus">-</button>
                                                            <input type="text" name="count" class="counter" value="1" data-krat="1" data-min="1"
                                                                readonly="">
                                                            <button type="button"
                                                                class="btn btn-count plus">+</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 col-6 text-right">
                                                {else}
                                                    <div class="col-sm-8 col-6 text-right">
                                                {/if}
                                                    <div class="buttons">
                                                        {if $_modx->resource.hideprice != 1 || $_modx->hasSessionContext("mgr")}
                                                            <button type="submit" name="ms2_action" value="cart/add" class="btn btn-blue btn-rounded big">Купить</button>
                                                            {$_modx->runSnippet("!msOneClick", [
                                        						"id" => $_modx->resource.id,
                                        						"create_order" => "MS",
                                        						"delivery" => 2,
                                        						"required_fields" => "receiver,email,phone",
                                        						"tplBtn" => "@FILE chunks/tpl_msoneclick_btn.tpl",
                                        						"tplModal" => "@FILE chunks/tpl_msoneclick_modal.tpl",
                                        						"tplForm" => "tpl_msoneclick_form"
                                        					])}
                                    					{else}
                                    					    <button data-id="{$_modx->resource.id}" class="btn btn-blue btn-lg btn-rounded big btn-get-price">Расчитать цену</button>
                                    					{/if}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="gray_click_action">
                                                <div class="commercial-proposal">
                                                    <i class="fa fa-file-pdf-o"></i> <a href="{$_modx->resource.id | url}#get_kp" data-toggle="modal" data-target="#get_kp">Получить коммерческое предложение</a>
                                                </div>
                                                <div class="product-invoice">
                                                    <i class="fab fa-wpforms"></i> <a href="{$_modx->resource.id | url}#get_invoice" data-toggle="modal" data-target="#get_invoice">Запросить счет на оплату</a>
                                                </div>
                                            </div>
                                        {else}
                                            <a href="#" data-toggle="modal" data-target="#get_analog" class="btn btn-blue btn-rounded big analog_href" data-product="{$_modx->resource.pagetitle}">Подобрать аналог</a>
                                        {/if}
                                    </div>
                                    <div class="text-right mt-2">
                                        <div class="btn-animate">
                                            <a href="whatsapp://send?phone=+79080294544" class="w-price_link mb-10 t400" target="_blank" onclick="yaCounter56478313.reachGoal('whatsapp-tovar'); return true;">
                                                <span>Связаться в WhatsApp</span>
                                                <img src="assets/files/img/wa.svg" width="25">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
	<!-- COMPLECT-->
	{if ($_pls['price'] > 0 && $_modx->resource.hideprice != 1) || $_modx->hasSessionContext("mgr")}
        {$_modx->runSnippet("!complects")}
    {/if}
	<!-- /COMPLECT-->
    </div>
</section>
{/if}
{* {$_modx->runSnippet("@FILE snippets/get_landing_menu.php", [
	"tvname" => "blocks",
	"tpl" => "@FILE chunks/tpl_menu.tpl",
	'classRow' => 'menuanchors',
	"toPlaceholder" => "menu"
])} *}
{* <div class="page-nav-wrap">
    <div class="page-nav desktop">
        <div class="container">
            <ul>
                <li><a href="#fullparams" class="menuanchors">Характеристики</a></li>
                {$_modx->getPlaceholder("menu")}
                <li><a href="#dart-reviews" class="menuanchors">Отзывы ({$_modx->runSnippet("!ecMessagesCount", ["thread" => 'review-' ~ $_modx->resource.id])})</a></li>
                <li><a href="#questions" class="menuanchors">Вопросы ({$_modx->runSnippet("!ecMessagesCount", ["thread" => 'question-' ~ $_modx->resource.id])})</a></li>
               <!--<li><a href="#section_rec_1" class="menuanchors">Рекомендуемые</a></li>-->
                <li><a href="#section_gal_1" class="menuanchors">Фото склада</a></li>
            </ul>
        </div>
    </div>
    <noindex>
    <div class="container">
        <div class="widget-tags blog-widget mobile">
            <h4 class="font-weight-bold mb-2">Навигация по странице</h4>
            <div class=" d-flex flex-wrap">
              <ul class="nav nav-pills">
                    <li class="nav-item"><a href="#fullparams" class="nav-link toanchor">Характеристики</a></li>
                    <li class="nav-item"><a href="#dart-reviews" class="nav-link toanchor">Отзывы ({$_modx->runSnippet("!ecMessagesCount", ["thread" => 'review-' ~ $_modx->resource.id])})</a></li>
                    <li class="nav-item"><a href="#questions" class="nav-link toanchor">Вопросы по товару ({$_modx->runSnippet("!ecMessagesCount", ["thread" => 'question-' ~ $_modx->resource.id])})</a></li>
                    {$_modx->getPlaceholder("menu")}
                    <li class="nav-item"><a href="#section_rec_1" class="nav-link toanchor">Рекомендуемые товары</a></li>
              </ul>
            </div>
        </div>
    </div>
    </noindex>
</div> *}
{*'@FILE snippets/get_options.php' | snippet : [
    'tpl' => '@FILE chunks/tpl_characters_new.tpl'
]*}

{*'@FILE snippets/get_shorts.php' | snippet : [
    'id' => $_modx->resource.id,
    'tpl' => '@FILE chunks/shorts.tpl'
]*}


{* {$_modx->runSnippet('!msOptionsPrice.modification',[
    'limit' => 0,
    'product' => $_modx->resource.id,
    'tpl' => "@FILE chunks/tpl_mod.tpl",
    'toPlaceholder' => 'mods'
])}
{if $_modx->getPlaceholder("mods")}
    <div class="modification">
    	<div class="container">
    		<h3>Модификации товара</h3>
    		<table class="table table-striped">
    		    <thead>
    		        <tr>
    		            <th>Модификация</th>
    		            {if $_modx->resource.hideprice != 1}<th>Цена</th>{/if}
    		            <th></th>
    		        </tr>
    		    </thead>
    		    <tbody>
    		        {$_modx->getPlaceholder("mods")}
    		    </tbody>
    		</table>
    	</div>
    </div>
{/if} *}

{* {$_modx->runSnippet("@FILE snippets/get_sections.php", [
    "tvname" => "blocks",
    "excludeOut" => "class=\"checkmates\""
])} *}

{* {$_modx->parseChunk("photoGalBlockTpl", [
    "MIGX_id" => 'gal_1',
    "title" => 'Фото со склада',
])} *}

{* {if ($_modx->resource.id | infolder : '32837')}
    <section class="def-section">
        <div class="container">
            {$_modx->runSnippet("@FILE snippets/get_prim.php", [
                "id" => $_modx->resource.id,
                "tpl" => "@FILE chunks/tpl_tracks_cats.tpl"
            ])}
        </div>
    </section>
{/if} *}

{* {$_modx->parseChunk("whyVigodnoBlockTpl", [
    "MIGX_id" => 'vyg_1'
])} *}

{* <section class="questions-container" id="questions">
    <div class="container">
        <div class="w">
            <div class="questions-header">
                <div class="row">
                  <div class="col-sm-6 mobile-text-center">
                      <h4>Вопросы и ответы</h4>
                  </div>
                  <div class="col-sm-6 desktop-text-right mobile-text-center">
                      <a href="#" data-toggle="modal" data-target="#form-questions" class="dart-btn dart-btn-primary">Задать вопрос</a>
                  </div>
              </div>
            </div>
            <div class="comments-list">
                {set $questions = $_modx->runSnippet("!ecMessages", [
                    'thread' => 'question-' ~ $_modx->resource.id,
                    'tpl' => '@FILE chunks/tpl_question.tpl'
                ])}
                {$questions? :'<div class="alert alert-info">Задавайте! Отвечаем быстро на любой вопрос.</div>'}
            </div>
        </div>
    </div>
</section> *}
{* {$_modx->runSnippet("!ecForm", [
  'thread' => 'question-' ~ $_modx->resource.id,
  'tplForm' => '@FILE chunks/form_questions.tpl'
])} *}
{* <!-- ВЫВОД ТЕГОВ С ФОРМОЙ ЭТОТ ТОВАР ИЩУТ ТАКЖЕ -->
{if $_modx->resource.customtags}
    {set $rows = json_decode($_modx->resource.customtags, true)}
    <div class="def-section items-list">
        <div class="container">
            <div class="def-section__header">
                <h2>С этим товаром ищут:</h2>
            </div>
            <div class="sub-links-2 open">
                {foreach $rows as $key => $row}
                    {if $row['href']}
                        <a href="{$row['href']}">{$row['anchor']}</a>
                    {else}
                        <a href="{$_modx->resource.id | url}#related_tags_{$row['MIGX_id']}" data-toggle="modal" data-target="#related_tags_{$row['MIGX_id']}">{$row['anchor']}</a>
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
    {foreach $rows as $key => $row}
        <div class="modal related_modal" tabindex="-1" id="related_tags_{$row['MIGX_id']}">
          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title"> <b>Подобрать аналог</b> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                {$_modx->runSnippet("!AjaxForm", [
            		'snippet' => 'FormIt',
            		'form' => '@FILE chunks/form_interes.tpl',
            		'hooks' => 'spam,email,FormItSaveForm',
            		'emailTpl' => '@FILE chunks/email_email.tpl',
            		'emailSubject' => 'Подобрать аналог '~$row['anchor'],
            		'emailTo' => $_modx->getPlaceholder("+conf_to_email"),
            		'emailFrom' => $_modx->config.emailsender,
            		'formName' => 'Обратная связь '~$row['anchor'],
            		'validate' => 'name:required,phone:required,username:blank',
            		'resources' => $row['resources'],
            		'anchor' => $row['anchor'],
            		'MIGX_id' => $row['MIGX_id']
            	])}
              </div>
            </div>
          </div>
        </div>
    {/foreach}
{/if} *}
{* <!-- /ВЫВОД ТЕГОВ С ФОРМОЙ  ЭТОТ ТОВАР ИЩУТ ТАКЖЕ --> *}
{* <div class="dart-reviews" id="dart-reviews">
    <div class="container">
        <div class="w">
          <div class="review-header">
              <div class="row">
                  <div class="col-sm-6 mobile-text-center">
                        <h4>Отзывы и оценки</h4>
                        <div class="rating inliner vam">
                            {$_modx->runSnippet("!ecThreadRating", [
                                "thread" => "review-"~$_modx->resource.id,
                                "tpl" => "@FILE chunks/tpl_review_rating.tpl",
                            ])}
                        </div>
                  </div>
                  <div class="col-sm-6 desktop-text-right mobile-text-center">
                      <a href="#" data-toggle="modal" data-target="#review" class="dart-btn dart-btn-primary">Оставить отзыв</a>
                  </div>
              </div>
          </div>
          <div class="reviews-list">
            {set $reviews = $_modx->runSnippet("!ecMessages", [
                'thread' => 'review-' ~ $_modx->resource.id,
                'tpl' => '@FILE chunks/tpl_review.tpl'
            ])}
            {$reviews? :'<div class="alert alert-info">Вы будете первым, кто оставит отзыв.</div>'}
          </div>
        </div>
    </div>
</div> *}
{* {'@FILE snippets/get_related_cats.php' | snippet : [
    "tpl" => "@FILE chunks/tpl_related_cats.tpl"
]} *}
{* {'@FILE snippets/product_categories.php' | snippet : [
    "tpl" => "@FILE chunks/tpl_product_cats.tpl"
]} *}

{* {$_modx->runSnippet("!ecForm", [
  'thread' => 'review-' ~ $_modx->resource.id,
  'tplForm' => '@FILE chunks/form_review.tpl'
])} *}
{* {foreach $modifications as $row}
    <div class="modal" tabindex="-1" role="dialog" id="color{$row['id']}">
        <div class="modal-dialog modal-dialog-centered color_modal product-details" role="document">
            <div class="modal-content">
                <form action="/" method="post" class="ms2_form">
                    <input type="hidden" name="id" value="{$row['rid']}">
                    <input type="hidden" name="options" value="[]">
                    {foreach $row['options'] as $name => $value}
        				<input type="hidden" name="options[{$name}]" value="{$value}">
        			{/foreach}
                    <div class="modal-header">
                        <h5 class="modal-title">{$row['product_pagetitle']}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="image">
                            <a href="{$row['thumbs']['main'][0]}" data-fancybox>
                                <img src="{$row['thumbs']['main'][0]}" alt="">
                            </a>
                        </div>
                        <div class="text">
                            <div class="color">Цвет: {$row['name']}</div>
                        </div>
                        <div class="product-form">
                            <div class="row">
                                <div class="col-sm-4 col-12">
                                    <div class="price">
                                        <span>{$row['price']} <i class="fa fa-ruble"></i></span>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-6">
                                    <div class="cb-qnt le-quantity inliner vam">
                                        <button type="button"
                                            class="btn btn--count minus">-</button>
                                        <input type="text" name="count" class="counter" value="1"
                                            readonly="">
                                        <button type="button"
                                            class="btn btn--count plus">+</button>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-6 text-right">
                                    <div class="buttons">
                                        <button class="btn btn-blue btn-rounded big" type="submit" name="ms2_action" value="cart/add">В
                                            корзину</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/foreach} *}
{* {set $blocks_container = $_modx->runSnippet("@FILE snippets/get_val_container.php", ['id' => $_modx->resource.id, 'tv' => 'blocks_resource'])}
{if $blocks_container}
    {$_modx->runSnippet("@FILE snippets/get_sections.php", [
        "tvname" => "blocks",
        "docid" => $blocks_container
    ])}
{/if} *}
{* <section class="def-section">
    <div class="container mobile_full">
        <div class="def-section__header">
            <h2>Популярные статьи</h2>
        </div>
        <div class="products-slider-wrap mobile_scroll_wrap js-scroll">
            <div class="services-slider mobile_scroll mobile_scroll_block_300 owl-carousel">
                {set $blog_container = $_modx->runSnippet("@FILE snippets/get_blog_container.php", ['id' => $_modx->resource.id])}
                {$_modx->runSnippet("pdoResources", [
                    "parents" => $blog_container ? : 1593,
                    "includeTVs" => 'blog_image',
                    "limit" => 5,
                    "hideContainers" => 1,
                    "tpl" => "@FILE chunks/tpl_article.tpl"
                ])}
            </div>
        </div>
    </div>
</section> *}
{* {"formMapBlockTpl" | chunk} *}
<!-- / CONTENT -->
{/block}
