require 'rspec'
require 'rspec/autorun'
require 'nokogiri'

class SomeClass
  def example(doc); end
end

# Warning: running this _will_ freeze your computer or at the very least make it
# very slow, consume a lot of CPU and burn your lap (in case you're using a
# laptop).
RSpec.describe 'Diffing large documents' do
  before :all do
    html  = DATA.read
    @doc1 = Nokogiri::HTML(html)
    @doc2 = Nokogiri::HTML(html)
  end

  it 'produces a diff without freezing my computer' do
    obj = SomeClass.new

    expect(obj).to receive(:example).with(@doc1)

    obj.example(@doc2)
  end
end

__END__
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html class="ie8"> <![endif]--><!--[if IE 9]> <html class="ie9"> <![endif]--><!--[if gt IE 9]><!--><html class=""> <!--<![endif]-->
<head>
<title>Coral Beach Resort 4* (ОАЭ/Шарджа). Отзывы отеля. Рейтинг отелей и гостиниц мира - TopHotels.</title>
<meta name="yandex-verification" content="6ca630300df3363f">
<meta name="verify-v1" content="GPUHqXZvg3sLGrcUC77mHIeVwBgcWwo3fO2DJx6UXpI=">
<meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE">
<meta name="keywords" content="отель Coral Beach Resort 4*, отели Шарджа (Sharjah) и ОАЭ, цены, описание, отзывы, фотографии">
<meta name="description" content="Отель Coral Beach Resort 4*, отели Шарджа (Sharjah) и ОАЭ - цены, описания, отзывы и фотографии отеля. TopHotels - информационный рейтинг отелей, основанный на мнениях специалистов туристического бизнеса и отзывах туристов.">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/i/touch/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="/i/touch/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="120x120" href="/i/touch/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="114x114" href="/i/touch/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="/i/touch/apple-touch-icon-144x144.png">
<link id="BxvYUWM" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/style-version-206735.css">
<link id="ALRQITZ" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/static/EFBVHIB.css">
<link id="COOKIEM" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/jquery/ui/jquery-ui-version-203997.css">
<!--[if gte IE 6]><link id="BCOUwCI" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/ie-version-98714.css" /><![endif]--><!--[if lt IE 7]><link id="COLDKPU" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/ie6-version-149458.css" /><![endif]--><!--[if IE 7]><link id="BOUGNOJ" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/ie7-version-108490.css" /><![endif]--><!--[if IE 8]><link id="CGNNSzO" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/css/ie8-version-207047.css" /><![endif]-->
<link id="AyvSKUM" rel="stylesheet" type="text/css" href="http://css2.gotophotels.ru/static/CRAVWJK.css">
<script type="text/javascript">/*<![CDATA[*/
var Env = { locale: "ru", links:{ }, flags:{ }, params:{ } };
Env.flags.localAuth = false;
Env.links.userCityNameRequest = "/actions/city_name/";
Env.links.navigationData = "/actions/navigation_data/";
Env.links.checkCompareHotels = "/actions/check_compare_hotels/";
Env.links.toggleCompareHotels = "/actions/toggle_compare_hotels/";
Env.links.checkFavoriteHotels = "/actions/check_notepad/";
Env.links.toggleFavoriteHotels = "/actions/notepad/";
Env.links.travellerInfo = "/actions/traveller_info/";
Env.links.reviewsMenuCount = "/actions/reviews_menu_count/";
Env.links.managerCallbackForm = "/actions/manager_callback/";
Env.links.consultantAgency = "/actions/consultant_agency/";
Env.links.ifShowAdvbrokerConsultant = "/actions/if_show_advbroker_consultant/";
Env.links.rateOpinionStatusRequest = "/actions/get_rates_opinion/";
Env.links.complaint = "/actions/complaint/";
Env.links.saveComplaint = "/actions/save_complaint/";
Env.links.restoreFormSubmit = "/actions/review_restore/";
Env.links.myRates = "/actions/my_rates/";
Env.links.myRatesCount = "/actions/my_rates_count/";
Env.links.favoriteHotels = "/actions/favorite_hotels/";
Env.links.tourSearchRequest = "/actions/tour_search_request/";
Env.links.advbrokerHost = "http://advbroker.ru";
Env.links.thUserTypeSelectCountries = "/actions/th_user_type_select_countries/";
Env.links.ifShowAdvbrokerConsultant = "/actions/if_show_advbroker_consultant/";
Env.links.favoriteHotels = "/actions/favorite_hotels/";
Env.links.ifShowAdvbrokerConsultant = "/actions/if_show_advbroker_consultant/";
Env.links.userMessageRequest = "/actions/send_user_message/";
Env.links.userMessageFormData = "/actions/user_message_form_data/";
Env.links.toggleHotelLike = "/actions/toggle_hotel_like/";
Env.links.toggleUserHotelLike = "/actions/toggle_user_hotel_like/";
Env.links.hotelLikeUsersLink = "/actions/hotel_like_users_list/";
Env.links.hotlineCheckIfNotSubscribe = "/actions/hotline_check_if_not_subscribe/";
Env.links.hotlineSaveSubscribe = "/actions/hotline_save_subscribe/";
Env.links.hotlineChangeSubscribe = "/actions/hotline_change_subscribe/";
Env.links.getTravellersData = "/actions/get_traveller_data/";
Env.links.saveTravellersFrom = "/actions/save_traveller_form/";
Env.links.getTravelCompanyList = "/actions/get_travel_company/";
Env.links.getRecommendationList = "/actions/get_recommendation_dict/";
Env.links.travellerInfo = "/actions/traveller_info/";
Env.links.UserTravellerInfo = "/actions/user_traveller_info/";
Env.links.userMessageRequest = "/actions/send_user_message/";
Env.links.rateOpinionRequest = "/actions/rate_opinion/";
Env.links.userMessageFormData = "/actions/user_message_form_data/";
Env.links.combinedPromoRequest = "/actions/combined_promo/";
Env.links.agencyInfoRequest = "/actions/agency_info/";
Env.links.agencyMapRequest = "/actions/agency_map/";
Env.links.getExpertInfo = "/actions/expert_info/";
Env.links.myRatesCount = "/actions/my_rates_count/";
Env.links.getUserBlockedInfo = "/actions/get_user_blocked_info/";
Env.links.checkCompareHotels = "/actions/check_compare_hotels/";
Env.links.toggleCompareHotels = "/actions/toggle_compare_hotels/";
Env.links.checkFavoriteHotels = "/actions/check_notepad/";
Env.links.toggleFavoriteHotels = "/actions/notepad/";
Env.links.tourSearchRequest = "/actions/tour_search_request/";
Env.flags.rateOpinion = true;
Env.flags.auth = true;
Env.flags.registration = true;
Env.flags.feedback = true;
Env.flags.compare = true;
Env.links.travelpassportCheckAuth = "http://travelpassport.ru/auth_check.php?user_data=1&domain=tophotels.ru";
Env.links.tophotelsCheckAuth = "/travelpassport.php";
Env.links.checkLoginForm = "/actions/check_login_form/";
Env.links.checkRegistrationRequest = "/actions/check_registration_request/";
Env.links.local = "/actions/local/";
Env.links.checkUnconfirmedRatesRequest = "/actions/check_unconfirmed_rates/";
Env.links.accountReviewHref = "http://tophotels.ru/main/account/review/";
Env.links.userToolbarRequest = "/actions/user_toolbar/";
Env.links.feedbackForm = "/actions/feedback_form/";
Env.links.advbrokerHostMany = "http://advbroker.ru/many.php";
Env.links.advbrokerHostHtml = "http://advbroker.ru/html.php";
Env.links.checkIsAllowedProcessData = "/actions/check_is_allowed_process_data/";
Env.links.userResortByIpRequest = "/actions/geo_ip_data/";
Env.links.rutravellerHost = "http://www.rutraveller.ru";
Env.links.getUserAvatarData = "/actions/user_avatar_data/";
Env.links.topHotelSearcher = "/actions/hotel_search/";
Env.links.topHotelSearcherNew = "/actions/hotel_search_new/";
Env.links.getCaptchaStatusIp = "/actions/get_captcha_status_ip/";
Env.links.advbrokerHost = "http://advbroker.ru";
Env.links.deleteDraft = "/actions/delete_draft/";
/*]]>*/</script>
<script id="AGxWFIY" type="text/javascript" src="http://js2.gotophotels.ru/js/jquery-1.7.2-version-102446.js"></script><script id="BUAXZAz" type="text/javascript" src="http://js2.gotophotels.ru/static/CDNEXOH.js"></script><!--[if lt IE 7]><script id="DTwVFTU" type="text/javascript" src="http://js2.gotophotels.ru/js/DD_belatedPNG-version-54155.js"></script><![endif]--><!--[if lt IE 7]><script id="AGFIxZB" type="text/javascript" src="http://js2.gotophotels.ru/js/jquery.bgiframe.min-version-54155.js"></script><![endif]-->
<script type="text/javascript">/*<![CDATA[*/
$.ajaxSetup({ cache: true, timeout: 20000 });
$.metadata.setType("attr", "data");
/*]]>*/</script>
</head>
<body>
<script type="text/javascript">/*<![CDATA[*/
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-16736697-1']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
/*]]>*/</script>
<div id="container">
<script type="application/javascript">/*<![CDATA[*/
var countryId = 32;
/*]]>*/</script>
<div class="top-old-browser" style="display:none;"></div>
<script type="text/javascript">
/*<![CDATA[*/
var _addRateId = '1035';
/*]]*/
</script>
<div class="page-header-cnt">
<div class="page-header-t">
<div class="toolbar">
<div class="toolbar-t">
<div class="header-top clearfix">
<a href="/main/about" class="header-top-a3 header-top-a3_left">О проекте</a>
<div class="header-top-a4" id="news_tab"></div>
<div class="header-opinion" id="rate_unconfirmed_tab"></div>
<div class="header-top-a4" id="notices_tab"></div>
<div class="header-opinion" id="draft_tab"></div>
<div class="header-top-d">
<a href="/main/rate/1035" class="header-top-about header-top-about_green" title="РАССКАЗАТЬ ОБ ОТЕЛЕ Coral Beach Resort 4* / ОАЭ, Шарджа" onclick="nl_count_params(1001, 10, 29, 0);">РАССКАЗАТЬ ОБ ОТЕЛЕ</a>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="header">
<div class="wrap clear">
<table width="100%">
<tr>
<td width="210">
<div id="logo-block">
<a onclick="pageBookmark('http://www.tophotels.ru/', 'TopHotels - все отели мира открыты для вас');" href="javascript:void(0);" class="star_favorit"></a>
<a href="/"><img alt="Отели. Рейтинг отелей" class="logo" src="/i/logo/header_logo.gif" width="174" height="66"></a>
<div class="slogan">все отели мира открыты для вас</div>
<a href="/main/about/" title="о проекте" class="about">о проекте</a>
<a href="/main/about/forall/news" title="новое на сайте" class="new">новое на сайте</a>
</div>
</td>
<td>
<script type="text/javascript">/*<![CDATA[*/ var AB_REQUEST = "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;"; /*]]>*/</script><script type="text/javascript">/*<![CDATA[*/ var NETLOG_REQUEST = "&amp;"; /*]]>*/</script><div id="grid-cnt search-block" data-hny="0" style="margin-right: 10px;">
<div class="searchbar searchbar_new3 m10">
<ul class="searchbar-ul">
<li class="searchbar-li searchbar-li_first"><a href="/main/about" class="searchbar-li-a"> </a></li>
<li class="searchbar-li"><a href="http://club.tophotels.ru" class="searchbar-li-a">Клуб</a></li>
<li class="searchbar-li searchbar-li_active"><a href="/" class="searchbar-li-a">Отели<span class="searchbar-li-arr"></span></a></li>
<li class="searchbar-li"><a href="http://afisha.tophotels.ru" class="searchbar-li-a">Афиша</a></li>
<li class="searchbar-li"><a href="http://premium.tophotels.ru" class="searchbar-li-a">Premium</a></li>
<li class="searchbar-li"><a href="http://business.tophotels.ru" class="searchbar-li-a">Business</a></li>
</ul>
<div class="searchbar-cnt">
<div class="searchbar-form">
<form id="search-block-form" action="/main/hotels/">
<input type="hidden" name="action" value="Component_Searcher">
<input type="hidden" name="countryId" value="32">
<input type="hidden" name="resortId" value="67">
<input type="hidden" name="allocId" value="1035">
<input type="hidden" name="promoAlloc" value="0">
<input type="hidden" name="sel" value="0">
<input type="hidden" name="srch" value="1">
<input type="hidden" name="allid" value="0">
<input type="hidden" id="search-block-list" name="CO" value="">
<a href="javascript:void(0);" class="searchbar-form-push">Найти</a>
<div class="searchbar-form-field">
<table class="searchbar-form-tbl">
<tbody>
<tr class="searchbar-form-tr">
<td class="searchbar-form-td1">
<input type="text" id="search-block-filter" name="name" placeholder="Название отеля или страны или курорта" class="searchbar-form-field-tx" value="" maxlength="100">
</td>
<td class="searchbar-form-td2">
<div class="searchbar-form-pp-holder">
<a href="javascript:void(0);" class="searchbar-form-field-a more-settings">
<span class="searchbar-form-field-s">
Выбрать страну
</span>
</a>
<div class="searchbar-form-pp-holder-popup uni-form-dd-cnt2 pop-up-ref">
<table>
<tr>
<td>
<ul class="uni-form-dd-abc">
<li class="uni-form-dd-abc-i uni-form-dd-abc-i_current">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-all">
Все
</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="А">А</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Б">Б</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="В">В</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Г">Г</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Д">Д</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Е">Е</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="З">З</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="И">И</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Й">Й</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="К">К</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Л">Л</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="М">М</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Н">Н</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="О">О</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="П">П</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Р">Р</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="С">С</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Т">Т</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="У">У</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Ф">Ф</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Х">Х</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Ч">Ч</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Ш">Ш</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Э">Э</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Ю">Ю</a>
</li>
<li class="uni-form-dd-abc-i">
<a href="javascript:void(0);" class="uni-form-dd-abc-i-a uni-form-dd-abc-i-a-letter" data-letter="Я">Я</a>
</li>
</ul>
</td>
<td>
<div class="uni-form-dd-tabs uni-form-dd-tabs_val">
<ul class="uni-form-dd-tab">
<li class="uni-form-dd-i uni-form-dd-i-topChart">Искать отели в стране</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="124" data-letter="А">Абхазия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="6" data-letter="А">Австралия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="66" data-letter="А">Австрия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="150" data-letter="А">Азербайджан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="159" data-letter="А">Албания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="160" data-letter="А">Алжир</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="292" data-letter="А">Америк. Виргинские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="162" data-letter="А">Ангилья</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="161" data-letter="А">Ангола</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="67" data-letter="А">Андорра</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="48" data-letter="А">Антарктида</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="126" data-letter="А">Антигуа и Барбуда</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="255" data-letter="А">Антильские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="47" data-letter="А">Аргентина</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="157" data-letter="А">Армения</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="54" data-letter="А">Аруба</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="55" data-letter="Б">Багамы</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="163" data-letter="Б">Бангладеш</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="56" data-letter="Б">Барбадос</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="109" data-letter="Б">Бахрейн</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="158" data-letter="Б">Беларусь</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="155" data-letter="Б">Белиз</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="68" data-letter="Б">Бельгия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="164" data-letter="Б">Бенин</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="165" data-letter="Б">Бермудские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="100" data-letter="Б">Болгария</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="135" data-letter="Б">Боливия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="167" data-letter="Б">Босния и Герцеговина</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="11" data-letter="Б">Ботсвана</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="49" data-letter="Б">Бразилия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="248" data-letter="Б">Брит. Виргинские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="24" data-letter="Б">Бруней</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="168" data-letter="Б">Буркина-Фасо</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="166" data-letter="Б">Бутан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="270" data-letter="В">Вануату</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="69" data-letter="В">Великобритания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="70" data-letter="В">Венгрия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="50" data-letter="В">Венесуэла</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="25" data-letter="В">Вьетнам</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="193" data-letter="Г">Габон</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="176" data-letter="Г">Гаити</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="197" data-letter="Г">Гамбия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="183" data-letter="Г">Гана</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="57" data-letter="Г">Гваделупа</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="133" data-letter="Г">Гватемала</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="178" data-letter="Г">Гвинея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="2" data-letter="Г">Германия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="182" data-letter="Г">Гибралтар</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="136" data-letter="Г">Гондурас</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="180" data-letter="Г">Гренада</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="71" data-letter="Г">Греция</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="146" data-letter="Г">Грузия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="72" data-letter="Д">Дания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="187" data-letter="Д">Джибути</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="188" data-letter="Д">Доминика</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="58" data-letter="Д">Доминикана</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="12" data-letter="Е">Египет</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="145" data-letter="З">Замбия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="4" data-letter="З">Зимбабве</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="34" data-letter="И">Израиль</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="35" data-letter="И">Индия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="26" data-letter="И">Индонезия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="36" data-letter="И">Иордания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="175" data-letter="И">Ирак</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="143" data-letter="И">Иран</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="93" data-letter="И">Ирландия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="73" data-letter="И">Исландия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="74" data-letter="И">Испания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="75" data-letter="И">Италия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="184" data-letter="Й">Йемен</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="242" data-letter="К">Кабо-Верде</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="149" data-letter="К">Казахстан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="127" data-letter="К">Каймановы о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="116" data-letter="К">Камбоджа</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="14" data-letter="К">Камерун</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="141" data-letter="К">Канада</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="110" data-letter="К">Катар</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="15" data-letter="К">Кения</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="76" data-letter="К">Кипр</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="37" data-letter="К">Китай</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="128" data-letter="К">Колумбия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="172" data-letter="К">Коморские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="198" data-letter="К">Королевство Тонга</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="59" data-letter="К">Коста-Рика</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="173" data-letter="К">Кот-д’Ивуар</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="60" data-letter="К">Куба</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="195" data-letter="К">Кувейт</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="8" data-letter="К">Кука о.</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="252" data-letter="К">Кыргызстан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="291" data-letter="К">Кюрасао о.</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="200" data-letter="Л">Лаос</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="103" data-letter="Л">Латвия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="113" data-letter="Л">Ливан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="152" data-letter="Л">Ливия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="122" data-letter="Л">Литва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="203" data-letter="Л">Лихтенштейн</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="139" data-letter="Л">Люксембург</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="41" data-letter="М">Маврикий</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="207" data-letter="М">Мавритания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="42" data-letter="М">Мадагаскар</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="205" data-letter="М">Македония</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="27" data-letter="М">Малайзия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="43" data-letter="М">Мальдивы</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="77" data-letter="М">Мальта</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="247" data-letter="М">Марианские о-ва</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="16" data-letter="М">Марокко</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="61" data-letter="М">Мартиника</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="62" data-letter="М">Мексика</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="156" data-letter="М">Мозамбик</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="151" data-letter="М">Молдова</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="78" data-letter="М">Монако</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="209" data-letter="М">Монголия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="117" data-letter="М">Мьянма (Бирма)</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="17" data-letter="Н">Намибия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="274" data-letter="Н">Независимое Государство Самоа</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="38" data-letter="Н">Непал</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="211" data-letter="Н">Нигерия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="79" data-letter="Н">Нидерланды</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="129" data-letter="Н">Никарагуа</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="7" data-letter="Н">Новая Зеландия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="210" data-letter="Н">Новая Каледония</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="80" data-letter="Н">Норвегия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="32" data-letter="О">ОАЭ</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="107" data-letter="О">Оман</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="153" data-letter="П">Пакистан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="256" data-letter="П">Палестина</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="130" data-letter="П">Панама</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="28" data-letter="П">Папуа Новая Гвинея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="137" data-letter="П">Парагвай</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="51" data-letter="П">Перу</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="140" data-letter="П">Польша</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="81" data-letter="П">Португалия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="186" data-letter="П">Пуэрто-Рико</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="273" data-letter="Р">Республика Палау</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="44" data-letter="Р">Реюньон</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="1" data-letter="Р">Россия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="257" data-letter="Р">Руанда</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="123" data-letter="Р">Румыния</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="64" data-letter="С">США</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="189" data-letter="С">Сальвадор</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="290" data-letter="С">Сан-Марино</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="148" data-letter="С">Саудовская Аравия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="19" data-letter="С">Свазиленд</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="194" data-letter="С">Северная Корея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="45" data-letter="С">Сейшелы</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="259" data-letter="С">Сен-Бартельми</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="260" data-letter="С">Сен-Мартен</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="213" data-letter="С">Сенегал</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="261" data-letter="С">Сент-Винсент и Гренадины</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="288" data-letter="С">Сент-Китс и Невис</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="63" data-letter="С">Сент-Люсия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="222" data-letter="С">Сербия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="29" data-letter="С">Сингапур</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="120" data-letter="С">Сирия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="82" data-letter="С">Словакия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="96" data-letter="С">Словения</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="215" data-letter="С">Судан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="216" data-letter="С">Суринам</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="217" data-letter="Т">Таджикистан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="30" data-letter="Т">Таиланд</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="39" data-letter="Т">Тайвань</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="20" data-letter="Т">Танзания</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="220" data-letter="Т">Теркс и Кайкос</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="219" data-letter="Т">Того</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="218" data-letter="Т">Тринидад и Тобаго</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="21" data-letter="Т">Тунис</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="147" data-letter="Т">Туркменистан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="83" data-letter="Т">Турция</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="22" data-letter="У">Уганда</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="142" data-letter="У">Узбекистан</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="114" data-letter="У">Украина</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="134" data-letter="У">Уругвай</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="9" data-letter="Ф">Фиджи</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="31" data-letter="Ф">Филиппины</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="3" data-letter="Ф">Финляндия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="84" data-letter="Ф">Франция</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="196" data-letter="Ф">Французская Гвиана</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="132" data-letter="Ф">Французская Полинезия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="85" data-letter="Х">Хорватия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="171" data-letter="Ч">Чад</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="86" data-letter="Ч">Черногория</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="87" data-letter="Ч">Чехия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="52" data-letter="Ч">Чили</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="89" data-letter="Ш">Швейцария</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="90" data-letter="Ш">Швеция</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="46" data-letter="Ш">Шри-Ланка</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="53" data-letter="Э">Эквадор</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="190" data-letter="Э">Экваториальная Гвинея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="191" data-letter="Э">Эритрея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="118" data-letter="Э">Эстония</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="192" data-letter="Э">Эфиопия</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="23" data-letter="Ю">ЮАР</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="119" data-letter="Ю">Южная Корея</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="65" data-letter="Я">Ямайка</li>
<li class="uni-form-dd-i uni-form-dd-i-s" data-id="40" data-letter="Я">Япония</li>
</ul>
</div>
</td>
</tr>
</table>
<div class="uni-form-dash-wrap" style="border: 1px solid #dcdcdc;">
<a href="javascript:void(0);" class="uni-form-dash-c8242b uni-form-btn_sel-city">
<span>Очистить фильтр</span>
</a>
</div>
</div>
</div>
</td>
</tr>
<tr>
<td colspan="2">
<div class="searchbar-form-pp-point">
<div class="searchbar-form-pp">
<div class="searchbar-form-pp-hider"></div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</form>
</div>
<div class="searchbar-setting">
<div class="banner-rixos promo-trigger">
<!--AdvBroker: баннерное место "В центре под строкой поиска" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(3683, function(){ return AB_REQUEST + '&bt=top&' });
/*]]>*/</script>
<!--/AdvBroker-->
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
/*<![CDATA[*/
var _searcherSelectedCountry = false;
/*]]>*/
</script>
</td>
<td width="250">
<div id="header-adv">
<!--AdvBroker: баннерное место "ушко 250*150" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(3302,"&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;")
/*]]>*/</script>
<!--/AdvBroker-->
</div>
</td>
</tr>
</table>
</div>
</div>
<table class="grid-tbl" id="topnav">
<tr class="grid-tr">
<td class="grid-td-left">
<div class="grid-cnt">
<div class="profile profile_club"></div>
</div>
</td>
<td colspan="2" class="grid-td-center">
<div class="grid-cnt">
<div class="main-menu main-menu_new">
<ul class="main-menu-ul">
<li class="main-menu-li"><a href="/" class="main-menu-li-a" title="Главная">Главная</a></li>
<li class="main-menu-li main-menu-li_active"><a href="/main/hotels_choose" class="main-menu-li-a" title="Выбор отеля">Выбор отеля</a></li>
<li class="main-menu-li main-menu-li_burger">
<a href="#" id="link-trigger-visited-favorites" class="main-menu-li-a" onclick="$('#tooltip-spec-visited-favorites').toggle();return false"></a>
<div id="tooltip-spec-visited-favorites" class="tooltip-spec popup">
<div class="tooltip-head-select">
<span class="tooltip-head-select-tab visited tooltip-head-select-tab_act">
<span class="tooltip-select-1">
<strong><a href="javascript:void(0);">
Вы смотрели
</a></strong>
</span>
<span class="tooltip-select-4 tooltip-select-0b80c4">— 0</span>
</span>
<span class="tooltip-head-select-tab favorite">
<span class="tooltip-select-3">
<strong><a href="javascript:void(0);">Избранные</a></strong>
</span>
<span class="tooltip-select-4 count"></span>
</span>
</div>
<div class="tooltip-spec-wrapper-tab visited tooltip-spec-wrapper-tab_act">
<div class="tooltip-spec-wrapper" id="last_visit_hotels_ab">
<div class="side-bb1-block not-visit-block">
<div class="not-visit">
В настоящий момент у Вас нет просмотренных отелей.
</div>
</div>
<!--AdvBroker: баннерное место "Последние отели" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(46, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;&amp;bt=th_last_hotels_left")
.done(function(){
if (typeof user_ban_by_user_init == 'undefined' || user_ban_by_user_init == 0) {
if ($('#rate-user-show').length) {
$('#last_visit_hotels_ab .side-bb1-in-it').each(function(index, elem) {
item = '<div class="tooltip-select-main"><p class="item"><span class="tooltip-label">' + $(this).html() + '</span></p></div>';
$('#rate-user-show').append(item);
});
$('#rate-user-show .left-list-item-nums + p').remove();
$('#rate-user-show .left-list-item-nums').remove();
$('#rate-user-show .side-bb1-gray').addClass('tooltip-hotel-val3').removeClass('side-bb1-gray');
$('#rate-user-show p.item').each(function(index, elem) {
$(this).find('.tooltip-hotel-val3').html($(this).find('.tooltip-hotel-val3').text().replace(" /", ","));
$(this).append('<a class="hotel-review-also-item-more" href="#">добавить отзыв или фото</a>');
$(this).find('a:first').removeAttr('target');
$(this).find('a').attr('href', '/main/rate/' + $(this).find('a:first').attr('allocation_id'));
$(this).find('br').remove();
});
$('#rate-user-show').show();
}
var lengthEl = $('#last_visit_hotels_ab .side-bb1-in-it').length;
$('#last_visit_hotels_ab style').remove();
$('#last_visit_hotels_ab .side-bb1-title').remove();
$('.tooltip-head-select .tooltip-select-0b80c4').html("&mdash; " + lengthEl);
if (lengthEl) {
$('#last_visit_hotels_ab .not-visit-block').remove();
$('.tooltip-spec-wrapper').css("overflow-y", "scroll");
$('#last_visit_hotels_ab .side-bb1-in-it').each(function(index, elem) {
resort = $(this).find('.side-bb1-gray');
resort.text(resort.text().replace(" /", ","));
$(this).find('.left-list-item-nums').append(resort);
});
}
$('#last_visit_hotels_ab').show();
$('#link-trigger-visited-favorites').trigger('load_visited');
$.observer.notify('hotels-catalog-menu-visited-loaded', [lengthEl]);
}
})
.fail(function(){
$('#link-trigger-visited-favorites').trigger('load_visited');
});
/*]]>*/</script>
<!--/AdvBroker-->
</div>
</div>
<div class="tooltip-spec-wrapper-tab favorite">
</div>
<div class="close-tooltip" onclick="$('a.main-menu-li-a').removeClass('main-menu-li-a_act');">
<button>Закрыть</button>
</div>
<span class="tooltip-arrow"> </span>
</div>
<!-- end tooltip -->
</li>
<li class="main-menu-li"><a href="/main/hotline" class="main-menu-li-a" title="Спецакции и новости">
Спецакции
<span class="all-text-main-menu-hotline">и новости</span>
</a></li>
<li class="main-menu-li"><a href="/main/top100" class="main-menu-li-a" title="Рейтинги и номинации">Рейтинги и номинации</a></li>
<li class="main-menu-li"><a href="/main/touragencies" class="main-menu-li-a" title="Турагентства">Турагентства</a></li>
</ul>
</div>
</div>
</td>
</tr>
</table>
<!--AdvBroker: баннерное место "Баннер в центре" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place('281', "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/</script>
<!--/AdvBroker-->
<!--AdvBroker: баннерное место "ТГБ (4 шт.) под растяжкой ТХ" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place('3576', "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/</script>
<!--/AdvBroker-->
<div class="tgb-wrap">
<!--AdvBroker: баннерное место "ТГБ-баннер, 2-3 баннера (повторяющееся) 0081677" -->
<script type="text/javascript">/*<![CDATA[*/
var ab_place_3599_al = '1035',
ab_place_3599_co = '32';
ab_place('3599', "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;")
.done(function(){
$(this).parent().css('margin', '10px 10px 0');
});
/*]]>*/</script>
<!--/AdvBroker-->
</div>
<div id="content" class="clear">
<div class="side side_open side-right">
<!--AdvBroker: баннерное место "ТГБ на главной справа" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(3688, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;&amp;pt=ttm_th_right_top&amp;bt=th_right_top")
.done(function() {
$.observer.notify('left-menu-height-updated');
});
/*]]>*/</script>
<!--/AdvBroker-->
</div>
<table width="100%">
<tr>
<td id="leftbar">
<div class="wrap">
<span class="app-thUserTypeSelect"><span class="app-thUserTypeSelect-loading"><img src="/i/loading.gif"></span></span><div class="side-nav">
<ul class="side-nav-ul">
<li class="side-nav-li side-nav-li-ttl">Выбор отеля</li>
<li class="side-nav-li">
<a href="/main/hotel_select/?co=32" class="side-nav-li-a">по параметрам</a>
</li>
<li class="side-nav-li">
<a href="/main/bonus/32" class="side-nav-li-a">по бонусным акциям</a>
</li>
<li class="side-nav-li" style="display:none;" id="menu_advbroker_consultant">
<a href="/main/managers/32" class="side-nav-li-a">через турагентство</a>
</li>
</ul>
</div>
<script type="text/javascript">
/*<![CDATA[*/
var countryId = 32;
/*]]>*/
</script>
<div class="side-nav">
<ul class="side-nav-ul">
<li class="side-nav-li side-nav-li-ttl">Каталоги отелей</li>
<li class="side-nav-li">
<a href="/main/hotels/32" class="side-nav-li-a-red side-nav-li-a-red-arrow">все отели</a>
</li>
<li class="side-nav-li">
<a href="/main/goodhotels/32" class="side-nav-li-a">хорошие отели</a>
</li>
<li class="side-nav-li">
<a href="/main/popular_hotel/32" class="side-nav-li-a">популярные отели</a>
</li>
<li class="side-nav-li">
<a href="/main/hotelchain/?co=32?re=all" class="side-nav-li-a">сети отелей</a>
</li>
</ul>
</div>
<script type="text/javascript">/*<![CDATA[*/
$(document).ready(function() {
if ($('#announcements-menu-link').length > 0) {
$.ajax({
url: "http://advbroker.ru/data/gate.php",
data: { worker: "Banner_Allocation_SimilarCount", format: "jsonp", co: 32 },
dataType: "jsonp",
success: function(data) {
if ( parseInt(data.count) > 3 ) $('#announcements-menu-link').show();
}
});
}
});
/*]]>*/</script>
<div class="side-nav">
<ul class="side-nav-ul">
<li class="side-nav-li side-nav-li-ttl">Обзор направления</li>
<li class="side-nav-li">
<a href="/main/country/32" class="side-nav-li-a">по стране</a>
</li>
<li class="side-nav-li">
<a href="/main/resorts/32" class="side-nav-li-a">по курортам</a>
</li>
<li class="side-nav-li">
<a href="/main/places/32" class="side-nav-li-a">по местам</a>
</li>
<li class="side-nav-li">
<a href="/main/hotels/32/travellers" class="side-nav-li-a">по туристам</a>
</li>
<li class="side-nav-li" style="display:none;" id="menu_advbroker_operator">
<a href="/main/touroperators/32" class="side-nav-li-a">по туроператорам</a>
</li>
<li class="side-nav-li">
<a href="/main/hotline/?co=32" class="side-nav-li-a">спецакции и новости</a>
</li>
</ul>
</div>
<script type="text/javascript">
/*<![CDATA[*/
var countryId = 32;
/*]]>*/
</script>
<div style="margin-bottom: 8px;">
<!--AdvBroker: баннерное место "в меню слева 1" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(3303, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/</script>
<!--/AdvBroker-->
</div>
<!--AdvBroker: баннерное место опрос "Какие ТВ каналы вы смотрите в отеле" -->
<div style="margin-bottom: 8px;">
<script type="text/javascript">/*<![CDATA[*/
ab_place(3696, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;&amp;bt=th_vote");
/*]]>*/</script>
</div>
<!--/AdvBroker-->
<div style="margin-bottom: 8px;">
<!--AdvBroker: баннерное место "в меню слева 1" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(3310, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;")
.done(function() {
$.observer.notify('left-menu-height-updated');
});
/*]]>*/</script>
<!--/AdvBroker-->
</div>
<div class="side-stat m10b">
<div>
<p class="side-stat-ttl">ОАЭ на TopHotels</p>
<table width="100%">
<tr>
<td class="side-stat-td">Отелей:</td>
<td class="side-stat-td">903</td>
</tr>
<tr>
<td class="side-stat-td">Отелей с отзывами:</td>
<td class="side-stat-td">526</td>
</tr>
<tr>
<td class="side-stat-td">Мнения турагентов:</td>
<td class="side-stat-td">1218</td>
</tr>
<tr>
<td class="side-stat-td">Отзывов туристов:</td>
<td class="side-stat-td">15181</td>
</tr>
<tr>
<td class="side-stat-td">Фотографий:</td>
<td class="side-stat-td">9412</td>
</tr>
<tr>
<td class="side-stat-td">Фото от туристов:</td>
<td class="side-stat-td">39871</td>
</tr>
<tr>
<td class="side-stat-td">
<a href="/main/stat/resorts/?co=32" class="side-stat-td">Рейтинг направления</a>
</td>
<td class="side-stat-td"></td>
</tr>
<tr>
<td class="side-stat-td">
<a href="/main/stat/resorts/?co=32" class="side-stat-td">Статистика просмотров</a>
</td>
<td class="side-stat-td"></td>
</tr>
</table>
</div>
</div>
<div class="left-fly-menu">
<div class="trolley app-tourSearchRequest-slider-place">
<span class="wide-screen-max-1280">
<div class="app-tourSearchRequest-place trolley-inner" id="tour-search-float" style="display: none;">
<a onclick="nl_count_params(1001, 10, 36, 32);" class="app-tourSearchRequest agent-help agent-help_v3" href="javascript:void(0)">
<div class="agent-help-top">
<span>Помощь</span>
<br>
<span>в подборе тура</span>
</div>
<button class="agent-help-btn">отправить запрос турагентам</button>
</a>
</div>
</span>
</div>
<div class="tour-agent tour-agent-parent" id="tour-agent-left-menu">
</div>
<div class="side-nav-tip-wrap m10t m15b" id="vkwidget-left-menu">
</div>
</div>
</div>
</td>
<td id="centerbar">
<div class="wrap">
<div itemscope itemtype="http://schema.org/Hotel">
<div class="grid-cnt">
<div class="page-ttls-grey">
<div class="page-ttls-top">
<div class="page-ttls-stars stars4"></div>
</div>
<div class="page-ttls-mid">
<div class="page-ttls-wrap">
<h1 class="page-ttls-name">
<a href="/main/hotel/al1035/" class="pages-ttls-l-link pages-ttls-l-link-black pages-ttls-places-link-underline-inv" itemprop="name">
Coral Beach Resort 4*
</a>
</h1>
<div class="page-ttls-detail">
<span class="page-ttls-detail-id">ID 1035</span>
<span class="page-ttls-detail-loc">
<span itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
<a href="/main/hotels/32/" title="Отели ОАЭ" class="pages-ttls-places-link-underline-inv" itemprop="url">
<span itemprop="title">ОАЭ</span></a></span>,
<span itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
<a href="/main/hotels/32/?Re=67" title="Отели Шарджа и ОАЭ" class="pages-ttls-places-link-underline-inv" itemprop="url">
<span itemprop="title">Шарджа</span></a></span>
</span>
</div>
</div>
</div>
<div class="page-ttls-bot">
<a href="/main/rate/1035" class="page-ttls-add-review" title="Добавить отзыв об отеле Coral Beach Resort 4*" onclick="nl_count_params(1001, 209, 1, 0);">
Добавить отзыв и фото
</a>
<span class="app-compare-direction-hotels" data="{ co:32, al:1035, name:'Coral Beach Resort 4*' }"></span>
<span class="app-favorite-direction-hotels" data="{ al: 1035, name:'Coral Beach Resort 4*' }"></span>
<span id="wp-3c749d6c6ef19bb81b4b7c5396743c07-1"></span>
<script id="tmpl-3c749d6c6ef19bb81b4b7c5396743c07-1" type="text/x-jquery-tmpl">
<span class="page-ttls-dot-sep">•</span>
<a class="page-ttls-igi app-traveller-form-i-go-w{{if user_will_go}} page-ttls-compare{{/if}}" href="javascript:void(0)" data="{allocId:${allocation.id}, newVersion: '1'}">{{t "travellers:buttons.i_will_go2"}}</a>
<span class="page-ttls-dot-sep">•</span>
<a class="page-ttls-was app-traveller-form-visited-w{{if user_was_here}} page-ttls-compare{{/if}}" href="javascript:void(0)"
data-alloc-id="${allocation.id}"
data-alloc-name="${allocation.name}"
data-last_visit="{{if user_was_here}}1{{else}}0{{/if}}"
data-last_visit_month="${last_visit.month}}"
data-last_visit_year="${last_visit.year}"
data-country="${allocation.country_id}"
data-last_visit_travel_company="${last_visit.travel_company}"
data-last_visit_recommendation="${last_visit.recommendation}"
data-new-version='1'>{{t "travellers:buttons.i_was_in_hotel2"}}</a>
</script>
<script type="text/javascript">/*<![CDATA[*/
(function() {
var place_params = {}, request_data = {
"al": "1035"
}, request_link = Env.links.UserTravellerInfo;
$(document).ready(function() {
i18n.loadNamespace('travellers', function(){
$.post(Env.links.UserTravellerInfo, request_data, null, 'json')
.done(function(response) {
var response = response||{};
place_params = $.extend(true,place_params, (typeof response.status == 'undefined' || (typeof response.status != 'undefined' && response.status == 'ok')) ? response.data : {});
if(typeof response.tmpl != 'undefined'){ $('#tmpl-3c749d6c6ef19bb81b4b7c5396743c07-1').text(response.tmpl); }
$('span#wp-3c749d6c6ef19bb81b4b7c5396743c07-1').html($('#tmpl-3c749d6c6ef19bb81b4b7c5396743c07-1').tmpl(place_params));
$.observer.notify('set-traveller-links-action', ['wp-3c749d6c6ef19bb81b4b7c5396743c07-1', place_params]);
$.observer.notify('right-menu-updated', ['wp-3c749d6c6ef19bb81b4b7c5396743c07-1', place_params]);
$.observer.add('update-traveller-w', function(event, data){place_params=$.extend(true,place_params,data);$('span#wp-3c749d6c6ef19bb81b4b7c5396743c07-1').html($('#tmpl-3c749d6c6ef19bb81b4b7c5396743c07-1').tmpl(place_params));});
}
);
});
});
})();
/*]]>*/</script>
</div>
</div>
<hr size="11">
<div class="dir-case">
<div class="dir-case-tabs">
<ul class="dir-case-tabs-ul">
<li class="dir-case-tabs-li ">
<a href="/main/hotel/al1035/road_map" class="dir-case-tabs-li-a dir-case-tabs-li-a-rm" title="Карта профиля отеля Coral Beach Resort 4*"> <img alt="" src="/i/dir-home-2.png">
</a>
</li>
<li class="dir-case-tabs-li dir-case-tabs-li_current">
<a href="/main/hotel/al1035/" class="dir-case-tabs-li-a" title="Описание отеля Coral Beach Resort 4*">
Отель
</a>
</li>
<li class="dir-case-tabs-li ">
<a href="/main/hotel/al1035/hotline/" class="dir-case-tabs-li-a" title="Новости и события Coral Beach Resort 4*">
Новости и события
</a>
</li>
<li class="dir-case-tabs-li ">
<a href="/main/hotel/al1035/tours/" class="dir-case-tabs-li-a" title="Цены и туры в отель Coral Beach Resort 4*">
Цены и туры
</a>
</li>
<li class="dir-case-tabs-li ">
<a href="/main/hotel/al1035/bonus/" style="color: #DA4C4C;" class="dir-case-tabs-li-a" title="Бонусы отеля Coral Beach Resort 4*">
Бонусы и акции
</a>
</li>
<li class="dir-case-tabs-li ">
<a href="/main/hotel/al1035/sale_partners" style="display: none;" id="hotel-top-menu-sale-partners" class="dir-case-tabs-li-a" title="Партнеры по продажам Coral Beach Resort 4*">
Партнеры по продажам
</a>
</li>
</ul>
</div>
<div class="dir-case-tabs-cnt" style="display:block;">
<ul class="dir-case-tabs-cnt-ul dir-case-tabs-cnt-ul-descr">
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/" class="dir-case-tabs-cnt-li-a" title="">Описание отеля</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/media" class="dir-case-tabs-cnt-li-a" title="">Фото и видео</a>
<span class="dir-case-tabs-cnt-li-count">444/2</span>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/reviews/?rates=8" class="dir-case-tabs-cnt-li-a dir-case-tabs-cnt-li-a-active" title="">Отзывы</a>
<span class="dir-case-tabs-cnt-li-count">197</span>
</li>
</ul>
<ul class="dir-case-tabs-cnt-ul dir-case-tabs-cnt-ul-descr">
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/rooms/" class="dir-case-tabs-cnt-li-a" title="Номера отеля Coral Beach Resort 4*">Номера</a>
<span class="dir-case-tabs-cnt-li-count">2</span>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/infrastructure/" class="dir-case-tabs-cnt-li-a" title="Инфраструктура Coral Beach Resort 4*">Инфраструктура</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/around_hotel" class="dir-case-tabs-cnt-li-a" title="Вокруг отеля Coral Beach Resort 4*">Вокруг отеля</a>
</li>
</ul>
<ul class="dir-case-tabs-cnt-ul dir-case-tabs-cnt-ul-descr">
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/services/" class="dir-case-tabs-cnt-li-a" title="Рейтинги сервисов отеля Coral Beach Resort 4*">Рейтинги сервисов</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/rating/" class="dir-case-tabs-cnt-li-a" title="Рейтинг пользователей Coral Beach Resort 4*">Рейтинг пользователей</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/questions/" class="dir-case-tabs-cnt-li-a" title="Вопросы об отеле Coral Beach Resort 4*">Вопросы об отеле</a>
</li>
</ul>
<ul class="dir-case-tabs-cnt-ul dir-case-tabs-cnt-ul-descr">
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/contacts/" class="dir-case-tabs-cnt-li-a" title="Контакты отеля Coral Beach Resort 4*">Контакты и представители</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/additional_info/" class="dir-case-tabs-cnt-li-a" title="Доп. инфо Coral Beach Resort 4*">Доп. инфо</a>
</li>
<li class="dir-case-tabs-cnt-li">
<a href="/main/hotel/al1035/travellers/" class="dir-case-tabs-cnt-li-a" title="Туристы едут в отель Coral Beach Resort 4*">Туристы едут в отель</a>
<span class="dir-case-tabs-cnt-li-count">303</span>
</li>
</ul>
<ul class="dir-case-tabs-cnt-ul dir-case-tabs-cnt-ul-descr">
</ul>
</div>
</div>
<hr size="10">
<div class="dynamics" itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
<div class="dynamics-case">
<a class="dynamics-case-plus" href="javascript:void(0);"></a>
<ul class="dynamics-case-ul">
<li class="dynamics-case-li">Рейтинг пользователей — <span class="dynamics-case-score">4,27</span>
</li>
<li class="dynamics-case-li">рекомендуют — <span class="dynamics-case-score">76,2%</span>
</li>
<li class="dynamics-case-li">отзывов — <span class="dynamics-case-score">197</span>
</li>
<li class="dynamics-case-li">Нравится — <span class="dynamics-case-score">15</span>
</li>
</ul>
</div>
<table width="100%" class="dynamics-big">
<tbody>
<tr>
<td class="dynamics-td">
<div class="dynamics-l">
<div class="dynamics-title">
Рейтинг пользователей:
<a class="dynamics-dash dynamics-rating-popup" href="javascript:void(0);">динамика</a>
<div id="dynamic_raiting" class="dynamic_raiting" style="left: 463px; top: 413px; display: none;">
<h3>
<span class="close_pp"> </span>Динамика рейтинга</h3>
<div class="pa_tab">
<table>
<tr>
<td class="fi_tab">2015</td>
<td>4,27</td>
<td class="green">
</td>
</tr>
<tr>
<td class="fi_tab">2014</td>
<td>4,27</td>
<td class="green">
</td>
</tr>
<tr>
<td class="fi_tab">2013</td>
<td>4,26</td>
<td class="green">
+ 0,04
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="dynamics-clear">
<div class="dynamics-rating dynamics-rating-good" itemprop="rating" itemscope itemtype="http://data-vocabulary.org/Rating">
<span itemprop="average">4,27</span>
</div>
<div class="dynamics-sub-r">
<div class="dynamics-clear">
<p class="dynamics-sub-r-text">Размещение</p>
<span class="dynamics-sub-r-rating">4,33</span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text">Сервис</p>
<span class="dynamics-sub-r-rating">4,32</span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text">Питание</p>
<span class="dynamics-sub-r-rating">4,17</span>
</div>
</div>
<div class="dynamics-bot-text">
Отель
<a class="dynamics-reccomend dynamics-reccomend-popup rating-popup" href="javascript:void(0);">
<span class="dynamics-dash">рекомендуют 76,2%</span>
</a>
</div>
</div>
</div>
<div id="pp-recom" class="pp-add popup" style="display: none;">
<h3 style="padding-right:8px;">
<span class="close_pp"></span>Рекомендации</h3>
<div class="pa_tab">
<table style="width:100%;">
<tr>
<td>Рекомендуют</td>
<td class="green right">115</td>
<td class="green right">(76,2%)</td>
</tr>
<tr>
<td>Воздержались</td>
<td class="declain right">22</td>
<td class="declain right">(14,6%)</td>
</tr>
<tr class="last">
<td>Не рекомендуют</td>
<td class="red right">14</td>
<td class="red right">(9,3%)</td>
</tr>
</table>
</div>
</div>
</td>
<td class="dynamics-td dynamics-td-last">
<div class="dynamics-m">
<div class="dynamics-title">Отзывы и фотографии</div>
<div class="dynamics-clear">
<div class="dynamics-rating-col">
<a class="dynamics-rating dynamics-rating-brown" href="/main/hotel/al1035/reviews/?rates=8"><span itemprop="count">197</span></a>
<div class="dynamics-sub-mid-r">
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid">Хороших</p>
<span class="dynamics-likes-rate dynamics-likes-rate-good">
<i class="dynamics-likes-rate-i">
<img alt="" class="dynamics-likes-rate-img" src="/i/px.gif" style="width: 81%">
</i>
</span>
<span class="dynamics-sub-r-rating">160 <span class="dynamics-sub-r-pers">81%</span></span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid">Средних</p>
<span class="dynamics-likes-rate dynamics-likes-rate-moderate">
<i class="dynamics-likes-rate-i">
<img alt="" class="dynamics-likes-rate-img" src="/i/px.gif" style="width: 14%">
</i>
</span>
<span class="dynamics-sub-r-rating">28 <span class="dynamics-sub-r-pers">14%</span></span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid">Плохих</p>
<span class="dynamics-likes-rate dynamics-likes-rate-bad">
<i class="dynamics-likes-rate-i">
<img alt="" class="dynamics-likes-rate-img" src="/i/px.gif" style="width: 5%">
</i>
</span>
<span class="dynamics-sub-r-rating">9 <span class="dynamics-sub-r-pers">5%</span></span>
</div>
</div>
<div class="dynamics-bot-text">
Просмотров страницы — <a class="dynamics-dash visit-popup" href="javascript:void(0)">216</a>
</div>
<div class="pp-add popup" id="pp-view-page" style="display: none;">
<h3>
<span class="close_pp"></span>Просмотров</h3>
<div class="pa_tab">
<table style="width:100%;">
<tr>
<td>Вчера</td>
<td class="green right">216</td>
</tr>
<tr>
<td>За 7 дней</td>
<td class="green right">1762</td>
</tr>
<tr>
<td>За месяц</td>
<td class="green right">7319</td>
</tr>
</table>
</div>
</div>
</div>
<div class="dynamics-rating-col">
<div class="dynamics-sub-mid-r">
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid2">Туристы</p>
<span class="dynamics-sub-r-rating">176</span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid2">Турагенты</p>
<span class="dynamics-sub-r-rating">21</span>
</div>
<div class="dynamics-clear">
<p class="dynamics-sub-r-text-mid2">фото</p>
<span class="dynamics-sub-r-rating">444</span>
</div>
</div>
<div class="dynamics-sub-mid-r2">
<div class="dynamics-bot-text">
<a class="dynamics-simple-link" href="/main/rate/1035">Добавить отзыв</a>
</div>
</div>
</div>
<!--[if lt IE 9]>
<style>
.ls-form-inp input{
width: 150px;
}
</style>
<![endif]-->
<div class="dynamics-rating-col dynamics-rating-col-last">
<div class="dynamics-sub-mid-r dynamics-sub-mid-r3 dynamics-icons">
<div class="dynamics-sub-mid-ilike app_heart_label app_heart hotel-inf-ico-heart hotel-inf-ico-heart1">15</div>
<a href="javascript:void(0);" class="dynamics-sub-mid-ilike-a app_heart_label" title="нравится отель">
<span>нравится</span>
<br>
<span>отель</span>
</a>
</div>
<script type="text/javascript">
/*<![CDATA[*/
var allocId = 1035;
/*]]>*/
</script>
<!--noindex-->
<div class="dynamics-sub-mid-r dynamics-sub-mid-r3 dynamics-icons">
<div class="dynamics-sub-mid-envelope app_subscribe" data-alloc-id="1035" id="app_subscribe-div">5</div>
<a href="javascript:void(0);" data-source-id="1" data-alloc-id="1035" class="dynamics-sub-mid-envelope-a overlay-subscr-hotel-news app_subscribe" title="подписаны на отель">
<span>
подписаны
</span>
<br>
<span>на отель</span>
</a>
</div>
<div id="div-hotline-substr-insert">
<div style="display: none;" class="overlay-subscr overlay-subscr-none"></div>
<div style="display: none;" class="overlay"></div>
<div class="overlay-loading" style="top: -900px;">
<img src="/i/loading.gif" alt="">
</div>
<div class="modal-like-main modal-like-main-absolute overlay-news-popup overlay-news-popup-form overlay-news-popup-form-with-users" style="top: -900px; width: 520px;">
<button class="modal-like-x modal-close overlay-box-close overlay-box-close-form"></button>
<div class="modal-like-count modal-like-count_yellow">
<span class="modal-like-count-s">5</span>
</div>
<div class="modal-like-people">
<div class="people-label">
<span class="count-subscribers">5 подписчиков</span><span class="subscribes-your-friends" style="display: none;">, в том числе – <span class="subscribes-your-friends-count"></span></span>
</div>
<div class="modal-like-people-avas">
<a href="/main/user/366814" target="_blank"><img src="/icache/user_avatars/367/366814_764264034_35x35.JPG" alt="" width="35" height="35"></a>
<a href="/main/user/170990" target="_blank"><img src="/i/_user_avatar_no.gif" alt="" width="35" height="35"></a>
<a href="/main/user/799491" target="_blank"><img src="/i/_user_avatar_no.gif" alt="" width="35" height="35"></a>
<a href="/main/user/913683" target="_blank"><img src="/i/_user_avatar_no.gif" alt="" width="35" height="35"></a>
<a href="/main/user/918520" target="_blank"><img src="/i/_user_avatar_no.gif" alt="" width="35" height="35"></a>
</div>
<span class="modal-like-people-tail"></span>
</div>
<div class="modal-like-main-ttl">
Об отеле из первых рук!
</div>
<p class="modal-like-main-p modal-like-main-p_short">
Подписывайтесь на отель и всегда узнавайте первым<br>о самых актуальных спецакциях и восхитительно низких ценах!
</p>
<div class="modal-visit-main-bot m20t">
<div class="modal-like-form">
<div class="modal-like-form-line">
<div class="filter-form">
<div class="filter-form-line-wrap">
<div class="filter-form-line sub-mail-div">
<div class="filter-form-cell" style="width: 50%;">
<div class="filter-form-elem">
<div class="filter-form-elem-wrap filter-form-elem-wrap_blank">
<div class="filter-form-field">
<div class="filter-form-field-inner">
<input class="filter-form-field-inp required input_placeholder" type="text" name="sub_mail" id="sub_mail" placeholder="Ваш электронный адрес">
</div>
</div>
</div>
</div>
</div>
</div>
<div class="filter-form-line">
<div class="filter-form-cell" style="width: 50%;">
<div class="filter-form-elem">
<div class="filter-form-elem-wrap filter-form-elem-wrap_blank">
<div class="filter-form-lbl"><span>Получать</span></div>
<div class="filter-form-field">
<div class="filter-form-field-inner">
<span class="ls-form-inp-temp-text-all" style="display:none;">постоянно</span>
<input type="text" class="filter-form-field-inp required dropdown ls-form-inp-temp-text" value="постоянно" readonly placeholder="постоянно">
<div class="filter-form-field-dd">
<a href="javascript:void(0);" class="filter-form-field-dd-i subscription-permanent" temp_sub="0"><span class="filter-form-field-val">постоянно</span></a>
<a href="javascript:void(0);" class="filter-form-field-dd-i subscription-permanent" temp_sub="1"><span class="filter-form-field-val">временно</span></a>
</div>
<input type="hidden" name="subscription-permanent" id="subscription-permanent" value="0">
</div>
</div>
</div>
</div>
</div>
<div class="filter-form-cell">
<div class="filter-form-elem">
<div class="filter-form-elem-wrap filter-form-elem-wrap_blank">
<div class="filter-form-lbl filter-form-lbl_auto"><span>Читать</span></div>
<div class="filter-form-field">
<div class="filter-form-field-inner">
<span class="ls-form-inp-sel-text-all" style="display:none;">Все сообщения отеля</span>
<input type="text" class="filter-form-field-inp dropdown ls-form-inp-sel-text" value="Все сообщения отеля" readonly placeholder="Все сообщения отеля">
<div class="filter-form-field-dd">
<div class="filter-form-field-dd-line filter-form-field-dd-wrap">
<div class="filter-form-location-i">
<input type="checkbox" class="filter-form-lbl-chk type_sub" name="type_sub[]" id="type_sub1" value="1" checked>
<label for="type_sub1" class="filter-form-lbl-i">
<span class="filter-form-lbl-chk-icon"></span>
<div class="filter-form-location-name ls-form-chck-lbl ls-form-chck-lbl1">Новость</div>
</label>
</div>
<div class="filter-form-location-i">
<input type="checkbox" class="filter-form-lbl-chk type_sub" name="type_sub[]" id="type_sub2" value="2" checked>
<label for="type_sub2" class="filter-form-lbl-i">
<span class="filter-form-lbl-chk-icon"></span>
<div class="filter-form-location-name ls-form-chck-lbl ls-form-chck-lbl2">Спецакция</div>
</label>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="filter-form-line">
<div class="filter-form-cell" style="width: 50%;">
<div class="filter-form-elem filter-permanent-date_end" style="display: none;">
<div class="filter-form-elem-wrap filter-form-elem-wrap_blank filter-permanent-date-end">
<div class="filter-form-lbl"><span>Отключить</span></div>
<div class="filter-form-field">
<div class="filter-form-field-inner">
<input type="text" class="filter-form-field-inp required dropdown" value="никогда" readonly placeholder="action...">
<div class="filter-form-field-dd">
<a href="#" class="filter-form-field-dd-i subscription-date-end" date_end="1"><span class="filter-form-field-val">через месяц</span></a>
<a href="#" class="filter-form-field-dd-i subscription-date-end" date_end="3"><span class="filter-form-field-val">через 3 месяца</span></a>
<a href="#" class="filter-form-field-dd-i subscription-date-end" date_end="6"><span class="filter-form-field-val">через 6 месяцев</span></a>
<a href="#" class="filter-form-field-dd-i subscription-date-end" date_end="12"><span class="filter-form-field-val">через год</span></a>
<a href="#" class="filter-form-field-dd-i subscription-date-end" date_end="0"><span class="filter-form-field-val">никогда</span></a>
</div>
<input type="hidden" name="date-from" id="date-from" value="15 Апр 2015">
<input type="hidden" name="date-to" id="date-to" value="15 Июл 2015">
</div>
</div>
</div>
</div>
</div>
<div class="filter-form-cell save-subscription-no-captcha">
<div class="modal-like-main-btn modal-like-main-btn_sbscr" id="save-subscription">
<span>подписаться на отель</span>
</div>
</div>
</div>
<div class="filter-form-line ls-form-inner-captcha" style="display:none;">
<div class="filter-form-cell" style="width: 50%;">
<div class="filter-form-elem">
<div class="filter-form-elem-wrap filter-form-elem-wrap_blank">
<div class="filter-form-lbl filter-form-lbl_capcha">
<a href="javascript:void(0);" onclick="$('#hotline_subsc_captcha_image').attr('src', getCaptchaSrc());" id="hotline_subsc_captcha_image_reload">
<img src="/img.php?math=1&amp;name=hotline_subsc" id="hotline_subsc_captcha_image" alt="" width="70" height="30">
</a>
</div>
<div class="filter-form-field">
<div class="filter-form-field-inner">
<input type="text" name="captcha_value" id="captcha_value" class="filter-form-field-inp required" placeholder="Введите результат">
</div>
</div>
</div>
</div>
</div>
<div class="filter-form-cell save-subscription-captcha"></div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="modal-like-bottoms">Отписаться от отеля вы всегда можете в <a href="/main/account/hotline">личном кабинете</a> или в любом письме</div>
</div>
<div class="modal-window modal-like overlay-news-popup overlay-news-popup-ok" style="top: -900px;">
<div class="modal-like-top modal-like-top_happiness">
<button class="modal-like-x modal-close overlay-box-close overlay-box-close-ok"></button>
</div>
<div class="modal-like-main">
<div class="modal-like-main-ttl">
<span class="msg-result title1">Подписка сохранена</span>
<span class="msg-result title2">Подписка сохранена ранее</span>
<span class="msg-result title3">Подтвердите подписку</span>
<span class="msg-result title4">Подписка сохранена ранее</span>
</div>
<p class="modal-like-main-p msg-result msg1">Поздравляем, Вы упешно подписались на данный отель</p>
<p class="modal-like-main-p msg-result msg2">Пользователь с указанным вами email уже подписан на данный отель</p>
<p class="modal-like-main-p msg-result msg3">На указанный вами email отправлено письмо для активации подписки</p>
<p class="modal-like-main-p msg-result msg4">Вы уже подписаны на данный отель</p>
<div class="modal-like-main-bot modal-like-main-bot_wide">
<div class="modal-like-main-bot-tab">
<p class="modal-like-main-bot-p"></p>
<div class="modal-like-main-bot-nav">
<p class="modal-like-main-lbl">
Управление подписками в <a href="/main/account/hotline">личном кабинете</a>
</p>
<a href="/main/account/hotline" class="modal-like-main-ok">Мои подписки</a>
</div>
</div>
</div>
</div>
</div>
<div class="modal-window modal-like modal-like_subs overlay-news-popup overlay-news-popup-un" style="top: -900px;">
<div class="modal-like-top modal-like-top_cat">
<button class="modal-like-x modal-like-x_light modal-close overlay-box-close-un"></button>
</div>
<div class="modal-like-main">
<div class="modal-like-main-ttl">
Больше не хотите<br>получать чудесные предложения?
</div>
<div class="modal-like-main-buttons">
<div class="modal-like-main-btn modal-like-main-btn_def" id="save-unsubscribe">Больше не хочу</div>
<div class="modal-like-main-btn modal-like-main-btn_def unsubscribe-cancel active overlay-box-close-un">Ах, оставьте!</div>
</div>
</div>
</div>
<div class="overlay-news-popup overlay-news-popup-err" style="top: -900px;">
<span class="overlay-box-close overlay-box-close-err"></span>
<div class="overlay-subscr-h1 hidden-text-show" data-textshow="Подписка на спецакции и новости отеля"></div>
<div class="ls-form">
<div class="ls-form-inner">
<div class="ls-forms-mid ls-forms-mid-err">
<span class="ls-forms-msg-save-err"></span>
<span class="ls-forms-msg-edit-err" style="display: none;"></span>
</div>
<div class="ls-forms-mid ls-forms-mid-found-subs" style="display: none;"></div>
<div class="ls-forms-mid ls-forms-mid-spam" style="display: none;"></div>
</div>
</div>
</div>
</div>
<!--/noindex-->
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</div>
<div id="div-hotline-substr"></div>
<hr size="10">
</div>
<script type="text/javascript">
/*<![CDATA[*/
var countryId = 32;
/*]]*/
</script>
<table class="grid-tbl">
<tr class="grid-tr">
<td class="grid-td">
<script type="text/javascript">
/*<![CDATA[*/
var allocId = 1035;
/*]]>*/
</script>
<a name="votes"></a>
<div class="reviews">
<div class="titles-h2-wrap">
<h2 class="titles-h2">
Все сообщения гостей
<a style="" class="titles-bubble-close titles-bubble-close-rates titles-bubble-close-rates-active" href="javascript:void(0);" data-t="8"></a>
<span class="page-ttl-00a551 margin-right-15">
— 213
</span>
</h2>
<a class="btn btn_green btn_transparent btn_border btn-middle" href="/main/rate/1035"><span>Добавить отзыв и фото</span></a>
</div>
<div class="reviews-header">
<div class="titles-bubble titles-bubble-close-rates">
<p class="titles-bubble-p">
В этом разделе Вы можете познакомиться со всеми прошедшими модерацию, неудаленными сообщениями пользователей проекта. Каждое сообщение маркировано по названию категории к которому оно относится. Если Вы хотите посмотреть только отзывы или благодарности и претензии, пожалуйста, воспользуйтесь соответствующими разделами.
</p>
<a style="" class="titles-bubble-close titles-bubble-close-rates" href="javascript:void(0);" data-t="8"></a>
</div>
<div class="sorting m15t">
<div class="sorting-ttl">Сортировать</div>
<div class="sorting-i">
<a class="sorting-a
sorting-a_down
" href="?_ss=0&amp;_st=1#votes">
<span class="sorting-a-s">
По дате добавления
</span>
</a>
</div>
<div class="sorting-i">
</div>
<div class="sorting-i">
<a class="sorting-a
" href="?_ss=1&amp;_st=0#votes">
<span class="sorting-a-s">
По времени посещения
</span>
</a>
</div>
<div class="sorting-i">
<a class="sorting-a
" href="?_ss=2&amp;_st=0#votes">
<span class="sorting-a-s">
По полезности
</span>
</a>
</div>
<div class="sorting-i">
<a class="sorting-a
" href="?_ss=3&amp;_st=0#votes">
<span class="sorting-a-s">
По числу просмотров
</span>
</a>
</div>
</div>
</div>
<hr size="10">
<table class="grid-tbl grid-tbl_fix">
<tr class="grid-tr">
<td class="grid-td">
<a name="1147966"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/97667">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="97667">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/97667">
Prizrak7
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 97667, 'userName': '', rateId: 1147966 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Екатеринбург
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
ноябре 2013
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 4
</li>
<li class="hotel-review-rates-i">
Сервис – 4
</li>
<li class="hotel-review-rates-i">
Питание – 4
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1147966" title="Читать отзыв полностью">Запоздалый отзыв отдыха в ноябре 2013</a>
<div class="hotel-review-date">
08 апр 2015 в 09:00
<span class="hotel-review-views" title="число просмотров отзыва">75</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Написал отзыв сразу после отпуска, но не опубликовал тогда, сейчас только нашел и публикую.
Надеюсь многое уже исправили.
понравилось:
номера
территория
свой пляж
русский ресепшн, хороший персонал
завтраки
детская площадка - горка, качели, детская комната с няней, детский бассейн для маленьких
просто к сведению:
выдают не детскую кроватку, а манеж (есть на фото). Он довольно глубокий...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147966&amp;photoId=2401336&amp;fs=1" style="text-decoration: none;" data-photoid="2401336" data-rateid="1147966" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401336_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401336_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147966&amp;photoId=2401335&amp;fs=1" style="text-decoration: none;" data-photoid="2401335" data-rateid="1147966" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401335_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401335_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147966&amp;photoId=2401338&amp;fs=1" style="text-decoration: none;" data-photoid="2401338" data-rateid="1147966" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401338_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401338_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147966&amp;photoId=2401337&amp;fs=1" style="text-decoration: none;" data-photoid="2401337" data-rateid="1147966" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401337_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401337_120x120.JPG">
</noscript>
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1147966">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1147966" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1147966" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1147966" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1147966#comm-area" target="_blank">1 комментарий</a>
<span class="hotel-review-comments-date"> –
4 дня
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="1147895"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/927253">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="927253">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/927253">
Роман
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/927253">
(Roman-4586)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 927253, 'userName': 'Роман', rateId: 1147895 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Новый Уренгой
</div>
<div class="hotel-review-user-type">
<span>
Парой
</span>
в
<span>
апреле 2015
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1147895" title="Читать отзыв полностью">Отличный отель с приветливым персоналом</a>
<div class="hotel-review-date">
07 апр 2015 в 22:19
<span class="hotel-review-views" title="число просмотров отзыва">125</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Здравствуйте, отдыхали с 30 марта по 06 апреля 2015 вдвоем, включены только завтраки. В целом от отеля впечатления очень хорошие. Все сложности были из-за плохого знания английского языка, нами, но основные вопросы получалось решать. И мало информации нашел по ценам в интернете до поездки, в средствах были ограничены и деньги в основном предназначались для еды.
Начну с полета на самолете авиакомп...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147895&amp;photoId=2401061&amp;fs=1" style="text-decoration: none;" data-photoid="2401061" data-rateid="1147895" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401061_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401061_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147895&amp;photoId=2401063&amp;fs=1" style="text-decoration: none;" data-photoid="2401063" data-rateid="1147895" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401063_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401063_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147895&amp;photoId=2401070&amp;fs=1" style="text-decoration: none;" data-photoid="2401070" data-rateid="1147895" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401070_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401070_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1147895&amp;photoId=2401073&amp;fs=1" style="text-decoration: none;" data-photoid="2401073" data-rateid="1147895" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/114/2401073_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/114/2401073_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=1147895">
Ещё<br>12 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1147895">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1147895" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1147895" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1147895" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1147895#comm-area" target="_blank">1 комментарий</a>
<span class="hotel-review-comments-date"> –
4 дня
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/i/25x25infrastr-2.jpg" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/922720" class="hotel-review-username" target="_blank">MariaOG</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Москва, Россия
</div>
<div class="hotel-review-user-type">Парой в июле 2003</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">4,8</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
01 апр 2015 в 11:12
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
2.0
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<a name="1136738"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/907844">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="907844">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/907844">
Елена
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/907844">
(Elena-7161)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 907844, 'userName': 'Елена', rateId: 1136738 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
феврале 2015
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1136738" title="Читать отзыв полностью">Отличный уютный отель</a>
<div class="hotel-review-date">
05 мар 2015 в 22:17
<span class="hotel-review-views" title="число просмотров отзыва">290</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Замечательный отель с хорошими номерами, разнообразным питанием (сладости просто волшебные), внимательным персоналом. Территория не большая, но аккуратная. Есть несколько бассейнов, в том числе и просторный детский, теннисная площадка, свой чистый пляж - 100 м до моря, детская площадка и клуб, несколько ресторанов, спортзал, какие-то магазинчики.
Номера чисто убираются, территория аккуратная, на ...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1136738">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1136738" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1136738" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1136738" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1136738#comm-area" target="_blank">2 комментария</a>
<span class="hotel-review-comments-date"> –
1 месяц
назад
</span>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<hr size="10">
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/icache/user_avatars/312/311479_415946213_100x100.jpg" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/311479" class="hotel-review-username" target="_blank">Ивана Кривцун</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Красноярск, Россия
– <a target="_blank" class="hotel-review-user-from-a" href="http://club.tophotels.ru/users/profile/1625839/reviews">
4
отеля в
3
странах
</a>
</div>
<div class="hotel-review-user-type">С семьей в январе 2012</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">4,9</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
20 ноя 2014 в 20:47
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.9
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.7
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<div class="place_3521">
<!--AdvBroker: баннерное место "Баннерное место на страничке описание отеля и каталоге тх (Спонсорство)" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(3521, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
<hr size="10">
<a name="1082084"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/689388">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="689388">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/689388">
Наталья Николаева
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/689388">
(Natalya18e)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 689388, 'userName': 'Наталья', rateId: 1082084 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Чистополь
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
сентябре 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,2
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5-
</li>
<li class="hotel-review-rates-i">
Питание – 3
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend hotel-review-recommend_not">
Не рекомендует отель.
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1082084" title="Читать отзыв полностью">Отличный сервис, ужасное море</a>
<div class="hotel-review-date">
12 окт 2014 в 00:29
<span class="hotel-review-views" title="число просмотров отзыва">6 657</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Были в отеле с семьёй с 16 по 26 сентября. К самому отлелю претензий никаких - все очень достойно, персонал внимательный, отель ухоженный и красивый, общее впечатление производит прекрасное. Уютно, чисто, красиво. В номере ежедневно убираются, номер у нас был большой, кондиционер работал исправно, вообщем в этом плане все хорошо. Ну да, окна не открываются, бельё за ночь не просыхает, но мы отдава...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1082084">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1082084" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 2</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1082084" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1082084" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1082084#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="1067097"></a>
<div class="reviews-item
hotel-review_mod reviews-item-yellow
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/828490">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="828490">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/828490">
Ирина
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/828490">
(Irina-6080)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 828490, 'userName': 'Ирина', rateId: 1067097 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
</div>
<div class="hotel-review-user-type">
<span>
Парой
</span>
в
<span>
сентябре 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
3,7
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 3
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 3
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1067097" title="Читать отзыв полностью">Качество перестало соответствовать цене</a>
<div class="hotel-review-date">
23 сен 2014 в 15:26
<span class="hotel-review-views" title="число просмотров отзыва">3 626</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Отдыхала в этом отеле в пятый раз. К сожалению могу констатировать что, качество перестало соответствовать цене, и на четыре звезды данный отель уже никак не тянет.
Тип питания: НВ
Сначала про РЕМОНТ.
Значительных неудобств ремонт не доставляет, никакой грязи и строительной пыли в отеле особо не наблюдается.
Положительные моменты:
1.Из-за того что в отеле работают всего два этажа, народу ...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1067097">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1067097" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 2</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1067097" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1067097" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1067097#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/i/25x25infrastr-2.jpg" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/826053" class="hotel-review-username" target="_blank">Любовь</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Москва, Россия
</div>
<div class="hotel-review-user-type">Парой в ноябре 2013</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">5</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
22 сен 2014 в 11:48
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.8
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.9
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<hr size="10">
<a name="1065649"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/676362">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="676362">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/676362">
Роксолана Рутар
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/676362">
(Roksolana-728)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 676362, 'userName': 'Роксолана', rateId: 1065649 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Львов
<a target="_blank" class="hotel-review-user-from-a" href="http://club.tophotels.ru/users/profile/676362/reviews">
4
отеля в
2
странах
</a>
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
январе 2012
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,8
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5-
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1065649" title="Читать отзыв полностью">Досить хороший готель</a>
<div class="hotel-review-date">
22 сен 2014 в 02:26
<span class="hotel-review-views" title="число просмотров отзыва">713</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Готель знаходиться в 15 хвилин їзди на таксі від Дубай. Дуже компактний, не великий але є все що треба - моя сім'я була дуже задоволена - гарний пляж, тенісний корт, спорт зал, дитяча кімната, територія невелика але досить гарна. Нормальне харчування. Якщо нема погоди чи шторм на морі то всі сидять в гарячому басейні та джакузі.
Номера хороші але нема балкону, трохи в тому плані незручно -...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1065649">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1065649" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 1</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1065649" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 1</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1065649" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1065649#comm-area" target="_blank">2 комментария</a>
<span class="hotel-review-comments-date"> –
4 месяца
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="1044225"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/774244">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="774244">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/774244">
Елена
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/774244">
(erasoval)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 774244, 'userName': 'Елена', rateId: 1044225 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
<a target="_blank" class="hotel-review-user-from-a" href="http://club.tophotels.ru/users/profile/774244/reviews">
2
отеля в
2
странах
</a>
</div>
<div class="hotel-review-user-type">
<span>
В одиночку
</span>
в
<span>
декабре 2013
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,3
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 4
</li>
<li class="hotel-review-rates-i">
Сервис – 5-
</li>
<li class="hotel-review-rates-i">
Питание – 5-
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1044225" title="Читать отзыв полностью">Хороший отель</a>
<div class="hotel-review-date">
28 авг 2014 в 17:38
<span class="hotel-review-views" title="число просмотров отзыва">2 617</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Отдыхала одна с 14 по 21 декабря 2013 года 7 дней .
Перелет - Emirates, все отлично как всегда.
Отель на 1-й линии, территория небольшая, но ухоженная и зеленая.
Пляж - хороший вход в море, чисто, всегда есть свободные лежаки, даже если прийти в 11 утра.
Номер - я брала с видом на море, но в этом отеле смысла переплачивать за такой номер нет, фото прилагается. Окна не открываются и балко...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1044225">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1044225" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1044225" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1044225" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1044225#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<div class="place_3521">
<!--AdvBroker: баннерное место "Баннерное место на страничке описание отеля и каталоге тх (Спонсорство)" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(3521, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
<hr size="10">
<a name="1019207"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/761641">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="761641">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/761641">
Юлия Кулешова
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/761641">
(YulijaK)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 761641, 'userName': 'Юлия', rateId: 1019207 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Магнитогорск
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
сентябре 2012
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,3
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 4
</li>
<li class="hotel-review-rates-i">
Питание – 4
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1019207" title="Читать отзыв полностью">Возвращались в отель уже второй раз. Отель походит...</a>
<div class="hotel-review-date">
04 авг 2014 в 19:43
<span class="hotel-review-views" title="число просмотров отзыва">2 651</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Возвращались в отель уже второй раз. Отель походит для отдыха с семьёй, очень уютный, с прекрасным озеленением, хороший пляж, лежаков хватает всем, полотенца выдают. Два хороших бассейна, есть джакузи, правда как-то не пользовались, сидеть с кем-то не очень комфортно. К слову о кухне, не сказала бы,что разнообразна, но голодными никогда не были, не понимаю туристов зацикленных на еде, колорит мест...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1019207">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1019207" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 1</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1019207" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1019207" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1019207#comm-area" target="_blank">2 комментария</a>
<span class="hotel-review-comments-date"> –
1 месяц
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<a name="1011250"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/758999">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="758999">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/758999">
Мария
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/758999">
(Mariya-6648)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 758999, 'userName': 'Мария', rateId: 1011250 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
июне 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1011250" title="Читать отзыв полностью">Замечательно!!!</a>
<div class="hotel-review-date">
28 июл 2014 в 18:20
<span class="hotel-review-views" title="число просмотров отзыва">829</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Ездили папа, мама, и двое детей 3 и 6 лет в период 7 по 14 июня 2014. Отель замечательный, особенно в отношение детей! Говорят там жарко, ничего подобного, там все сделано для людей, да именно для людей, лишний раз ни кто не будет потеть.
Так разница во времени была с Алматой 3 часа, на пляж мы выходили по местному времени 6,30. Вода парное молоко, три часа в море. Далее шли на завтрак, а после ...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1011250">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1011250" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1011250" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1011250" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1011250#comm-area" target="_blank">1 комментарий</a>
<span class="hotel-review-comments-date"> –
8 месяцев
назад
</span>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<hr size="10">
<a name="1009810"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/757408">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="757408">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/757408">
Anton Ganenko
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/757408">
(Anton176)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 757408, 'userName': 'Anton', rateId: 1009810 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Обнинск
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=1009810" title="Читать отзыв полностью">Здравствуйте!
Отзыв пишу в первые.Отдыхали в троем,двое...</a>
<div class="hotel-review-date">
27 июл 2014 в 14:45
<span class="hotel-review-views" title="число просмотров отзыва">2 524</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Здравствуйте!
Отзыв пишу в первые.Отдыхали в троем,двое взрослых и ребенок 4 года с 19 мая по 28 мая этого года.Отель очень понравился.Номер был уютный и чистый,все что нужно было в номере все было.По заезду в номер попросили утюг и гладильную доску,все это принесли быстро(хотя доску гладильную уже пора заменить). Приветливый персонал,любую просьбу решали в миг. Тур покупали на базе завтрака, обе...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1009810&amp;photoId=1903361&amp;fs=1" style="text-decoration: none;" data-photoid="1903361" data-rateid="1009810" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/100/1903361_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/100/1903361_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1009810&amp;photoId=1903362&amp;fs=1" style="text-decoration: none;" data-photoid="1903362" data-rateid="1009810" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/100/1903362_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/100/1903362_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1009810&amp;photoId=1903363&amp;fs=1" style="text-decoration: none;" data-photoid="1903363" data-rateid="1009810" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/100/1903363_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/100/1903363_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=1009810&amp;photoId=1903364&amp;fs=1" style="text-decoration: none;" data-photoid="1903364" data-rateid="1009810" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/100/1903364_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/100/1903364_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=1009810">
Ещё<br>2 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=1009810">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="1009810" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="1009810" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="1009810" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=1009810#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="980130"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/707732">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="707732">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/707732">
Валентина
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/707732">
(Valentina-726)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 707732, 'userName': 'Валентина', rateId: 980130 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Челябинск
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
июле 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
1
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 1
</li>
<li class="hotel-review-rates-i">
Сервис – 1
</li>
<li class="hotel-review-rates-i">
Питание – 1
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend hotel-review-recommend_not">
Не рекомендует отель.
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=980130" title="Читать отзыв полностью">В отеле ремонтные работы!</a>
<div class="hotel-review-date">
01 июл 2014 в 14:12
<span class="hotel-review-views" title="число просмотров отзыва">1 224</span>
<span class="hotel-review-type hotel-review-type_good">
<span class="hotel-review-user-from">
<span style="color: red;">Претензия</span>
</span>
</span>
</div>
<p class="hotel-review-text">
В настоящий момент находимся в отеле! Мои ощущения от отеля - это просто УЖАС! Из- за чего я решилась поехать в этот отель - это из-за детского бассейна с горками для ребенка, он не работает, закрыт на ремонт, море просто ужасно- грязное, они огородили часть своего моря огромными глыбами- камнями и вода застойная, грязная, получается как в бухте, в отеле ведется ремонт, мы в шоке. Почему отель не ...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=980130&amp;photoId=1820268&amp;fs=1" style="text-decoration: none;" data-photoid="1820268" data-rateid="980130" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/980/1820268_120x120.jpeg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/980/1820268_120x120.jpeg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=980130&amp;photoId=1820267&amp;fs=1" style="text-decoration: none;" data-photoid="1820267" data-rateid="980130" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/980/1820267_120x120.jpeg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/980/1820267_120x120.jpeg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=980130&amp;photoId=1820266&amp;fs=1" style="text-decoration: none;" data-photoid="1820266" data-rateid="980130" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/980/1820266_120x120.jpeg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/980/1820266_120x120.jpeg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=980130&amp;photoId=1820270&amp;fs=1" style="text-decoration: none;" data-photoid="1820270" data-rateid="980130" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/980/1820270_120x120.jpeg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/980/1820270_120x120.jpeg">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=980130">
Ещё<br>3 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=980130">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="980130" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="980130" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="980130" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=980130#comm-area" target="_blank">2 комментария</a>
<span class="hotel-review-comments-date"> –
9 месяцев
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="975747"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/136055">
<img height="60px" width="60px" alt="" src="/icache/user_avatars/137/136055_638789566_100x100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="136055">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/136055">
Ольга Убер
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/136055">
(OlgaUber)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 136055, 'userName': 'Ольга', rateId: 975747 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
<a target="_blank" class="hotel-review-user-from-a" href="http://club.tophotels.ru/users/profile/136055/reviews">
57
отелей в
5
странах
</a>
</div>
<div class="hotel-review-user-type">
<span>
С коллегами по работе
</span>
в
<span>
июне 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 4
</li>
<li class="hotel-review-rates-i">
Сервис – 5-
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=975747" title="Читать отзыв полностью">Посетили в рекламном туре</a>
<div class="hotel-review-date">
27 июн 2014 в 14:02
<span class="hotel-review-views" title="число просмотров отзыва">1 872</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Балконов в номерах вообще нетдля меня это минус. Есть номера для курящих, сейф бесплатно. В 2015 году будет реновация номеров.
Депозита-нет
Wifi-бесплатно.
Пляж широкий и много лежаков.
5 ресторанов+ лаундж кафе(работает 24/7) + бар у бассейна
На территории бассейн+ 1 бассейн с горкой.
Трансфер в Дейра сити центр бесплатно.
Бесплатно тренажерный зал.
Есть два теннисных корта, в сезон вечер...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=975747&amp;photoId=1793571&amp;fs=1" style="text-decoration: none;" data-photoid="1793571" data-rateid="975747" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/975/1793571_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/975/1793571_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=975747&amp;photoId=1793572&amp;fs=1" style="text-decoration: none;" data-photoid="1793572" data-rateid="975747" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/975/1793572_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/975/1793572_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=975747&amp;photoId=1793573&amp;fs=1" style="text-decoration: none;" data-photoid="1793573" data-rateid="975747" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/975/1793573_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/975/1793573_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=975747&amp;photoId=1793574&amp;fs=1" style="text-decoration: none;" data-photoid="1793574" data-rateid="975747" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/975/1793574_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/975/1793574_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=975747">
Ещё<br>11 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=975747">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="975747" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 3</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="975747" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="975747" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=975747#comm-area" target="_blank">2 комментария</a>
<span class="hotel-review-comments-date"> –
6 месяцев
назад
</span>
</div>
</div>
</div>
<hr size="10">
<div class="place_3521">
<!--AdvBroker: баннерное место "Баннерное место на страничке описание отеля и каталоге тх (Спонсорство)" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(3521, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/icache/user_avatars/689/688300_630136920_100x100.jpg" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/688300" class="hotel-review-username" target="_blank">Андрей</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Москва, Россия
</div>
<div class="hotel-review-user-type">С друзьями в мае 2011</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">4,1</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
17 июн 2014 в 14:03
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.3
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-yellow">
3.0
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.6
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
3.7
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
1.0
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-yellow">
2.8
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
2.0
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
2.0
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
2.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<hr size="10">
<a name="953350"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/218890">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="218890">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/218890">
OlgaEkaterinburg
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 218890, 'userName': 'OlgaEkaterinburg', rateId: 953350 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Екатеринбург
<a target="_blank" class="hotel-review-user-from-a" href="http://club.tophotels.ru/users/profile/218890/reviews">
3
отеля в
3
странах
</a>
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 4
</li>
<li class="hotel-review-rates-i">
Питание – 5-
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=953350" title="Читать отзыв полностью">Всем привет! Отдыхали в этом отеле с 21 мая по 4 июня 2014 г...</a>
<div class="hotel-review-date">
05 июн 2014 в 20:19
<span class="hotel-review-views" title="число просмотров отзыва">3 281</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Всем привет! Отдыхали в этом отеле с 21 мая по 4 июня 2014 г. семьей (2 взр+1 реб. 4,5 года).
Перелет Air Arabia, время в пути 4ч 45 мин. Аэропорт г. Шарджа. До отеля ехать примерно полчаса. Приехали в отель часов в 10 вечера, отправили на ужин, потом заселили. Номер на 2м этаже. За небольшое вознаграждение дали номер с дополнительной кроватью для ребенка, а вообще рассчитывайте что будете спать ...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=953350&amp;photoId=1716707&amp;fs=1" style="text-decoration: none;" data-photoid="1716707" data-rateid="953350" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/953/1716707_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/953/1716707_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=953350&amp;photoId=1716708&amp;fs=1" style="text-decoration: none;" data-photoid="1716708" data-rateid="953350" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/953/1716708_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/953/1716708_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=953350&amp;photoId=1716709&amp;fs=1" style="text-decoration: none;" data-photoid="1716709" data-rateid="953350" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/953/1716709_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/953/1716709_120x120.JPG">
</noscript>
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=953350">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="953350" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="953350" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="953350" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=953350#comm-area" target="_blank">4 комментария</a>
<span class="hotel-review-comments-date"> –
1 месяц
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="947994"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/159440">
<img height="60px" width="60px" alt="" src="/icache/user_avatars/160/159440_583003605_100x100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="159440">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/159440">
Диляра Калимулина
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/159440">
(dilyar04ka)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 159440, 'userName': 'Диляра', rateId: 947994 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Алматы
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
5
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=947994" title="Читать отзыв полностью">Замечательный отель! Останавливаемся там уже второй раз...</a>
<div class="hotel-review-date">
30 мая 2014 в 19:38
<span class="hotel-review-views" title="число просмотров отзыва">804</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Замечательный отель! Останавливаемся там уже второй раз и все нам нравится! В этот раз с нами был ребенок (1,9), еды для ребенка полно, с утра каша, на обед или ужин то мясо, то рыба, то суп, то гарнир. Короче ребенок голодным не был). Персонал очень дружелюбный, особенно по отношению к детям. Каждый проходит мимо и поздоровается и улыбнется ребенку. Это мне очень понравилось. Единственный минус -...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=947994&amp;photoId=1698527&amp;fs=1" style="text-decoration: none;" data-photoid="1698527" data-rateid="947994" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/947/1698527_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/947/1698527_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=947994&amp;photoId=1698528&amp;fs=1" style="text-decoration: none;" data-photoid="1698528" data-rateid="947994" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/947/1698528_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/947/1698528_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=947994&amp;photoId=1698529&amp;fs=1" style="text-decoration: none;" data-photoid="1698529" data-rateid="947994" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/947/1698529_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/947/1698529_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=947994&amp;photoId=1698530&amp;fs=1" style="text-decoration: none;" data-photoid="1698530" data-rateid="947994" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/947/1698530_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/947/1698530_120x120.jpg">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=947994">
Ещё<br>3 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=947994">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="947994" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="947994" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="947994" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=947994#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="944749"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/660241">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="660241">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/660241">
Елена
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/660241">
(Elena-51100)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 660241, 'userName': 'Елена', rateId: 944749 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Москва
</div>
<div class="hotel-review-user-type">
<span>
Семьей с маленькими детьми
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,7
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5-
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5-
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=944749" title="Читать отзыв полностью">Отдыхали в этом отели семьей , с детьми разного возраста...</a>
<div class="hotel-review-date">
27 мая 2014 в 07:40
<span class="hotel-review-views" title="число просмотров отзыва">1 672</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Отдыхали в этом отели семьей , с детьми разного возраста (17 лет, 9 лет, 1г9м) есть занятия для любого возраста, настольные игры, батут, горки в бассейне, детский клуб. Большая зеленая территория , приятный и доброжелательный персонал, чистые номера, вполне хорошее питание. В целом впечатление об отдыхе в этом отеле не плохое, но не повезло с отдыхающими( буквально за 3 минуты у бассейна пока мыли...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=944749">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="944749" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="944749" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="944749" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=944749#comm-area" target="_blank">1 комментарий</a>
<span class="hotel-review-comments-date"> –
8 месяцев
назад
</span>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/icache/user_avatars/344/343115_628650786_100x100.JPG" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/343115" class="hotel-review-username" target="_blank">Виталик</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Фрайбург, Германия
</div>
<div class="hotel-review-user-type">Парой в августе 2006</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">4,6</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
26 мая 2014 в 16:32
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.9
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.3
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<div class="place_3521">
<!--AdvBroker: баннерное место "Баннерное место на страничке описание отеля и каталоге тх (Спонсорство)" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(3521, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
<hr size="10">
<a name="944166"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="0">
Елена
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 0, 'userName': 'Елена', rateId: 944166 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,8
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5-
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=944166" title="Читать отзыв полностью">Отдыхали в период с 17 мая 2014г</a>
<div class="hotel-review-date">
26 мая 2014 в 14:51
<span class="hotel-review-views" title="число просмотров отзыва">578</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Отдыхаем в ОАЭ пятый раз всегда в разных отелях, этот отель понравился,подходит для семейного отдыха с детьми, большая территория , три бассейна один из них с морской водой, маленький детский бассейн , рядом площадка с горками и качелями и детский клуб.
Общее впечатление хорошее,питание вполне нормальное, в номерах убирают каждый день, белье и полотенце чистые, персонал дружелюбный, из минусов ...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=944166">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="944166" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="944166" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="944166" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=944166#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="942121"></a>
<div class="reviews-item
reviews-item-gray
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/569303">
<img height="60px" width="60px" alt="" src="/icache/user_avatars/570/569303_463269079_100x100.jpeg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="569303">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/569303">
Psevdonik
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 569303, 'userName': 'Psevdonik', rateId: 942121 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Набережные Челны
</div>
<div class="hotel-review-user-type">
<span>
Семьей с детьми
</span>
в
<span>
мае 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,7
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5
</li>
<li class="hotel-review-rates-i">
Питание – 4
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=942121" title="Читать отзыв полностью">Идеальный пляж: достаточное количество лежаков и зонтов...</a>
<div class="hotel-review-date">
23 мая 2014 в 14:11
<span class="hotel-review-views" title="число просмотров отзыва">591</span>
<span class="hotel-review-type hotel-review-type_good">
Благодарность
</span>
</div>
<p class="hotel-review-text">
Идеальный пляж: достаточное количество лежаков и зонтов, деление пляжа на курящую и некурящую зоны, наличие волнорезов, пологий заход в воду, беленький песочек.
Питание посредственное, без изысков.
Хочется выразить огромную благодарность русскоговорящей представительнице на ресепшен за наше размещение, пошла навстречу нашей просьбе, разместила досрочно, даже с видом на море, в связи с плохим са...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=942121&amp;photoId=1677576&amp;fs=1" style="text-decoration: none;" data-photoid="1677576" data-rateid="942121" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/942/1677576_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/942/1677576_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=942121&amp;photoId=1677577&amp;fs=1" style="text-decoration: none;" data-photoid="1677577" data-rateid="942121" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/942/1677577_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/942/1677577_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=942121&amp;photoId=1677578&amp;fs=1" style="text-decoration: none;" data-photoid="1677578" data-rateid="942121" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/942/1677578_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/942/1677578_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=942121&amp;photoId=1677579&amp;fs=1" style="text-decoration: none;" data-photoid="1677579" data-rateid="942121" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/942/1677579_120x120.JPG">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/942/1677579_120x120.JPG">
</noscript>
</a>
<a class="hotel-review-photos-more" href="/main/viewrate/?id=942121">
Ещё<br>20 фото
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=942121">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="942121" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="942121" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="942121" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=942121#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<a name="937244"></a>
<div class="reviews-item
hotel-review_mod reviews-item-yellow
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<a target="_blank" href="http://club.tophotels.ru/users/profile/321294">
<img height="60px" width="60px" alt="" src="/icache/user_avatars/322/321294_324155512_100x100.jpg">
</a>
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="321294">
<a class="hotel-review-username" target="_blank" href="http://club.tophotels.ru/users/profile/321294">
Наталья
</a>
<a target="_blank" class="reviews-item-user-login-link" style="text-decoration: none;" href="http://club.tophotels.ru/users/profile/321294">
(ADIDASKA)
</a>
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 321294, 'userName': 'Наталья', rateId: 937244 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
, Чебоксары
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
апреле 2013
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
3,3
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 2
</li>
<li class="hotel-review-rates-i">
Сервис – 4
</li>
<li class="hotel-review-rates-i">
Питание – 4
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=937244" title="Читать отзыв полностью">Неоднозначное впечатление.</a>
<div class="hotel-review-date">
16 мая 2014 в 22:23
<span class="hotel-review-views" title="число просмотров отзыва">2 251</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Были в этом отеле в апреле прошлого года. Все собиралась написать.... руки, как говориться не доходили. Вот сейчас нашла время, и решила рассказать о нашем отдыхе, т.к считаю, что при выборе отеля очень многие руководствуются именно этим сайтом.
Летели мы семьей: муж, я и двое наших деток. Прилетели поздно вечером, встретили. Оператор Coral. Приехали в отель уставшие, голодные... нас отправили п...
</p>
<div class="hotel-review-photos opinion-h-filter-rec-photo">
<a class="hotel-review-photos-i photo_go_fs" href="/main/viewrate/?id=937244&amp;photoId=1661203&amp;fs=1" style="text-decoration: none;" data-photoid="1661203" data-rateid="937244" data-photoscount="" target="_blank" title="Фото туристов отеля ">
<img alt="Фото туристов отеля " src="/i/px.gif" height="80px" width="80px" hspace="0" vspace="0" class="hotel-rate-new-lazy" data-href="/icache/user_photos/937/1661203_120x120.jpg">
<noscript>
<img alt="Фото турагентов отеля " height="80px" width="80px" hspace="0" vspace="0" class="hotel-review-photos-i" src="/icache/user_photos/937/1661203_120x120.jpg">
</noscript>
</a>
</div>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=937244">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="937244" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 1</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="937244" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="937244" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=937244#comm-area" target="_blank">Комментировать</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div align="right">
<div style="position:relative; width:160px; left:170px; top:23px; text-align:left">
<div style="position:absolute; z-index:1; width:160px" class="advbroker_right">
<!--AdvBroker: баннерное место "CT верт отзывы" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(189, "c=tophotels.ru&amp;cnt=1&amp;co=32&amp;btype=ctimage");
/*]]>*/
</script>
<!--/AdvBroker-->
</div>
</div>
</div>
<a name="936495"></a>
<div class="reviews-item
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic">
<img height="60px" width="60px" alt="" src="/i/no_avatar100.jpg">
</div>
<div class="hotel-review-info">
<div class="hotel-review-row reviews-item-user-login" data-userid="0">
Наталья
<a class="hotel-review-pm app-user-message tooltip" href="javascript:void(0);" title="Отправить сообщение" data="{ 'userId': 0, 'userName': 'Наталья', rateId: 936495 }"></a>
</div>
<div class="hotel-review-user-from">
Турист
</div>
<div class="hotel-review-user-type">
<span>
С семьей
</span>
в
<span>
апреле 2014
</span>
</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap">
<span class="hotel-review-rating">
4,8
</span>
</div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">
Размещение – 5
</li>
<li class="hotel-review-rates-i">
Сервис – 5-
</li>
<li class="hotel-review-rates-i">
Питание – 5
</li>
<li class="hotel-review-rates-i">
<span class="hotel-review-recommend">
Рекомендует отель
</span>
</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<a class="hotel-review-ttl" href="/main/viewrate/?id=936495" title="Читать отзыв полностью">Очень долго готовилась к поездке семьей. Детки маленькие...</a>
<div class="hotel-review-date">
15 мая 2014 в 20:14
<span class="hotel-review-views" title="число просмотров отзыва">1 491</span>
<span class="hotel-review-type hotel-review-type_good">
Отзыв
</span>
</div>
<p class="hotel-review-text">
Очень долго готовилась к поездке семьей. Детки маленькие (1,5 года и 3 года), первый раз с ними решили выехать за границу. Отель выбирала по нескольким критериям: близость к морю, наличие зелени, детские бассейны, питание для малышей. В этом отеле все это было! Обычный номер. Убирали каждый день. Но полы не мыли. Мыли с мужем сами. Чаевые оставляли-не помогло. Бы отеле оооочень много русских. Захо...
</p>
<div class="hotel-review-readon">
<a class="hotel-review-readon-a" href="/main/viewrate/?id=936495">
<span>Читать отзыв полностью</span> &#8594;
</a>
</div>
</div>
<div class="hotel-review-bot">
<div class="hotel-review-useful">
<div class="hotel-review-useful-lbl">Полезный отзыв?</div>
<span class="reviews-item-footer-li reviews-item-footer-li_yes">
<a class="hotel-review-isuseful hotel-review-isuseful_1 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-green" href="javascript:void(0);" data-rate="936495" data-useful="1">
<span>Да</span>
<span class="reviews-item-footer-num"> 1</span>
</a>
</span>
<span class="reviews-item-footer-li reviews-item-footer-li_no">
<a class="hotel-review-isuseful hotel-review-isuseful_0 reviews-item-footer-link opinion-h-filter-rec-bot-a opinion-h-filter-rec-bot-a-red" href="javascript:void(0);" data-rate="936495" data-useless="1">
<span>Нет</span>
<span class="reviews-item-footer-num"> 0</span>
</a>
</span>
</div>
<a class="hotel-review-complaint app-complaint-open" data-rate="936495" href="javascript:void(0);">
<span>Пожаловаться</span>
</a>
<div class="hotel-review-comments">
<a class="hotel-review-comments-count" href="/main/viewrate/?id=936495#comm-area" target="_blank">7 комментариев</a>
<span class="hotel-review-comments-date"> –
1 месяц
назад
</span>
</div>
</div>
</div>
<hr size="10">
<div class="user-toolbox m10t">
<a class="user-toolbox-a user-toolbox-question" target="_blank" href="/main/hotel/al1035/consultant/">Задать вопрос отелю</a>
<a class="user-toolbox-a user-toolbox-rating" target="_blank" href="/main/hotel/al1035/services/">Сервисы отеля</a>
<a class="user-toolbox-a user-toolbox-bonus" target="_blank" href="/main/hotel/al1035/bonus">Бонусы в отеле</a>
</div>
<hr size="10">
<div class="hotel-review-i
hotel-review_good
">
<div class="hotel-review-top">
<div class="hotel-review-user">
<div class="hotel-review-user-inner">
<div class="hotel-review-userpic"><a href="#"><img src="/i/25x25infrastr-2.jpg" alt=""></a></div>
<div class="hotel-review-info">
<div class="hotel-review-row">
<a href="http://club.tophotels.ru/users/profile/606607" class="hotel-review-username" target="_blank">Любовь Шевцова</a>
<a href="#" class="hotel-review-pm"></a>
</div>
<div class="hotel-review-user-from">Москва, Россия
</div>
<div class="hotel-review-user-type">Семьей с детьми в мае 2014</div>
</div>
</div>
</div>
<div class="hotel-review-rates">
<div class="hotel-review-rates-inner">
<div class="hotel-review-rating-wrap"><a href="#" class="hotel-review-rating">3,9</a></div>
<ul class="hotel-review-rates-list">
<li class="hotel-review-rates-i">Рейтинг сервисов</li>
</ul>
</div>
</div>
</div>
<div class="hotel-review-mid">
<div class="hotel-review-date">
11 мая 2014 в 22:50
<span class="hotel-review-type hotel-review-type_good">Рейтинг сервисов</span>
</div>
<ul class="hotel-profile-reviews-list">
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
3.8
</th>
<th class="hotel-profile-reviews-td2">Инфраструктура отеля</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Безопасность в отеле</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-yellow">
3.0
</td>
<td class="hotel-profile-reviews-td2">Благоустройство территории</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Рестораны и бары</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Удобная парковка</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.3
</th>
<th class="hotel-profile-reviews-td2">Качество сервисов и обслуживания</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
2.0
</td>
<td class="hotel-profile-reviews-td2">Анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Вежливый и внимательный персонал</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Работа ресепшен</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Скорость и качество интернет соединения(WiFi)</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Номера</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Звукоизоляция в номере</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Качество мебели, сантехники</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Кондиционирование номеров</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Уборка номеров</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-yellow">
3.3
</th>
<th class="hotel-profile-reviews-td2">Пляж</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-yellow">
3.0
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура пляжа</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Комфортное число отдыхающих</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">Удобный вход в море</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
1.0
</td>
<td class="hotel-profile-reviews-td2">Чистота на пляже</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</th>
<th class="hotel-profile-reviews-td2">Подходит для отдыха</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Если нужно только переночевать</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Спокойный</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Тусовочный</td>
</tr>
</tbody>
</table>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-yellow">
2.8
</th>
<th class="hotel-profile-reviews-td2">Сервисы для детей</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-red">
1.0
</td>
<td class="hotel-profile-reviews-td2">Детская анимация</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.5
</td>
<td class="hotel-profile-reviews-td2">Инфраструктура для детей</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-yellow">
3.0
</td>
<td class="hotel-profile-reviews-td2">Питание для детей</td>
</tr>
</tbody>
</table>
</li>
<li>
<table class="hotel-profile-reviews-tbl">
<thead>
<tr>
<th class="hotel-profile-reviews-td1 reviews-rate-green">
4.3
</th>
<th class="hotel-profile-reviews-td2">Удобство расположения</th>
</tr>
</thead>
<tbody id="_1;" style="display: none;">
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-grey">
—
</td>
<td class="hotel-profile-reviews-td2">Где развлечься - ночные клубы, кино, т.д.</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">Кафе, рестораны, магазины</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
4.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к достопримечательностям</td>
</tr>
<tr>
<td class="hotel-profile-reviews-td1 reviews-rate-green">
5.0
</td>
<td class="hotel-profile-reviews-td2">По отношению к пляжу</td>
</tr>
</tbody>
</table>
</li>
</ul>
<div class="hotel-review-readon">
<span class="hotel-review-readon-r"><a class="hotel-review-readon-r-a" href="/main/hotel/al1035/services/">Все оценки сервисов</a> &#8594;</span>
<a onclick="$(this).find('b').toggle();$(this).parent().parent().find('.hotel-profile-reviews-tbl tbody').toggle();return false;" href="#" class="hotel-review-readon-a-dot">
<b style="display: inline;">Подробный вид</b>
<b style="display: none;">Краткий вид</b>
</a>
</div>
</div>
</div>
<hr size="10">
<hr size="10">
<div>
<div class="pagination new_pag" style="display:inline-block;border: 1px solid transparent;margin-left: -1px !important;">
<div class="npwrap">
<span class="prev">
&lt;
предыдущая
</span>
<span class="first">
первая
</span>
</div>
<div class="pages">
<span>1</span>
<a href="?_p=1">2</a>
<a href="?_p=2">3</a>
<a href="?_p=3">4</a>
<a href="?_p=4">5</a>
<a href="?_p=5">6</a>
<a href="?_p=6">7</a>
<a href="?_p=7">8</a>
<a href="?_p=8">9</a>
</div>
<div class="npwrap">
<span class="next">
<a href="?_p=1">следующая</a>
&gt;
</span>
<span class="last">
<a href="?_p=8">последняя (9)</a>
</span>
</div>
</div>
</div>
<!--AdvBroker: баннерное место "Кнопки цен" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(1030, "al=1035");
/*]]>*/
</script>
<!--/AdvBroker-->
</td>
<td class="grid-td-right-pl">
<div class="ls-chooser ls-chooser_2015" id="reviews-side-menu-filter">
<a style="top: 70px;" href="#rfilter" class="ls-chooser-scrolltop-wrap">
<div style="display: none;" class="ls-chooser-scrolltop">настройки поиска</div>
</a>
<div class="ls-chooser-inner">
<div class="ls-chooser-header" id="rfilter">настройки поиска</div>
<div class="ls-chooser-item-group">
<div class="ls-chooser-group-ttl">По категориям</div>
</div>
<div class="ls-chooser-item">
<div class="ls-chooser-item-line">
<div class="ls-chooser-input-label-wrap ls-chooser-input-label-wrap_nobd">
<div class="ls-chooser-dropdown-block ls-chooser-dropdown-block_vis">
<div class="ls-chooser-input-label-wrap ls-chooser-input-label-wrap_nobd">
<div class="ls-chooser-checkbox-group">
<input checked type="radio" id="rates_8" value="8" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rates_8" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Все отзывы и оценки
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input name="rates" type="checkbox" id="rates_0" value="0" class="ls-chooser-radio ls-chooser-radio_redbg ml15">
<label for="rates_0" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Отзывы
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input name="rates" type="checkbox" id="rates_3" value="3" class="ls-chooser-radio ls-chooser-radio_redbg ml15">
<label for="rates_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Благодарности
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input name="rates" type="checkbox" id="rates_2" value="2" class="ls-chooser-radio ls-chooser-radio_redbg ml15">
<label for="rates_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Претензии
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input name="service_vote" type="checkbox" id="service_vote" value="1" class="ls-chooser-radio ls-chooser-radio_redbg ml15">
<label for="service_vote" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Оценка сервисов
</label>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep my_rates_menu_item" style="display: none;"></div>
<div class="ls-chooser-item-line my_rates_menu_item" style="display: none;">
<div class="ls-chooser-input-label-wrap ls-chooser-input-label-wrap_nobd">
<div class="ls-chooser-dropdown-block ls-chooser-dropdown-block_vis">
<div class="ls-chooser-checkbox-group">
<input name="my_reviews" type="checkbox" id="my_reviews" value="1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="my_reviews" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Мои отзывы
</label>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-input-label-wrap ls-chooser-input-label-wrap_nobd">
<div class="ls-chooser-dropdown-block ls-chooser-dropdown-block_vis">
<div class="ls-chooser-checkbox-group">
<input name="rates" type="checkbox" id="rates_6" value="6" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rates_6" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Локальный IP
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input name="rates" type="checkbox" id="rates_5" value="5" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rates_5" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Удаленные
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-group">
<div class="ls-chooser-group-ttl">по времени и рейтингу</div>
</div>
<div class="ls-chooser-item">
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button ls-chooser-dropdown-button_act" href="javascript:void(0)">
Оценки
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="fvote" id="rev_fvote_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fvote_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Только хорошие оценки
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2" type="checkbox" name="fvote" id="rev_fvote_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fvote_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Только плохие оценки
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="3" type="checkbox" name="fvote" id="rev_fvote_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fvote_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Только средние оценки
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button ls-chooser-dropdown-button_act" href="javascript:void(0)">
Рекомендации
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="frecommend" id="rev_frecommend_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_frecommend_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Рекомендуют
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2" type="checkbox" name="frecommend" id="rev_frecommend_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_frecommend_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Воздержались
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="3" type="checkbox" name="frecommend" id="rev_frecommend_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_frecommend_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Не рекомендуют
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button ls-chooser-dropdown-button_act" href="javascript:void(0)">
Тип отдыха
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="8" type="checkbox" name="trcompany" id="rev_trcompany_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trcompany_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Деловой
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="7" type="checkbox" name="trcompany" id="rev_trcompany_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trcompany_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
С детьми
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="5" type="checkbox" name="trcompany" id="rev_trcompany_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trcompany_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
С друзьями
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="6" type="checkbox" name="trcompany" id="rev_trcompany_4" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trcompany_4" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Парой
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="4" type="checkbox" name="trcompany" id="rev_trcompany_5" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trcompany_5" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Семейный
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button ls-chooser-dropdown-button_act" href="javascript:void(0)">
Сезон
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="fseason" id="rev_fseason_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fseason_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Зима
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2" type="checkbox" name="fseason" id="rev_fseason_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fseason_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Весна
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="3" type="checkbox" name="fseason" id="rev_fseason_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fseason_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Лето
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="4" type="checkbox" name="fseason" id="rev_fseason_4" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fseason_4" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Осень
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button ls-chooser-dropdown-button_act" href="javascript:void(0)">
Год посещения
</a>
<div style="display:block;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="2015" type="checkbox" name="yeartime" id="rev_year_2015" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2015" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2015
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2014" type="checkbox" name="yeartime" id="rev_year_2014" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2014" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2014
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2013" type="checkbox" name="yeartime" id="rev_year_2013" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2013" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2013
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2012" type="checkbox" name="yeartime" id="rev_year_2012" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2012" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2012
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2011" type="checkbox" name="yeartime" id="rev_year_2011" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2011" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2011
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2010" type="checkbox" name="yeartime" id="rev_year_2010" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2010" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2010
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2009" type="checkbox" name="yeartime" id="rev_year_2009" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2009" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2009
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2008" type="checkbox" name="yeartime" id="rev_year_2008" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2008" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2008
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2007" type="checkbox" name="yeartime" id="rev_year_2007" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2007" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2007
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2006" type="checkbox" name="yeartime" id="rev_year_2006" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2006" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2006
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2005" type="checkbox" name="yeartime" id="rev_year_2005" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2005" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2005
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2004" type="checkbox" name="yeartime" id="rev_year_2004" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2004" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2004
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2003" type="checkbox" name="yeartime" id="rev_year_2003" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2003" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2003
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2001" type="checkbox" name="yeartime" id="rev_year_2001" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_year_2001" class="ls-chooser-input-label ls-chooser-input-label_redbg">
2001
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button" href="javascript:void(0)">
Месяц
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="trtime" id="rev_trtime_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Январь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="2" type="checkbox" name="trtime" id="rev_trtime_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Февраль
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="3" type="checkbox" name="trtime" id="rev_trtime_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Март
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="4" type="checkbox" name="trtime" id="rev_trtime_4" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_4" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Апрель
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="5" type="checkbox" name="trtime" id="rev_trtime_5" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_5" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Май
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="6" type="checkbox" name="trtime" id="rev_trtime_6" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_6" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Июнь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="7" type="checkbox" name="trtime" id="rev_trtime_7" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_7" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Июль
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="8" type="checkbox" name="trtime" id="rev_trtime_8" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_8" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Август
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="9" type="checkbox" name="trtime" id="rev_trtime_9" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_9" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Сентябрь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="10" type="checkbox" name="trtime" id="rev_trtime_10" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_10" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Октябрь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="11" type="checkbox" name="trtime" id="rev_trtime_11" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_11" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Ноябрь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="12" type="checkbox" name="trtime" id="rev_trtime_12" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_trtime_12" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Декабрь
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-input-label-wrap ls-chooser-input-label-wrap_nobd">
<div class="ls-chooser-dropdown-block ls-chooser-dropdown-block_vis">
<div class="ls-chooser-checkbox-group">
<input name="fphoto" type="checkbox" id="fphoto" value="1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="fphoto" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Только с фото
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-group">
<div class="ls-chooser-group-ttl">Рецензенты</div>
</div>
<div class="ls-chooser-item">
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button" href="javascript:void(0)">
Страна
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="158" type="checkbox" name="usercountry" id="rev_usercountry_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Беларусь
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="149" type="checkbox" name="usercountry" id="rev_usercountry_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Казахстан
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="103" type="checkbox" name="usercountry" id="rev_usercountry_3" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Латвия
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="usercountry" id="rev_usercountry_4" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_4" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Россия
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="83" type="checkbox" name="usercountry" id="rev_usercountry_5" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_5" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Турция
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="114" type="checkbox" name="usercountry" id="rev_usercountry_6" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercountry_6" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Украина
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button" href="javascript:void(0)">
Город
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap user-city-reviews-filter">
<div class="user-city-reviews-filter-158 ls-chooser-group-ttl" style="display: none;">Беларусь</div>
<div class="user-city-reviews-filter-158 ls-chooser-checkbox-group" style="display: none;">
<input value="418" type="checkbox" name="usercity" id="rev_usercity_1" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Минск
</label>
</div>
<div class="user-city-reviews-filter-149 ls-chooser-group-ttl" style="display: none;">Казахстан</div>
<div class="user-city-reviews-filter-149 ls-chooser-checkbox-group" style="display: none;">
<input value="6850" type="checkbox" name="usercity" id="rev_usercity_2" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Алматы
</label>
</div>
<div class="user-city-reviews-filter-149 ls-chooser-checkbox-group" style="display: none;">
<input value="7249" type="checkbox" name="usercity" id="rev_usercity_3" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_3" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Караганда
</label>
</div>
<div class="user-city-reviews-filter-149 ls-chooser-checkbox-group" style="display: none;">
<input value="7256" type="checkbox" name="usercity" id="rev_usercity_4" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_4" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Рудный
</label>
</div>
<div class="user-city-reviews-filter-103 ls-chooser-group-ttl" style="display: none;">Латвия</div>
<div class="user-city-reviews-filter-103 ls-chooser-checkbox-group" style="display: none;">
<input value="740" type="checkbox" name="usercity" id="rev_usercity_5" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_5" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Рига
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-group-ttl" style="display: none;">Россия</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="60" type="checkbox" name="usercity" id="rev_usercity_6" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_6" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Бузулук
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="84" type="checkbox" name="usercity" id="rev_usercity_7" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_7" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Воронеж
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="109" type="checkbox" name="usercity" id="rev_usercity_8" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_8" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Екатеринбург
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="6995" type="checkbox" name="usercity" id="rev_usercity_9" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_9" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Железногорск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="138" type="checkbox" name="usercity" id="rev_usercity_10" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_10" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Казань
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="142" type="checkbox" name="usercity" id="rev_usercity_11" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_11" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Калуга
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="145" type="checkbox" name="usercity" id="rev_usercity_12" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_12" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Каменск-Уральский
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="176" type="checkbox" name="usercity" id="rev_usercity_13" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_13" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Красноярск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="181" type="checkbox" name="usercity" id="rev_usercity_14" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_14" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Курган
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="186" type="checkbox" name="usercity" id="rev_usercity_15" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_15" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Липецк
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="196" type="checkbox" name="usercity" id="rev_usercity_16" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_16" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Магнитогорск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="212" type="checkbox" name="usercity" id="rev_usercity_17" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_17" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Москва
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="218" type="checkbox" name="usercity" id="rev_usercity_18" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_18" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Набережные Челны
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="236" type="checkbox" name="usercity" id="rev_usercity_19" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_19" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Новосибирск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="6864" type="checkbox" name="usercity" id="rev_usercity_20" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_20" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Новый Уренгой
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="246" type="checkbox" name="usercity" id="rev_usercity_21" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_21" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Обнинск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="251" type="checkbox" name="usercity" id="rev_usercity_22" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_22" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Оренбург
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="261" type="checkbox" name="usercity" id="rev_usercity_23" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_23" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Пермь
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="290" type="checkbox" name="usercity" id="rev_usercity_24" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_24" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Салехард
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="6846" type="checkbox" name="usercity" id="rev_usercity_25" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_25" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Самара
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="294" type="checkbox" name="usercity" id="rev_usercity_26" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_26" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Санкт-Петербург
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="338" type="checkbox" name="usercity" id="rev_usercity_27" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_27" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Тамбов
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="353" type="checkbox" name="usercity" id="rev_usercity_28" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_28" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Тольятти
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="7207" type="checkbox" name="usercity" id="rev_usercity_29" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_29" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Тосно
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="359" type="checkbox" name="usercity" id="rev_usercity_30" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_30" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Тула
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="362" type="checkbox" name="usercity" id="rev_usercity_31" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_31" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Тюмень
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="367" type="checkbox" name="usercity" id="rev_usercity_32" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_32" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Ульяновск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="374" type="checkbox" name="usercity" id="rev_usercity_33" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_33" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Уфа
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="387" type="checkbox" name="usercity" id="rev_usercity_34" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_34" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Чебоксары
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="388" type="checkbox" name="usercity" id="rev_usercity_35" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_35" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Челябинск
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="7448" type="checkbox" name="usercity" id="rev_usercity_36" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_36" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Чистополь
</label>
</div>
<div class="user-city-reviews-filter-1 ls-chooser-checkbox-group" style="display: none;">
<input value="417" type="checkbox" name="usercity" id="rev_usercity_37" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_37" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Ярославль
</label>
</div>
<div class="user-city-reviews-filter-83 ls-chooser-group-ttl" style="display: none;">Турция</div>
<div class="user-city-reviews-filter-83 ls-chooser-checkbox-group" style="display: none;">
<input value="7343" type="checkbox" name="usercity" id="rev_usercity_38" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_38" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Аланья
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-group-ttl" style="display: none;">Украина</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="1316" type="checkbox" name="usercity" id="rev_usercity_39" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_39" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Днепропетровск
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="1322" type="checkbox" name="usercity" id="rev_usercity_40" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_40" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Донецк
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="120" type="checkbox" name="usercity" id="rev_usercity_41" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_41" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Запорожье
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="429" type="checkbox" name="usercity" id="rev_usercity_42" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_42" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Киев
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="1445" type="checkbox" name="usercity" id="rev_usercity_43" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_43" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Львов
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="1477" type="checkbox" name="usercity" id="rev_usercity_44" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_44" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Надворная
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="1513" type="checkbox" name="usercity" id="rev_usercity_45" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_45" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Одесса
</label>
</div>
<div class="user-city-reviews-filter-114 ls-chooser-checkbox-group" style="display: none;">
<input value="385" type="checkbox" name="usercity" id="rev_usercity_46" class="ml15 ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_usercity_46" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Хмельницкий
</label>
</div>
<div class="ls-chooser-checkbox-group reviews-filter-if-empty">
Выберите страну
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item-line-sep"></div>
<div class="ls-chooser-item-line">
<div class="ls-chooser-dropdown">
<a class="ls-chooser-dropdown-button" href="javascript:void(0)">
Рецензент
</a>
<div style="display: none;" class="ls-chooser-dropdown-block">
<div class="ls-chooser-input-label-wrap">
<div class="ls-chooser-checkbox-group">
<input value="2" type="checkbox" name="fref" id="rev_fref_2" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fref_2" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Туристы
</label>
</div>
<div class="ls-chooser-checkbox-group">
<input value="1" type="checkbox" name="fref" id="rev_fref_1" class="ls-chooser-radio ls-chooser-radio_redbg">
<label for="rev_fref_1" class="ls-chooser-input-label ls-chooser-input-label_redbg">
Турагенты
</label>
</div>
</div>
</div>
</div>
</div>
<div class="ls-chooser-item ls-chooser-item_last">
<a href="/main/hotel/al1035/reviews/" class="ls-chooser-select-reset-all">Cбросить весь фильтр</a>
</div>
</div>
</div>
</div>
</div>
<hr size="10">
<div class="ls-chooser-checkbox-tooltip" style="display: none;" id="reviews-side-menu-filter-tooltip" data-alloc="1035">
<div class="ls-chooser-checkbox-tooltip-line">
Выбрано <span class="ls-chooser-checkbox-tooltip-found"></span>
</div>
<a class="ls-chooser-checkbox-tooltip-btn" href="/main/hotel/al1035/reviews">показать</a>
</div>
<div style="display: none;" id="new-profile-cons">
<script type="text/javascript">/*<![CDATA[*/
var bid;
function setManagerHref(aTargert, aParentElement) {
bid = $("input:hidden[name='bid']", aParentElement).val();
$(aTargert, aParentElement).attr('href', '/main/manager/' + bid + '?co=32&al=1035');
}
function showManagerScroll($item) {
$(document).bind("rtPlacesLoaded", function() {
$(document).unbind("rtPlacesLoaded");
$.depends('app.managerScroll').done(function(){
var $telItem = $("p.tel", $item);
var phonePrefix = $telItem.clone()
.children()
.remove()
.end()
.text(),
phone = $telItem.children().text();
$.app.managerScroll
.option('managerId', $("input:hidden[name='bid']", $item).val())
.option('countryNameAccusative', 'ОАЭ')
.option('managerNameAgency', $('input[name="manager_agency_name"]', $item).val())
.option('managerPhonePrefix', phonePrefix)
.option('managerPhone', phone)
.option('countryProposalTo', 'в')
.show();
});
});
}
function bindManagerCallBack($this) {
var $el = $(".app-managerCallback", $this);
$el.data({
managerId: bid,
managerEmail: $('input[name="mail"]', $this).val(),
managerName: $('input[name="manager_name"]', $this).val(),
managerAgencyName: $('input[name="manager_agency_name"]', $this).val(),
crmId: $('input[name="crm"]', $this).val(),
allocationId: 1035,
managerICQ: $('input[name="icq"]', $this).val(),
countryId: 32
});
$el.unbind().click(function(){
var $this = $(this),
$parent = $this.wrap('<span />').parent();
$this.css("marginLeft", "0px");
$parent.loading({
background: true,
css: {
backgroundPosition: 'left center',
paddingLeft: 20
}
}).show();
$.depends("app.managerCallback").done(function(){
$.app.managerCallback.open($this);
})
.done(function(){
$parent.loading().hide();
})
.fail(function(){
$.app.managerCallback.fail();
$parent.loading().hide();
});
return false;
});
}
function prepareResponse($this) {
if (!$('.vcard', $this)[0]) {
return;
} else {
$this.parent().show();
$.event.trigger({
type: "consultantLoaded"
});
showManagerScroll($this);
}
if (isIE) {
$this.css('display', 'block');
}
if (!$(".metro-list", this)[0]) {
$(".order", this).css("marginTop", "10px");
}
setManagerHref('p.photo a, p.fn a, p.order a', $this);
$("p.order a", $this)
.unbind()
.mousedown(function(){
nl_count_params(1001, 10, 8, 2);
});
bindManagerCallBack($this);
}
/*]]>*/</script>
<script type="text/javascript">/*<![CDATA[*/
ab_place(3684, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;&amp;pt=th_hp_right_many&amp;bt=th_hp_right_many")
.done(function(){
var $this = $(this);
// bindManagerCallBack($this);
$this.find('.consult-final-link')
.prop('href', '/main/'+$.app.system.getLocale()+'/about/foragency/managers').prop('target', '_blank')
.end()
.find('.consult-scrolltop-ttl')
.prop('href', '/main/hotel/al1035/tours/')
.end()
.parent().show();
$.event.trigger({
type: "consultantLoaded"
});
$.observer.notify('right-menu-updated');
})
.fail(function(){
var $this = $(this);
$.get(
Env.links.consultantAgency,
{ co: "32", al: "1035", t: 'hotel_profile_right' },
function(data) {
$this.parent()
.html(data)
.css({"padding": "0", "margin-top": "10px"})
.show();
$.event.trigger({
type: "consultantLoaded"
});
$.observer.notify('right-menu-updated');
}
);
});
/*]]>*/</script>
</div>
<div id="combined_block" data-al="1035"></div>
<script type="text/javascript">
/*<![CDATA[*/
/*]]>*/
</script><div class="side-broker">
<div class="side-broker-in">
<div class="side-broker-head">
<a href="http://hotelsbroker.com" target="_blank" title="Hotelsbroker.com" class="side-broker-logo"></a>
цены на номера<br>в отеле
</div>
<div class="side-broker-price" style="border-top: none;">
</div>
<div class="side-broker-block">
<div class="side-broker-name">Пребывание в отеле (с, по):</div>
<div class="side-broker-field">
<table class="side-broker-tb">
<tbody>
<tr>
<td class="side-broker-date">
<input type="text" class="side-broker-date-input" id="side-broker-date-check-in" value="22.04.15">
</td>
<td class="side-broker-glue">—</td>
<td class="side-broker-date">
<input type="text" class="side-broker-date-input" id="side-broker-date-check-out" value="23.04.15">
</td>
</tr>
</tbody>
</table>
</div>
<div class="side-broker-name">Человек в номере:</div>
<div class="side-broker-field">
<select class="side-broker-select" id="side-broker-select">
<option data-rs="15" data-adults="1" data-age1="0" data-age2="0" value="1" selected>1 взрослый</option>
<option data-rs="18" data-adults="1" data-age1="1" data-age2="0" value="1_1">1 взрослый и 1 ребёнок</option>
<option data-rs="19" data-adults="1" data-age1="1" data-age2="1" value="1_2">1 взрослый и 2 ребёнка</option>
<option data-rs="14" data-adults="2" data-age1="0" data-age2="0" value="2">2 взрослых</option>
<option data-rs="20" data-adults="2" data-age1="1" data-age2="0" value="2_1">2 взрослых и 1 ребёнок</option>
<option data-rs="21" data-adults="2" data-age1="1" data-age2="1" value="2_2">2 взрослых и 2 ребёнка</option>
<option data-rs="23" data-adults="3" data-age1="0" data-age2="0" value="3">3 взрослых</option>
<option data-rs="27" data-adults="3" data-age1="1" data-age2="0" value="3_1">3 взрослых и 1 ребёнок</option>
<option data-rs="31" data-adults="3" data-age1="1" data-age2="1" value="3_2">3 взрослых и 2 ребёнка</option>
<option data-rs="26" data-adults="4" data-age1="0" data-age2="0" value="4">4 взрослых</option>
<option data-rs="32" data-adults="4" data-age1="1" data-age2="0" value="4_1">4 взрослых и 1 ребёнок</option>
<option data-rs="33" data-adults="4" data-age1="1" data-age2="1" value="4_2">4 взрослых и 2 ребёнка</option>
</select>
</div>
</div>
<div class="side-broker-submit">
<a class="side-broker-submit-a" data-hburl="http://hotelsbroker.com" data-allocation="1035" href="javascript:void(0);">Уточнить цену</a>
</div>
<a href="http://hotelsbroker.com" target="_blank" title="Hotelsbroker.com" class="side-broker-btm"><span class="side-broker-btm-in">Hotelsbroker.com</span></a>
<div class="side-broker-clear"></div>
</div>
</div>
<style>
#hotel-right-slide-mini-menu .right-bar-fixed {
width: 180px !important;
width: 180px !important;
}
</style>
<div id="hotel-right-slide-mini-menu">
<div class="right-bar-fixed" style="display: none;">
<div class="hotel-profile-nav">
<ul class="hotel-profile-nav-ul" style=" padding-top: 0px;">
<li class="hotel-profile-nav-li">
<span class="hotel-profile-nav-ttl">Информация об отеле</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/rate/1035" title="" class="hotel-profile-nav-a green" onclick="nl_count_params(1001, 209, 8, 0);">Добавить отзыв или фото</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/" title="" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Описание отеля</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/media" title="" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Фото и видео</a>
<span class="hotel-profile-nav-li-span"> – 444/2</span>
</li>
<li class="hotel-profile-nav-li hotel-profile-nav-li-act">
<span title="" class="hotel-profile-nav-a">Отзывы</span>
<span class="hotel-profile-nav-li-span"> – 197</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/rooms/" title="Номера отеля Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Номера</a>
<span class="hotel-profile-nav-li-span"> – 2</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/infrastructure/" title="Инфраструктура Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Инфраструктура</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/around_hotel" title="Вокруг отеля Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Вокруг отеля</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/services/" title="Рейтинги сервисов отеля Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Рейтинги сервисов</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/rating/" title="Рейтинг пользователей Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Динамика рейтинга</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/travellers/" title="Туристы едут в отель Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Туристы едут в отель</a>
<span class="hotel-profile-nav-li-span"> – 303</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/questions/" title="Вопросы об отеле Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Вопросы об отеле</a>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/contacts/" title="Контакты и представители Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Контакты и представители</a>
</li>
</ul>
<ul class="hotel-profile-nav-ul" style="">
<li class="hotel-profile-nav-li">
<span class="hotel-profile-nav-ttl">Цены и туры</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/tours/" title="Поиск цен" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Поиск цен</a>
</li>
<li class="hotel-profile-nav-li" style="display: none;" id="managers-request-rslide">
<a href="/main/hotel/al1035/tours_express/" title="Отправить заявку на тур в Coral Beach Resort 4*" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Отправить заявку на тур</a>
</li>
<li class="hotel-profile-nav-li" style="display: none;" id="avia-price-rslide">
<a href="javascript:void(0)" title="Авиабилеты" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Авиабилеты<span></span></a>
</li>
</ul>
<ul class="hotel-profile-nav-ul" style="">
<li class="hotel-profile-nav-li">
<span class="hotel-profile-nav-ttl">Бонусы и акции</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/hotline/" title="Спецакции и новости" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Спецакции и новости</a>
<span class="hotel-profile-nav-li-span"> – 18</span>
</li>
<li class="hotel-profile-nav-li">
<a href="/main/hotel/al1035/bonus/" title="Бонусы и комплименты" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Бонусы и комплименты</a>
<span class="hotel-profile-nav-li-span"> – 4</span>
</li>
</ul>
<ul class="hotel-profile-nav-ul" style=" display: none;" id="partner-request-rslide">
<li class="hotel-profile-nav-li">
<span class="hotel-profile-nav-ttl">Партнёры</span>
</li>
<li class="hotel-profile-nav-li" style="display: none;" id="operator-request-rslide">
<a href="/main/hotel/al1035/sale_partners/" title="Туроператоры" class="hotel-profile-nav-a" onclick="nl_count_params(1001, 209, 8, 0);">Туроператоры</a>
</li>
</ul>
</div>
</div>
</div>
<script type="text/javascript">
/*<![CDATA[*/
var _HRSBlockCountry = 32;
/*]]*/
</script>
</td>
</tr>
</table>
</div>
<div class="agent-ear-wrap app-tourSearchRequest-place" style="display: none;">
<div class="agent-ear">
<a title="Помощь в подборе тура" data-target="tour-request2" class="app-tourSearchRequest agent-ear-a show-modal" href="javascript:void(0)" onclick="nl_count_params(1001, 10, 32, 32)">
<span>Помощь</span>
<br>
<span>в подборе</span>
<br>
<span>тура</span>
</a>
</div>
</div>
</td>
</tr>
</table>
</div>
</div>
</td>
</tr>
</table>
</div>
<div class="empty"></div>
</div>
<div id="footer">
<div class="f_in_1">
<div class="wrap">
<table width="100%" class="nav">
<tr>
<td width="40%">
<a href="/main/about/">О проекте</a> |
<a href="/main/ru/about/forall/matter">Правовая информация</a> |
<a href="/main/ru/about/forall/policy">Политика конфиденциальности</a> <br>
<a href="http://mediatravel.ru/area/view/1?" target="_blank">Реклама</a> |
<a href="http://job.tourcentre.ru" target="_blank">Работа в компании</a>
</td>
<td class="center">
<b>
<a href="/main/ru/informers/style/?allocation=1035" id="link-knopka">Получить Информер TopHotels — Get the Informer TopHotels</a>
</b><br>
<a href="http://www.mediatravel.ru" target="_blank" class="grey">Реклама в туризме — (495) 604-44-38</a>
</td>
<td width="20%" class="right">
<a href="javascript:void(0);" class="feedback app-feedback dashed-gray-dark" onclick="nl_count_params(1001, 10, 18, 0);">Связь с администрацией проекта</a>
</td>
</tr>
</table>
</div>
</div>
<div class="f_in_2">
<div>
<div class="wrap">
<div class="copyr">
<table width="100%">
<tr>
<td>
<p class="f11" style="margin: 0 0 0.5em;">© LightSoft Research 2003-2015</p>
<p class="f11" style="margin: 0 0 0.5em;">Все права защищены. Перепечатка, включение информации, содержащейся в рекламных и иных материалах сайта, во всевозможные базы данных для дальнейшего их коммерческого использования, размещение таких материалов в любых СМИ и Интернете допускаются только с письменного разрешения редакции сайта. <br>Предоставляемый сервис является информационным. Администрация сайта не несет ответственности за достоверность и качество информации, предоставляемой посетителями сайта, в том числе турфирмами и отельерами.</p>
</td>
<td width="400">
<div class="footer-we-soc">Мы в соц. сетях</div>
<hr size="1">
<a class="footer-vk" target="_blank" href="http://vk.com/tophotels"></a><hr size="1">
<!--noindex-->
<div class="footer-counter-bl">
<!--LiveInternet counter--><script type="text/javascript">/*<![CDATA[*/
document.write('<img src="http://counter.yadro.ru/hit?r' + escape(document.referrer) + ((typeof(screen)=='undefined')?'':';s'+screen.width+'*'+screen.height+'*'+(screen.colorDepth?screen.colorDepth:screen.pixelDepth)) + ';u' + escape(document.URL) + ';' + Math.random() + '" width="1" height="1" alt="" />')
/*]]>*/</script><!--/LiveInternet--><!--LiveInternet logo--><a href="http://www.liveinternet.ru/click" target="_blank" rel="nofollow"><img src="http://counter.yadro.ru/logo?14.2" border="0" width="88" height="31" alt="" title="LiveInternet: показано число просмотров за 24 часа, посетителей за 24 часа и за сегодня"></a>
<!--/LiveInternet-->
</div>
<div class="footer-counter-bl">
<!-- begin of Top100 logo --><a href="http://top100.rambler.ru/home?id=520185" target="_blank" rel="nofollow"><img src="http://top100-images.rambler.ru/top100/banner-88x31-rambler-gray2.gif" alt="Rambler's Top100" width="88" height="31" border="0"></a>
<!-- end of Top100 logo -->
</div>
<div style="float: right; margin: 10px 0px 0px 5px;">
<!--Rating@Mail.ru COUNTER--><script type="text/javascript" language="JavaScript">/*<![CDATA[*/
d=document;var a='';a+=';r='+escape(d.referrer)
js=10/*]]>*/</script><script type="text/javascript" language="JavaScript1.1">/*<![CDATA[*/
a+=';j='+navigator.javaEnabled()
js=11/*]]>*/</script><script type="text/javascript" language="JavaScript1.2">/*<![CDATA[*/
s=screen;a+=';s='+s.width+'*'+s.height
a+=';d='+(s.colorDepth?s.colorDepth:s.pixelDepth)
js=12/*]]>*/</script><script type="text/javascript" language="JavaScript1.3">/*<![CDATA[*/
js=13/*]]>*/</script><script type="text/javascript" language="JavaScript">/*<![CDATA[*/
d.write('<a href="http://top.mail.ru/jump?from=635248"'+
' target="_blank" rel="nofollow"><img src="http://top.list.ru/counter'+
'?id=635248;t=49;js='+js+a+';rand='+Math.random()+
'" alt="Рейтинг@Mail.ru"'+' border="0" height="31" width="88" /></a>');
/*]]>*/</script><noscript><a target="_blank" href="http://top.mail.ru/jump?from=635248" rel="nofollow"><img src="http://top.list.ru/counter?js=na;id=635248;t=49" border="0" height="31" width="88" alt="Рейтинг@Mail.ru"></a></noscript>
<!--/COUNTER-->
</div>
<div class="footer-counter-bl">
<!-- NetLog --><script type="text/javascript" language="javascript">/*<![CDATA[*/
netlog_js="1.0";
netlog_r=""+Math.random()+"&amp;s=1001&amp;im=19&amp;r="+escape(document.referrer)+"&amp;pg="+
escape(window.location.href + (window.location.search ? '&amp;' : '?&amp;'));
document.cookie="netlog=1; path=/"; netlog_r+="&amp;c="+(document.cookie?"Y":"N");
/*]]>*/</script>
<script type="text/javascript" language="javascript1.1">/*<![CDATA[*/
netlog_js="1.1";netlog_r+="&amp;j="+(navigator.javaEnabled()?"Y":"N")/*]]>*/</script>
<script type="text/javascript" language="javascript1.2">/*<![CDATA[*/
netlog_js="1.2";
netlog_r+="&amp;wh="+screen.width+'x'+screen.height+"&amp;px="+
(((navigator.appName.substring(0,3)=="Mic"))?
screen.colorDepth:screen.pixelDepth)/*]]>*/</script>
<script type="text/javascript" language="javascript1.3">/*<![CDATA[*/
netlog_js="1.3"/*]]>*/</script>
<script type="text/javascript" language="javascript">/*<![CDATA[*/
netlog_r+="&amp;js="+netlog_js;
var tp_id = unescape($.cookie("TP_USER")).split('%|%')[0];
netlog_r+="&tp="+tp_id;
document.write("<a href='http://www.topturizm.ru/?1001' target='_blank' rel='nofollow'><img "+
" src='http://click.topturizm.ru/count.php?"+
netlog_r+"&amp;' border='0' width='88' height='31' alt='TopTurizm' /></a>")/*]]>*/</script>
<noscript><a href="http://www.topturizm.ru/?1001" target="_blank" rel="nofollow"><img src="http://click.topturizm.ru/count.php?s=1001&amp;im=19" border="0" width="88" height="31" alt="TopTurizm"></a></noscript>
<!-- /NetLog -->
<!-- NetLog PG --><script type="text/javascript" language="javascript">/*<![CDATA[*/
netlog_js="1.0";
netlog_r=""+Math.random()+"&amp;s=1001&amp;im=0&amp;r="+escape(document.referrer)+"&amp;pg="+
escape(window.location.href + (window.location.search ? '&amp;' : '?&amp;'));
document.cookie="netlog=1; path=/"; netlog_r+="&amp;c="+(document.cookie?"Y":"N");
/*]]>*/</script>
<script type="text/javascript" language="javascript1.1">/*<![CDATA[*/
netlog_js="1.1";netlog_r+="&amp;j="+(navigator.javaEnabled()?"Y":"N")/*]]>*/</script>
<script type="text/javascript" language="javascript1.2">/*<![CDATA[*/
netlog_js="1.2";
netlog_r+="&amp;wh="+screen.width+'x'+screen.height+"&amp;px="+
(((navigator.appName.substring(0,3)=="Mic"))?
screen.colorDepth:screen.pixelDepth)/*]]>*/</script>
<script type="text/javascript" language="javascript1.3">/*<![CDATA[*/
netlog_js="1.3"/*]]>*/</script>
<script type="text/javascript" language="javascript">/*<![CDATA[*/
netlog_r+="&amp;js="+netlog_js;
document.write("<a href='http://www.topturizm.ru/?1001' target='_blank' rel='nofollow'><img "+
" src='http://newclick.netlog.ru/count.php?"+
netlog_r+"&amp;' border='0' width='1' height='1' alt='TopTurizm' /></a>")/*]]>*/</script>
<noscript><a href="http://www.topturizm.ru/?1001" target="_blank" rel="nofollow"><img src="http://newclick.netlog.ru/count.php?s=1001&amp;im=0" border="0" width="88" height="31" alt="TopTurizm"></a></noscript>
<!-- /NetLog PG -->
</div>
<!--/noindex-->
</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</div>
<!--AdvBroker: баннерное место "Рич-Медиа" -->
<script type="text/javascript">/*<![CDATA[*/
ab_place(211, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;", true);
/*]]>*/</script>
<!--/AdvBroker-->
<!--AdvBroker: баннерное место "Попа типа пользователя" -->
<script type="text/javascript">
/*<![CDATA[*/
ab_place(1020, "&amp;co=32&amp;re=67&amp;al=1035&amp;cat=9&amp;");
/*]]>*/
</script>
<!--/AdvBroker-->
<div id="loaderBlock" style="display:none;"></div>
<script type="text/javascript">/*<![CDATA[*/
jQuery.setResources({"jquery.win":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/jquery\/win-version-124554.js"}});
jQuery.setResources({"jquery.positioning":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/jquery\/positioning-version-70145.js"}});
jQuery.setResources({"app.managerCallback.popup.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/managerCallback\/style-version-115551.css"}});
jQuery.setResources({"app.managerCallback.form.htm":{"type":"ajax","src":"\/js\/app\/managerCallback\/form-version-140857.htm"}});
jQuery.setResources({"app.managerCallback.formdata":{"type":"json","src":"\/actions\/manager_callback_form_data\/"}});
jQuery.setResources({"app.managerCallback":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/managerCallback-version-128246.js","depends":["jquery.win","jquery.positioning","app.managerCallback.popup.css","app.managerCallback.form.htm","app.managerCallback.formdata"],"metadata":{"lang":true}}});
jQuery.setResources({"app.complaint.form.htm":{"type":"ajax","src":"\/js\/app\/complaint\/form-version-205521.htm"}});
jQuery.setResources({"app.complaint.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/complaint\/style-version-90110.css"}});
jQuery.setResources({"app.complaint":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/complaint-version-205521.js","depends":["app.complaint.form.htm","jquery.win","jquery.positioning","app.complaint.style.css"]}});
jQuery.setResources({"app.restoreRequest.form.htm":{"type":"ajax","src":"\/js\/app\/restoreRequest\/form-version-140051.htm"}});
jQuery.setResources({"app.restoreRequest":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/restoreRequest-version-140050.js","depends":["jquery.win","jquery.positioning","app.restoreRequest.form.htm"]}});
jQuery.setResources({"jquery.autocomplete":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/jquery\/autocomplete_updated.pack-version-197372.js"}});
jQuery.setResources({"app.tourSearchRequest":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/tourSearchRequest-version-207934.js","depends":["jquery.win","jquery.positioning","jquery.autocomplete"],"metadata":{"sleep":false,"country":"32","thUserTypeDepends":1}}});
jQuery.setResources({"app.thUserTypeLoader":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/thUserTypeLoader-version-207478.js"}});
jQuery.setResources({"app.thUserTypeSelect.form.htm":{"type":"ajax","src":"\/js\/app\/thUserTypeSelect\/form-version-207478.htm"}});
jQuery.setResources({"app.thUserTypeSelect.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/thUserTypeSelect\/style-version-206735.css"}});
jQuery.setResources({"app.thUserTypeSelect":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/thUserTypeSelect-version-207478.js","depends":["app.thUserTypeLoader","app.thUserTypeSelect.form.htm","app.thUserTypeSelect.style.css"],"metadata":{"allocId":"1035","countryId":"32"}}});
jQuery.setResources({"app.userMessage.css.popup":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/userMessage\/css\/popup-version-126179.css"}});
jQuery.setResources({"app.userMessage.form":{"type":"ajax","src":"\/js\/app\/userMessage\/form-version-157015.htm"}});
jQuery.setResources({"app.userMessage":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/userMessage-version-157005.js","depends":["jquery.win","jquery.positioning","app.userMessage.css.popup"]}});
jQuery.setResources({"app.hotelLikeUsers.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/hotelLikeUsers\/style-version-127232.css"}});
jQuery.setResources({"app.hotelLikeUsers.box.htm":{"type":"ajax","src":"\/js\/app\/hotelLikeUsers\/box-version-131636.htm"}});
jQuery.setResources({"app.hotelLikeUsers.chunk.htm":{"type":"ajax","src":"\/js\/app\/hotelLikeUsers\/chunk-version-131636.htm"}});
jQuery.setResources({"app.hotelLikeUsers":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/hotelLikeUsers-version-203367.js","depends":["jquery.win","jquery.positioning","app.hotelLikeUsers.style.css","app.hotelLikeUsers.box.htm","app.hotelLikeUsers.chunk.htm"],"metadata":{"allocId":"1035","allocTitle":"Coral Beach Resort 4*","fixedText":1}}});
jQuery.setResources({"app.subscribeHotline":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/subscribeHotline-version-182959.js"}});
jQuery.setResources({"app.travellers.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/travellers\/style-version-161609.css"}});
jQuery.setResources({"app.travellers.form.htm":{"type":"ajax","src":"\/js\/app\/travellers\/form-version-202619.htm"}});
jQuery.setResources({"app.travellers":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/travellers-version-208039.js","depends":["jquery.win","jquery.positioning","app.travellers.style.css","app.travellers.form.htm"]}});
jQuery.setResources({"jquery.checkbox":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/jquery\/checkbox-version-70145.js"}});
jQuery.setResources({"app.tophotelsButton.css.popup":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/tophotelsButton\/css\/popup-version-85704.css"}});
jQuery.setResources({"app.tophotelsButton.form":{"type":"ajax","src":"\/js\/app\/tophotelsButton\/form-version-85704.htm"}});
jQuery.setResources({"app.tophotelsButton":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/tophotelsButton-version-85704.js","depends":["jquery.win","jquery.positioning","jquery.checkbox","app.tophotelsButton.css.popup"]}});
jQuery.setResources({"app.agencyInfo.jgmap":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/jgmap-version-139030.js"}});
jQuery.setResources({"app.agencyList.slimbox2":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/script\/agency\/slimbox2-version-51771.js"}});
jQuery.setResources({"app.agencyInfo.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/agencyInfo\/style-version-139725.css"}});
jQuery.setResources({"app.agencyInfo.form.htm":{"type":"ajax","src":"\/js\/app\/agencyInfo\/form-version-139725.htm"}});
jQuery.setResources({"app.agencyInfo":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/agencyInfo-version-142890.js","depends":["app.agencyInfo.jgmap","app.agencyList.slimbox2","jquery.win","jquery.positioning","app.agencyInfo.style.css","app.agencyInfo.form.htm"]}});
jQuery.setResources({"app.expertInfo.popup.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/expertInfo\/popup-version-85704.css"}});
jQuery.setResources({"app.expertInfo.popup.htm":{"type":"ajax","src":"\/js\/app\/expertInfo\/popup-version-71151.htm"}});
jQuery.setResources({"app.expertInfo":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/expertInfo-version-137199.js","depends":["jquery.win","jquery.positioning","app.expertInfo.popup.css","app.expertInfo.popup.htm"],"metadata":{"allocId":1035}}});
jQuery.setResources({"app.compare.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/compare\/style-version-175148.css"}});
jQuery.setResources({"app.compare.about.htm":{"type":"ajax","src":"\/js\/app\/compare\/about-version-68585.htm","depends":["jquery.win","jquery.positioning","app.compare.style.css"]}});
jQuery.setResources({"app.compare":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/compare-version-174332.js","autoload":true,"depends":["jquery.win","app.compare.style.css","jquery.positioning"],"metadata":{"page":"hotel","noInit":false}}});
jQuery.setResources({"app.favorite.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/favorite\/style-version-175148.css"}});
jQuery.setResources({"app.favorite":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/favorite-version-174332.js","autoload":true,"depends":["jquery.win","app.favorite.style.css"],"metadata":{"page":"hotel","noInit":false,"co":"32"}}});
jQuery.setResources({"app.whyreg.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/whyreg\/style-version-85704.css"}});
jQuery.setResources({"app.whyreg.window.htm":{"type":"ajax","src":"\/js\/app\/whyreg\/window-version-85704.htm"}});
jQuery.setResources({"app.whyreg":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/whyreg-version-85704.js","depends":["jquery.win","jquery.positioning","app.whyreg.style.css"]}});
jQuery.setResources({"app.auth.style.css":{"autoload":true,"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/auth\/style-version-114174.css"}});
jQuery.setResources({"app.auth.login.htm":{"type":"ajax","src":"\/js\/app\/auth\/login-version-205888.htm","depends":["jquery.win","jquery.positioning"]}});
jQuery.setResources({"app.auth":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/auth-version-202425.js","loaded":true,"depends":["app.auth.style.css","jquery.positioning"]}});
jQuery.setResources({"app.userBan.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/userBan\/style-version-77402.css"}});
jQuery.setResources({"app.userBan.window.htm":{"type":"ajax","src":"\/js\/app\/userBan\/window-version-150245.htm"}});
jQuery.setResources({"app.userBan":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/userBan-version-150245.js","depends":["jquery.win","jquery.positioning","app.userBan.style.css","app.userBan.window.htm"]}});
jQuery.setResources({"app.registration.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/registration\/style-version-85704.css"}});
jQuery.setResources({"app.registration.request.htm":{"type":"ajax","src":"\/js\/app\/registration\/request-version-139030.htm","depends":["jquery.win","jquery.positioning","app.registration.style.css"]}});
jQuery.setResources({"app.registration":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/registration-version-139030.js","depends":["jquery.win","jquery.positioning"]}});
jQuery.setResources({"app.system":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/system-version-206890.js","loaded":true}});
jQuery.setResources({"app.feedback.form.htm":{"type":"ajax","src":"\/js\/app\/feedback\/form-version-181180.htm"}});
jQuery.setResources({"app.feedback.formdata":{"type":"json","src":"\/actions\/feedback_formdata\/"}});
jQuery.setResources({"app.feedback":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/feedback-version-181180.js","depends":["jquery.win","jquery.positioning","app.feedback.form.htm","app.feedback.formdata"]}});
jQuery.setResources({"app.captchaStatusIp":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/captchaStatusIp-version-198831.js","autoload":true}});
jQuery.setResources({"app.agreementPersonalData.style.css":{"type":"css","src":"http:\/\/css2.gotophotels.ru\/js\/app\/agreementPersonalData\/style-version-77480.css"}});
jQuery.setResources({"app.agreementPersonalData":{"type":"js","src":"http:\/\/js2.gotophotels.ru\/js\/app\/agreementPersonalData-version-128246.js","depends":["jquery.win","jquery.positioning","app.agreementPersonalData.form.htm","app.agreementPersonalData.style.css"]}});
/*]]>*/</script>
<script id="ARJCUyv" type="text/javascript" src="http://js2.gotophotels.ru/static/AXyOYTA.js"></script><script id="BJLTyKN" type="text/javascript" src="http://js2.gotophotels.ru/js/local-version-202565.js" local="/action.php?action=local"></script>
<script type="text/javascript">/*<![CDATA[*/
ab_load_banners();
/*]]>*/</script>
<!-- begin of Top100 code -->
<script id="top100Counter" type="text/javascript" src="http://counter.rambler.ru/top100.jcn?520185"></script>
<noscript><img src="http://counter.rambler.ru/top100.cnt?520185" alt="" width="1" height="1" border="0"></noscript>
<!-- end of Top100 code -->
<!-- AdvBroker -->
<script type="text/javascript" language="javascript">/*<![CDATA[*/
advbroker_js="1.0";
advbroker_r=""+Math.random()+"&s=1001&im=0&r="+escape(document.referrer)+"&pg="+
escape(window.location.href + (window.location.search ? '&' : '?&'));
document.cookie="advbroker=1; path=/"; advbroker_r+="&c="+(document.cookie?"Y":"N");
/*]]>*/
</script>
<script type="text/javascript" language="javascript1.1">
/*<![CDATA[*/
advbroker_js="1.1";advbroker_r+="&j="+(navigator.javaEnabled()?"Y":"N")/*]]>*/
</script>
<script type="text/javascript" language="javascript1.2">/*<![CDATA[*/
advbroker_js="1.2";
advbroker_r+="&wh="+screen.width+'x'+screen.height+"&px="+
((screen.colorDepth?screen.colorDepth:screen.pixelDepth))/*]]>*/</script>
<script type="text/javascript" language="javascript1.3">/*<![CDATA[*/
advbroker_js="1.3"/*]]>*/</script>
<script type="text/javascript" language="javascript">/*<![CDATA[*/
advbroker_r+="&js="+advbroker_js;
var tp_user_id = unescape($.cookie("TP_USER")).split('%|%')[0];
advbroker_r+="&tp="+tp_user_id;
document.write("<a href='http://www.advbroker.ru/?1001' target='_blank' rel='nofollow'><img "+
" src='http://www.advbroker.ru/count.php?"+
advbroker_r+"&' border='0' width='1' height='1' alt='AdvBroker' /></a>")/*]]>*/</script>
<noscript><a href="http://www.advbroker.ru/?1001" target="_blank" rel="nofollow"><img src="http://www.advbroker.ru/count.php?s=1001&amp;im=0" border="0" width="1" height="1" alt="AdvBroker"></a></noscript>
<!-- /AdvBroker -->
</body>
</html><!-- оптимизация произведена LightSoft HtmlEaser, параметр htmleaser=no - просмотр оригинала(http://www.domain.ru/?htmleaser=no) --><!-- ориг: 264,84кб, опт: 260,77кб, соотн: 98,46% -->
