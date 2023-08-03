<?php
header("Content-Type:text/css");
$color = "#f0f"; 
$secondColor = "#ff8"; 

function checkhexcolor($color){
    return preg_match('/^#[a-f0-9]{6}$/i', $color);
}

if (isset($_GET['color']) AND $_GET['color'] != '') {
    $color = "#" . $_GET['color'];
}

if (!$color OR !checkhexcolor($color)) {
    $color = "#336699";
}

?>

.cmn--btn, .cmn--table thead tr th, .trade--tabs .nav-item .nav-link.active, .faq__item.open .faq__title, .faq__item .faq__title .right__icon::before, .faq__item .faq__title .right__icon::after, div[class*="col"]:nth-child(2) .footer__contact__item, .dashboard__item .dashboard__thumb, .dashboard-dashboard-icon .dashboard-menu li:hover > a,.page-item.active .page-link
{
    background-color: <?php echo $color ?>;

}

.predict-type-item .icon, .feature__item .feature__thumb i, h1 a:hover, h2 a:hover, h3 a:hover, h4 a:hover, h5 a:hover, h6 a:hover, .post__item .post__content .meta__date .meta__item i, .post__item .post__read, .highlow-time-duration li a i, .text--base,.btn--base-outline,.menu li a.active{
    color: <?php echo $color ?>;
}

.post__item .post__content .meta__date {
    border-left: 5px solid <?php echo $color ?>;
}

.btn--base, .badge--base, .bg--base
{
    background-color: <?php echo $color ?> !important;
}

.text--base,.cmn--outline--btn {
    color: <?php echo $color ?> !important;
}

.btn--info, .badge--info, .bg--info,.cmn--outline--btn:hover {
    background-color: <?php echo $color ?> !important;
}



.menu li .submenu li:hover > a,.scrollToTop,.pagination .page-item a.active, .pagination .page-item a:hover, .pagination .page-item span.active, .pagination .page-item span:hover, .scrollToTop{
    background: <?php echo $color ?>;

}

.cmn--btn:hover,.btn--base-outline,.verification-code span,.cmn--outline--btn,.cmn--outline--btn:hover,.page-item.active .page-link,.btn--base-outline{
    border-color:  <?php echo $color ?>;
}

.footer__widget .widget__links li a:hover,.btn--base-outline:hover,.flip-clock-label,.widget__post .widget__post__content span{
    color: <?php echo $color ?> !important;
}
.pagination .page-item.disabled span {
    background: <?php echo $color ?>4d !important;
}
.cmn--form--control:focus{
    border-color: <?php echo $color ?>33
}








