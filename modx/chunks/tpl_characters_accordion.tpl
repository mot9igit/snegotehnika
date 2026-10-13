{if $cats}
    <div class="accordion">
        <div class="accordion__inner">
            {set $cat_index = 0}
            {foreach $cats as $key => $cat}
                {if $cat['items']}
                    <div class="accordion__item{if $cat_index == 0} active{/if}">
                        <button class="accordion__button" type="button">
                            <span>{$cat['name']}</span>
                            <svg class="accordion__icon">
                                <use xlink:href="#accordion__plus"></use>
                            </svg>
                        </button>
                        <div class="accordion__content">
                            {foreach $cat['items'] as $param_index => $item}
                                <div class="accordion__parameter{if $param_index % 2 == 0} accordion__parameter--gray{/if}">{$item['caption']}</div>
                                <div class="accordion__parameter{if $param_index % 2 == 0} accordion__parameter--gray{/if}">
                                    {if $item['type'] == 'combo-options'}
                                        {foreach $item['value'] as $value}
                                            <span class="badge badge-secondary">{$value}</span>
                                        {/foreach}
                                    {elseif $item['value'] is array}
                                        {$item['value'] | join : ', '}
                                    {else}
                                        {$item['value']}
                                    {/if}
                                    {$item['measure_unit']}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    {set $cat_index = $cat_index + 1}
                {/if}
            {/foreach}
        </div>
    </div>
{/if}
