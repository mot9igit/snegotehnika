
<!--row:v5-->
<li class="product-card__fac__item" id="ec-{$thread_name}-message-{$id}">
    <div class="product-card__fac__question">
        <div class="product-card__fac__question__avatar">{$initials}</div>
        <div class="product-card__fac__question__container">
            <span>{$user_name}</span>
            <p>{$text}</p>
        </div>
    </div>
    {if $reply_text}
        <div class="product-card__fac__answer">
            <div class="product-card__fac__answer__avatar">
                <img src="{$reply_avatar ?: '/assets/templates/snegotehnika/img/products/product_card/answer.png'}" alt="">
            </div>
            <div class="product-card__fac__answer__container">
                <span>{$reply_author ?: 'Администрация сайта'}</span>
                <p>{$reply_text}</p>
                <button class="faq__expand" type="button">подробнее или развернуть ответ</button>
                <button class="faq__expand faq__expand--collapse" type="button">свернуть ответ</button>
            </div>
        </div>
    {/if}
</li>
