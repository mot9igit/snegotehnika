<form action="{$_modx->resource.id | url}" method="post" class="sets__form">
    <input type="hidden" name="formName" value="Получить каталог (Главная)">
    
    <input type="email" name="email" placeholder="Email" class="sets__email" required>

    <div class="sets__captcha">
        <div
            class="smart-captcha"
            data-sitekey="ysc1_7PrcenuaHzoUdOmdKjmn2zTe0njXRQuo6oBF3ahj62ed6636"
            style="height: 100px;"
        ></div>
    </div>

    <button type="submit" class="sets__button">
        <div class="sets__button__container">
            <span>Получить каталог</span>
            <p>с подборкой 5 каталогов</p>
        </div>
        <svg class="button__icon">
            <use xlink:href="#buttonArrow"></use>
        </svg>
    </button>

    <div class="sets__approval">
        <input type="checkbox" id="privacy_quiz" name="approval" required>
        <label for="privacy_quiz" class="sets__approval__label">
            <span class="check-circle"></span>
            <div>нажимая на кнопку, я соглашаюсь с <a href="{$_modx->config.politika_doc | url}">политикой о конфиденциальности</a></div>
        </label>
    </div>
</form>