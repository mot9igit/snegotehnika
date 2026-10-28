<div class="sets">
        <div class="dart-container">
          <div class="sets__inner">
            <div class="sets__left">
              <h3 class="sets__title">Подборка <b>из 5 снегоходов</b> для рыбалки</h3>
              <div class="sets__text">Где Вам удобнее получить каталог?</div>
              <div class="sets__img__sm-desktop">
                <img src="img/sets/sets-bg.jpg" alt="" class="sets__img__bg">
                <img src="img/sets/sets-img.png" alt="" class="sets__img">
              </div>
              <div class="sets__social">
                <a href="{$_modx->getPlaceholder('+conf_vk')}" class="sets__social__button">
                  В контакте
                  <img src="/assets/templates/snegotehnika/img/icons/vk.svg" alt="">
                </a>
                <a href="https://t.me/snegotehnika_bot" class="sets__social__button">
                  телеграмм
                  <img src="/assets/templates/snegotehnika/img/icons/telegram.svg" alt="">
                </a>
                <a href="https://max.ru/u/f9LHodD0cOLeOIf-F1rpj-y-2YCUbSyrYOM8HvWYp7c0VP00lVEX42ghmiE" class="sets__social__button">
                  max
                  <img src="/assets/templates/snegotehnika/img/icons/max.svg" alt="">
                </a>
              </div>
              {$_modx->runSnippet("!AjaxForm", [
        	'snippet' => 'FormIt',
        	'form' => '@FILE chunks/form_sets_email.tpl',
        	'hooks' => 'spam,email,FormItSaveForm', 
        	'emailTpl' => '@FILE chunks/email_email.tpl',
        	'emailSubject' => 'Запрос каталога с главной',
		'emailTo' => $_modx->getPlaceholder("+conf_to_email"),
        	'emailFrom' => $_modx->config.emailsender,
        	'formName' => 'Получить каталог',
        	'validate' => 'email:required',
        	'successMessage' => 'Спасибо! Каталог отправлен на вашу почту.'
    	       ])}
            </div>
            <div class="sets__right">
              <img src="/assets/templates/snegotehnika/img/mainPage/sets-bg.jpg" alt="" class="sets__right__bg">
              <img src="/assets/templates/snegotehnika/img/mainPage/sets-img.png" alt="" class="sets__right__img">
            </div>
          </div>
        </div>
      </div>