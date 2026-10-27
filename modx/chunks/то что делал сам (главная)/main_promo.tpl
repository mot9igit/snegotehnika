<div class="offers">
    <div class="dart-container">
        <div class="offers__inner">
            <div class="offers__top">
                <h3 class="offers__title">Выгодные <b>акции</b> и предложения для вас</h3>
                <div class="swiper__buttons">
                    <button type="button" class="swiper-button-prev"></button>
                    <button type="button" class="swiper-button-next"></button>
                </div>
            </div>
        </div>
    </div>

    <div class="offers__swiper">
        <div class="swiper">
            <div class="swiper-wrapper">
                {$_modx->runSnippet("!pdoResources", [
                    "tpl" => "@FILE chunks/tpl_main_promo_item.tpl",
                    "parents" => 37408,
                    "limit" => 0,
                    "tvPrefix" => ""
                ])}
            </div>
        </div>
    </div>
</div>