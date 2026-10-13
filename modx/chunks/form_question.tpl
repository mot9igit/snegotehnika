{* Форма «Задать вопрос» (модалка modal-questions) — сниплет !ecForm, tplForm.
   Сантехника EasyComm: класс ec-form + data-fid (AJAX в ec.custom.js), скрытые
   thread/subject, honeypot-поле {$antispam_field} (должно остаться пустым).
   Выбор модели — тот же дропдаун, что в отзыве (пункты отдаёт сниплет
   snippets/get_review_models.php); при выборе другого товара JS меняет
   скрытый thread на question-{id} выбранного. Отправленный вопрос попадает
   в тред question-{id} и появляется на сайте после публикации модератором. *}
<form class="ec-form" method="post" id="ec-form-{$fid}" data-fid="{$fid}">
    <input type="hidden" name="thread" value="{$thread}">
    <input type="hidden" name="subject" value="question">
    <div id="ec-form-success-{$fid}"></div>

    {* honeypot EasyComm: скрыт стилями, при отправке должен быть пустым *}
    <div style="position:absolute!important;left:-9999px!important;" aria-hidden="true">
        <input type="text" name="{$antispam_field}" value="" tabindex="-1" autocomplete="off">
    </div>

    <div class="modal__top">
        <h2>Задать вопрос</h2>
        <span>Ответим в ближайшее время</span>
    </div>
    <input type="text" name="user_name" placeholder="Ваше имя" required>
    <input type="email" name="user_email" placeholder="Email" required>
    <input type="tel" name="user_contacts" placeholder="+7(___)___-__-__" required>

    <div class="modal__model__choice">
        <h4>Модель техники</h4>
        <div class="model__choice__dropdown">
            <button class="model__choice__btn" type="button">
                <span class="model__choice__btn__text">{$_modx->resource.pagetitle}</span>
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M5.25 7.5L9 11.25L12.75 7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            <ul class="model__choice__list">
                {'@FILE snippets/get_review_models.php' | snippet}
            </ul>
        </div>
    </div>

    <div class="modal__reviews__item">
        <h4>Ваш вопрос</h4>
        <textarea name="text" rows="6" placeholder="Текст..." required></textarea>
    </div>
    <button type="submit" class="modal__btn">
        отправить вопрос
        <svg>
            <use xlink:href="#buttonArrow"></use>
        </svg>
    </button>
    <input type="checkbox" id="modal__questions__approval" name="approval" value="1" required>
    <label for="modal__questions__approval" class="modal__approval">
        <span class="check-circle"></span>
        <div>нажимая на кнопку, я соглашаюсь с <a href="#">политикой о конфиденциальности</a></div>
    </label>
</form>
