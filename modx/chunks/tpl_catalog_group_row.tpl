<li class="header__catalog__item" data-id="[[+id]]" data-icon="{$catalog_icon}">
  <a href="[[+link]]" class="header__catalog__item__btn">
    <div class="header__catalog__left">
      {if $catalog_icon}
      <div class="header__catalog__logo">
        <img src="/assets/templates/snegotehnika/img/icons/{$catalog_icon}" alt="">
      </div>
      {/if}
      <div class="header__catalog__name">{$menutitle}</div>
    </div>
    {if $children}
    <div class="header__catalog__icon">
      <img class="header__catalog__menu__icon" src="/assets/templates/snegotehnika/img/icons/exit.svg" alt="">
    </div>
    {/if}
  </a>
</li>
