<div class="product-fulldetails__gallery">
  <div class="swiper swiper_gallery">
	<div class="swiper-wrapper">
	  {if $_modx->resource.videoLink}
        {set $el = json_decode($_modx->resource.videoLink, true)}
        <div class="swiper-slide video-link" data-rid="{$_modx->resource.id}" data-iid="{$el['videoId']}">
            <a data-fancybox="gal" href="{$el['video']}">
                {set $image = $el['image']}
                {if $image}
                    {set $imgs = $_modx->runSnippet("phpthumbon",[
                        "input" => "assets/files/"~$image,
                        "options" => "w=800&h=600&zc=1"
                    ])}
                {else}
                    {set $imgs = $_modx->runSnippet("phpthumbon",[
                        "input" => $_modx->getPlaceholder("+conf_noimage"),
                        "options" => "w=800&h=600&zc=1"
                    ])}
                {/if}
                <img src="{if $image}{$image}{else}{$imgs}{/if}" alt="{$el['title'] | htmlent}" itemprop="image">
            </a>
        </div>
      {/if}
	  {if $files}
		{foreach $files as $file}
		  <div class="swiper-slide">
			<a href="{$file['url']}" data-fancybox="gal">
				<img src="{$file['url'] | phpthumbon: 'w=800&h=600&zc=1&q=99'}" alt="{$_modx->resource.pagetitle | htmlent}" itemprop="image">
			</a>
		  </div>
		{/foreach}
	  {else}
		<div class="swiper-slide">
			<a href="{$_modx->getPlaceholder('+conf_noimage')}" data-fancybox="gal">
				<img src="{$_modx->getPlaceholder('+conf_noimage') | phpthumbon: 'w=800&h=600&zc=1&q=99'}" alt="{$_modx->resource.pagetitle | htmlent}" itemprop="image">
			</a>
		</div>
	  {/if}
	</div>
  </div>
</div>