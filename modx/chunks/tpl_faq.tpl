{* Блок «Вопросы и ответы» во вкладке карточки.
   Данные — сниплет snippets/get_faq.php (EasyComm, тред question-{id});
   первые 3 вопроса в видимый список, остальные — в скрытый <ul data-faq-rest>,
   раскрываются кнопкой «показать больше» (main.js).
   Сворачивание ответов — .faq__expand (main.js). *}
{set $faq_first = '@FILE snippets/get_faq.php' | snippet : ['limit' => 3, 'offset' => 0]}
{set $faq_rest = '@FILE snippets/get_faq.php' | snippet : ['limit' => 20, 'offset' => 3]}
<div class="product-card__questions">
    <div class="product-card__questions__top">
        <h3>{$title ?: 'Вопросы и ответы'}</h3>
        <button type="button" class="product-card__questions__button" data-modal-open="{$modal ?: 'modal-questions'}">
            Задать вопрос
            <svg class="button__icon">
                <use xlink:href="#buttonArrow"></use>
            </svg>
        </button>
    </div>
    {if $faq_first}
        <ul class="product-card__fac">
            {$faq_first}
        </ul>
        {if $faq_rest}
            <ul class="product-card__fac" data-faq-rest hidden>
                {$faq_rest}
            </ul>
        {/if}
    {/if}
    <div class="product-card__fac__bottom">
        {if $faq_rest}
            <button type="button" class="product-card__fac__button" data-faq-show-more>показать больше</button>
        {/if}
        <button type="button" class="product-card__questions__button__mobile" data-modal-open="{$modal ?: 'modal-questions'}">
            Задать вопрос
            <svg class="button__icon">
                <use xlink:href="#buttonArrow"></use>
            </svg>
        </button>
    </div>
</div>
