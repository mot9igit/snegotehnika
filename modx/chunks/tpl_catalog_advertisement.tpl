<div class="catalog__item catalog__item--advertisement">
    <div class="catalog__advertisement__item">
        <h3>Снегоход от производителя</h3>
        <p>Подберем снегоход под Ваши задачи и бюджет</p>
        <div class="catalog__advertisement__buttons">
            {$_modx->runSnippet("!AjaxForm", [
                'snippet' => 'FormIt',
                'form' => '@FILE chunks/form_advertisement.tpl',
                'hooks' => 'nospam,FormItSaveForm,email',
                'emailTpl' => '@FILE chunks/email_email.tpl',
                'emailSubject' => 'Форма блогера',
                'emailTo' => $_modx->getPlaceholder('+conf_to_email') ?: $_modx->config.emailsender,
                'emailFrom' => $_modx->config.emailsender,
                'formName' => 'Форма блогера',
                'validate' => 'phone:required'
            ])}
        </div>
        <div class="catalog__advertisement__buttons catalog__advertisement__buttons--mobile">
            <a href="#">Подобрать снегоход</a>
        </div>
        <img src="/assets/templates/snegotehnika/img/catalog/catalog__advertisement.png" alt="" class="catalog__advertisement__image">
    </div>
</div>
