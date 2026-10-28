<div class="info">
        <div class="dart-container">
          <div class="info__inner">
            <div
             class="video__container"
             data-fancybox
             data-src="img/info/mixkit-seabird-flying-over-water-1926-full-hd.mp4"
             >
              <video
                class="video__item"
                poster="img/info/poster.jpg"
                >
                <source src="img/info/mixkit-seabird-flying-over-water-1926-full-hd.mp4" type="video/mp4">
              </video>
              <button class="video__play" type="button">
                <img src="/img/icons/video_Play.svg" alt="">
              </button>
            </div>
            <div class="info__right">
              <h3 class="info__title">Качественное Российское производство снеготехники<span> в городе Рыбинск</span>!</h3>
              <div class="info__video__sm-desktop">
                <div 
                class="video__container"
                data-fancybox
                data-src="img/info/mixkit-seabird-flying-over-water-1926-full-hd.mp4"
                >
                  <video
                    class="video__item"
                    poster="img/info/poster.jpg"
                    >
                    <source src="img/info/mixkit-seabird-flying-over-water-1926-full-hd.mp4" type="video/mp4">
                  </video>
                  <button class="video__play" type="button">
                    <img src="img/icons/video_Play.svg" alt="">
                  </button>
                </div>
              </div>
              <ul class="info__right__container">
    			{set $advantages = $_modx->resource.info_advantages | json_decode:true}
    			{foreach $advantages as $adv}
        			<li class="info__right__item">
            				<img src="img/icons/check-circle.svg" alt="" class="info__check">
            				<div>
                				<div class="info__right__item__title">{$adv.title}</div>
                				<div class="info__right__item__text">{$adv.text}</div>
            				</div>
        			</li>
    			{/foreach}
	      </ul>
              <div class="info__right__buttons">
                <a href="#" class="info__right__button info__right__button--transparent">
                  о производстве
                  <svg class="button__icon">
                    <use xlink:href="#buttonArrow"></use>
                  </svg>
                </a>
                <a href="#" class="info__right__button">
                  стать нашим партнером
                  <svg class="button__icon">
                    <use xlink:href="#buttonArrow"></use>
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>