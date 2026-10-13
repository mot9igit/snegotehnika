{* Блок «Отзывы покупателей» во вкладке карточки.
   Данные — сниплет snippets/get_reviews.php (EasyComm, тред review-{id}):
   возвращает первые 3 отзыва, остальное и сводку (рейтинг/звёзды/число оценок)
   отдаёт плейсхолдерами reviews_rest/reviews_rating/reviews_count/reviews_stars.
   Скрытый список раскрывается кнопкой «еще больше отзывов» (main.js).
   Сворачивание длинных текстов — .faq__expand (main.js). *}
{set $reviews_first = '@FILE snippets/get_reviews.php' | snippet}
{set $reviews_rest = $_modx->getPlaceholder('reviews_rest')}
<div class="product-card__reviews">
    <div class="product-card__reviews__top">
        <h3>{$title ?: 'Отзывы покупателей'}</h3>
        <div class="product-card__reviews__right">
            {if $reviews_first}
                <div class="product-card__reviews__summarizing_reviews">
                    <div class="summarizing_reviews__left">
                        {if $_modx->getPlaceholder('reviews_rating')}
                            <h2>{$_modx->getPlaceholder('reviews_rating')}</h2>
                        {/if}
                        <div class="summarizing_reviews__left__container">
                            {if $_modx->getPlaceholder('reviews_stars')}
                                <span class="product-card__stars">
                                    {$_modx->getPlaceholder('reviews_stars')}
                                </span>
                            {/if}
                            <span>{$_modx->getPlaceholder('reviews_count')}</span>
                        </div>
                    </div>
                    <div class="summarizing_reviews__right" data-modal-open="{$modal ?: 'modal-reviews'}">
                        <p>Оцените это место</p>
                        <span class="product-card__stars">
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                            <span class="product-card__stars__star"></span>
                        </span>
                    </div>
                </div>
            {/if}
            <button type="button" data-modal-open="{$modal ?: 'modal-reviews'}">
                Оставить отзыв
                <svg class="button__icon">
                    <use xlink:href="#buttonArrow"></use>
                </svg>
            </button>
        </div>
    </div>
    {if $reviews_first}
        <ul class="product-card__reviews__inner">
            {$reviews_first}
        </ul>
        {if $reviews_rest}
            <ul class="product-card__reviews__inner" data-faq-rest hidden>
                {$reviews_rest}
            </ul>
        {/if}
    {/if}
    <div class="product-card__reviews__bottom">
        {if $reviews_rest}
            <button type="button" class="product-card__reviews__button" data-faq-show-more>еще больше отзывов</button>
        {/if}
        <button type="button" class="product-card__reviews__button__mobile" data-modal-open="{$modal ?: 'modal-reviews'}">
            Оставить отзыв
            <svg class="button__icon">
                <use xlink:href="#buttonArrow"></use>
            </svg>
        </button>
    </div>
</div>
