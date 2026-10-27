<div class="cards">
    <div class="dart-container">
        <div class="cards__inner">

            <div class="cards__top">
                <h1 class="cards__title">Снеготехника для <b>охоты и рыбалки</b></h1>
                <p class="cards__text">Качественное Российское <br> производство снеготехники!</p>
            </div>

            <div class="cards__container">
                {set $categories = [
                    [
                        'title'  => 'Снегоходы',
                        'uri'    => '/catalog/snegohodi/', 
                        'img'    => '/assets/templates/snegotehnika/img/mainPage/Cards-1.png',
                        'bg'     => '/assets/templates/snegotehnika/img/mainPage/Cards-1-bg.jpg',
                        'bg_mob' => '/assets/templates/snegotehnika/img/mainPage/Cards-bg-mobile.png'
                    ],
                    [
                        'title'  => 'Квадроциклы',
                        'uri'    => '/catalog/kvadrocikli/',
                        'img'    => '/assets/templates/snegotehnika/img/mainPage/Cards-2.png',
                        'bg'     => '/assets/templates/snegotehnika/img/mainPage/Cards-2-bg.jpg',
                        'bg_mob' => '/assets/templates/snegotehnika/img/mainPage/Cards-bg-mobile.png'
                    ],
                    [
                        'title'  => 'Погрузчики',
                        'uri'    => '/catalog/pogruzchiki/',
                        'img'    => '/assets/templates/snegotehnika/img/mainPage/Cards-3.png',
                        'bg'     => '/assets/templates/snegotehnika/img/mainPage/Cards-3-bg.jpg',
                        'bg_mob' => '/assets/templates/snegotehnika/img/mainPage/Cards-bg-mobile.png'
                    ]
                ]}
                {foreach $categories as $item}
                    {include 'file:chunks/tpl_main_card_item.tpl' 
                        title=$item.title 
                        uri=$item.uri 
                        img=$item.img 
                        bg=$item.bg 
                        bg_mob=$item.bg_mob
                    }
                {/foreach}

            </div>

        </div>
    </div>
</div>