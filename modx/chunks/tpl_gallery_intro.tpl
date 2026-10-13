{if $files}
    {foreach $files as $file}
        <div class="swiper-slide">
            <a href="{$file['url']}" data-fancybox="intro">
                <img src="{$file['url'] | phpthumbon: 'w=800&h=600&zc=1&q=99'}" loading="lazy" alt="{$_modx->resource.pagetitle | htmlent}" itemprop="image">
            </a>
        </div>
    {/foreach}
{/if}
