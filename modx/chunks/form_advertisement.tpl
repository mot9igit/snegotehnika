<form action="{$_modx->resource.id | url}" method="post" id="simpleform" class="ajax_form form_blogger">
	<input type="hidden" name="page" value="{$_modx->resource.pagetitle | htmlent}">
	<input type="hidden" name="pageid" value="{$_modx->resource.id}">
	<input type="hidden" name="formname" value="Форма блогера">
	<input type="hidden" name="tags" value="{$_modx->runSnippet("@FILE snippets/get_crm_tags.php", ["id" => $_modx->resource.id])}">
	<div class="message"></div>
		<div class="fields">
		<div class="form-group hidden">
			<label for="simpleform_username">Ваше имя</label>
			<input type="text" class="form-control" id="simpleform_username" name="username" placeholder="Пользователь">
		</div>
		<div class="form-group">
		  <input type="tel" class="catalog__advertisement__input" name="phone" placeholder="Телефон" autocomplete="tel" pattern="[+]?[0-9\s\-\(\)]+" required>
		</div>
		<div class="form-group">
		  <button type="submit" class="catalog__advertisement__button">
			Подобрать снегоход
			<svg class="button__icon"><use xlink:href="#buttonArrow"></use></svg>
		  </button>
		</div>
		<input type="checkbox" id="privacy__catalog" name="approval" required>
		<label for="privacy__catalog" class="catalog__advertisement__approval">
			<span class="check-circle"></span>
			<div>нажимая на кнопку, я соглашаюсь с <a href="politika-konfidenczialnosti.html">политике о конфиденциальности</a></div>
		</label>
	</div>
</form>
