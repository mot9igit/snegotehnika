{set $product_title = $_modx->resource.longtitle ?: $_modx->resource.pagetitle}

<section class="product-card__tabs">
    <div class="product-card__tabs__top">
        Меню характеристики
        <div class="product-card__tabs__top__icon">
            <svg width="17" height="14" viewBox="0 0 17 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8.1063 9.58272L12.774 12.1002L15.2915 7.43258M12.774 12.1002L11.0538 6.35209C9.86632 2.38372 5.6869 0.129528 1.71852 1.31705L1 1.53207" stroke="#F93131" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
    </div>

    <div class="product-card__tabs__nav">
        <button type="button" class="product-card__tabs__nav__item active" data-tab="features">
            Особенности
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
        <button type="button" class="product-card__tabs__nav__item" data-tab="specifications">
            Характеристики
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
        <button type="button" class="product-card__tabs__nav__item" data-tab="videoReviews">
            Видео обзоры
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
        <button type="button" class="product-card__tabs__nav__item" data-tab="questions">
            Вопрос-ответ
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
        <button type="button" class="product-card__tabs__nav__item" data-tab="reviews">
            Отзывы
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
        <button type="button" class="product-card__tabs__nav__item" data-tab="delivery">
            Оплата и доставка
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="offers__item__icon">
                <rect width="24" height="24" rx="6" fill="white"/>
                <path d="M18 12.8571H12.8571V18H11.1429V12.8571H6V11.1429H11.1429V6H12.8571V11.1429H18V12.8571Z" fill="currentColor"/>
            </svg>
        </button>
    </div>

    {* ===== Вкладка: Особенности ===== *}
    <div data-tab__content="features" class="product-card__features">
        <h3 class="product-card__features__title"><b>Особенности конструкции</b> {$product_title}</h3>
        {* Блоки-«фишки» из TV «blocks» — свайпером по макету: get_sections в режиме
           &features разбирает секции в группы-слайды (h2 секции — название группы) и
           выводит каждую группу чанком tpl_features_swiper *}
        {$_modx->runSnippet('@FILE snippets/get_sections.php', [
            'tvname' => 'blocks',
            'onlyOut' => 'class="checkmates"',
            'features' => 1,
            'outChunk' => '@FILE chunks/tpl_features_swiper.tpl'
        ])}
    </div>

    {* ===== Вкладка: Характеристики ===== *}
    <div data-tab__content="specifications" class="product-card__specifications" id="fullparams">
        <h3>технические <b>характеристики</b></h3>
        {if $_modx->resource.introtext}
            <p itemprop="description">{$_modx->resource.introtext}</p>
        {/if}
        {* Аккордеон со всеми группами характеристик (данные — опции msProduct из get_options) *}
        {'@FILE snippets/get_options.php' | snippet : [
            'tpl' => '@FILE chunks/tpl_characters_accordion.tpl'
        ]}
        {* Старый блок 5 главных параметров — раскомментировать, если решим вернуть:
        {'@FILE snippets/get_main_options.php' | snippet : [
            'product' => $_modx->resource.id,
            'tpl' => "@FILE chunks/tpl_main_opts_new.tpl"
        ]}
        *}
        <div class="product-card__specifications__buttons">
            <a href="#" class="product-card__specifications__button">
                скачать характеристику
                <i class="icon-material-symbols-light_picture-as-pdf-outline-sharp"></i>
            </a>
            <a href="#" class="product-card__specifications__button">
                скачать инструкцию
                <i class="icon-material-symbols-light_picture-as-pdf-outline-sharp"></i>
            </a>
        </div>
    </div>

    {* ===== Вкладка: Видео обзоры ===== *}
    <div data-tab__content="videoReviews" class="product-card__videoReviews">
        <h3><b>ВИДЕО ОБЗОР.</b> {$product_title | upper}</h3>
        {'@FILE snippets/get_vkclips.php' | snippet : [
            'id' => $_modx->resource.id,
            'tpl' => '@FILE chunks/tpl_vkclips_swiper.tpl'
        ]}
    </div>

    {* ===== Вкладка: Вопрос-ответ ===== *}
    <div data-tab__content="questions">
        {'@FILE chunks/tpl_faq.tpl' | chunk}
    </div>

    {* ===== Вкладка: Отзывы ===== *}
    <div data-tab__content="reviews">
        {'@FILE chunks/tpl_reviews.tpl' | chunk}
    </div>

    {* ===== Вкладка: Оплата и доставка ===== *}
    <div data-tab__content="delivery" class="product-card__delivery">
        <h3>Условия <b>оплаты и доставки</b></h3>
        {if $_modx->getPlaceholder('+conf_delieveryinfo')}
            <div class="product-card__delivery__content">
                <div class="product-card__delivery__content__left">
                    <div class="product-card__delivery__content__left__container">
                        <h4>Быстрая оплата По QR-коду</h4>
                        <p>Перед оплатой по QR-коду обязательно подтверждайте наличие товара у менеджера</p>
                    </div>
                    <div class="product-card__delivery__content__left__qr">
                        <img src="{$qr_image ?: '/assets/templates/snegotehnika/img/qr.png'}" alt="">
                    </div>
                </div>
                <div class="product-card__delivery__content__right">
                    {$_modx->getPlaceholder('+conf_delieveryinfo')}
                </div>
            </div>
        {/if}
    </div>
</section>

{* Модалка «Особенности»: открывается по клику на текст слайда (свайпер features) *}
<div class="modal" id="modal-video-info" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            <div class="modal__video__info">
                <h3 data-modal-video-title></h3>
                <ol data-modal-video-pros></ol>
            </div>
        </div>
    </div>
</div>

{* Модалка «Задать вопрос»: форма EasyComm. Тред question-{id} — тот же, что у
   списка вопросов; настройки валидации сохраняются в свойствах треда и
   подхватываются action.php при AJAX-отправке (ec.custom.js). *}
<div class="modal" id="modal-questions" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            {$_modx->runSnippet('!ecForm', [
                'thread' => 'question-' ~ $_modx->resource.id,
                'formId' => 'question-' ~ $_modx->resource.id,
                'tplForm' => '@FILE chunks/form_question.tpl',
                'tplSuccess' => '@FILE chunks/form_question_success.tpl',
                'antispamField' => 'address',
                'allowedFields' => 'user_name,user_email,user_contacts,text,model,subject,thread,tags',
                'requiredFields' => 'user_name,user_email,user_contacts,text'
            ])}
        </div>
    </div>
</div>

{* Модалка «Оставить отзыв»: форма EasyComm. Тред review-{id} — тот же, что у
   списка отзывов и рейтинга ecThreadRating; rating (оценка звёздами 1-5)
   включён в allowedFields, иначе поле не сохранится при создании сообщения. *}
<div class="modal" id="modal-reviews" data-modal aria-hidden="true">
    <div class="modal__overlay" data-modal-close></div>
    <div class="modal__dialog">
        <button class="modal__close" type="button" data-modal-close aria-label="Закрыть">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M8 8L24 24M24 8L8 24" stroke="#5380FF" stroke-width="3" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="modal__content">
            {$_modx->runSnippet('!ecForm', [
                'thread' => 'review-' ~ $_modx->resource.id,
                'formId' => 'review-' ~ $_modx->resource.id,
                'tplForm' => '@FILE chunks/form_review.tpl',
                'tplSuccess' => '@FILE chunks/form_review_success.tpl',
                'antispamField' => 'address',
                'allowedFields' => 'user_name,user_email,text,model,subject,thread,tags',
                'requiredFields' => 'user_name,user_email,text'
            ])}
        </div>
    </div>
</div>
