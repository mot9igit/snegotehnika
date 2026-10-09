{if $_modx->resource.introtext}
    <section class="def-section content">
        <div class="container">
            <div class="characters">
                <div class="description">
                    <p itemprop="description">{$_modx->resource.introtext}</p>
                </div>
            </div>
        </div>
    </section>
{/if}

<section class="def-section content">
    <div class="container">
        <div class="product-details__chracters">
            {'@FILE snippets/get_main_options.php' | snippet : [
                'product' => $_modx->resource.id,
                'tpl' => "@FILE chunks/tpl_main_opts_new.tpl"
            ])}
        </div>
    </div>
</section>

{if $_modx->getPlaceholder("+conf_delieveryinfo")}
    <section class="def-section product-fulldetails__delivery">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <div class="text">
                        <h4>ОПЛАТА: </h4>
                        {$_modx->getPlaceholder("+conf_delieveryinfo")}
                    </div>
                </div>
                <div class="col-sm-4 text-wrap">
                    <div class="qr_pay" title="Правила оплаты с использованием системы быстрых платежей по QR коду: &#010; 1. Перед проведением оплаты обязательно проверяйте наличие техники у менеджера &#010;2. Комиссия банка за проведение оплаты по системе QR-платежей 0,7% оплачивается Покупателем. То есть при оплате данным способом добавьте к стоимости техники 0,7% 3. &#010;Поступление денежных средств на р/с организации фактически происходит на следующий день после оплаты. &#010;Для оплаты по QR-коду откройте приложение СберБанк Онлайн и считайте изображение QR-кода с помощью камеры смартфона. Меню: 'Платежи' =&gt; 'Оплата по QR или штрихкоду'">
                        <span class="title">
                            Оплата без комиссии
                            <b>По QR-коду</b>
                        </span>
                        <img src="assets/templates/snegotehnika/img/qr.png" alt="">
                        <span class="desc">Перед оплатой по QR-коду обязательно подтверждайте наличие товара у менеджера</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
{/if}