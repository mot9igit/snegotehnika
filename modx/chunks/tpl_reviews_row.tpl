{* Один отзыв. Чанк-строка для сниплета snippets/get_reviews.php —
   все данные приходят готовыми: {$initials}, {$user_name}, {$stars} (HTML звёзд),
   {$date_ru}, {$text}. Логики в чанке нет — только разметка. *}
<!--revrow:v2-->
<li class="product-card__reviews__item" id="ec-{$thread_name}-message-{$id}">
    <div class="product-card__reviews__item__top">
        <div class="product-card__reviews__item__avatar">
            {$initials}
        </div>
        <div>
            <div class="product-card__reviews__item__author">{$user_name}</div>
            <div class="product-card__reviews__item__container">
                {if $stars}
                    <div class="product-card__reviews__item__rating-badge">
                        <span class="product-card__stars">
                            {$stars}
                        </span>
                    </div>
                {/if}
                <span class="product-card__reviews__item__date">{$date_ru}</span>
            </div>
        </div>
    </div>
    <p>{$text}</p>
    <button class="faq__expand" type="button">подробнее или развернуть ответ</button>
    <button class="faq__expand faq__expand--collapse" type="button">свернуть ответ</button>
</li>
