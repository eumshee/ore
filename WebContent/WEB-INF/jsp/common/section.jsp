<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.hero-items .owl-dots {
	position: absolute;
	left: 48%;
	bottom: -35px;
}

.hero-items .owl-nav button[type=button].owl-next {
    left: auto;
    right: 60px;
    display: inline-block;
}

.hero-items .owl-nav button[type=button] {
    display: inline-block;
    height: 68px;
    width: 68px;
    font-size: 35px;
    border-radius: 50%;
    text-align: center;
    position: absolute;
    left: 60px;
    top: 345px;
    background-color: #fff;
    color: #000;
}
</style>
<script>
$(document).ready(function(){
	$(".hero-items").owlCarousel({
	    loop: true,
	    margin: 0,
	    nav: true,
	    items: 1,
	    dots: true,
	    animateOut: 'fadeOut',
	    animateIn: 'fadeIn',
	    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
	    smartSpeed: 1200,
	    autoplayHoverPause: true,
	    mouseDrag: false,
		autoplay:true,
		autoplayTimeout:5000,
		autoplayHoverPause:true
});
});
</script>

<!-- Hero Slider Begin -->
<section class="hero-slider">
	<div class="hero-items owl-carousel">
		<div class="single-slider-item set-bg"
			data-setbg="${pageContext.request.contextPath }/bootstrap/img/product/21summer.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1>2021</h1>
						<h2>Summer</h2>
						<a href="lookbook.do" class="primary-btn">Lookbook</a>
					</div>
				</div>
			</div>
		</div>
		<div class="single-slider-item set-bg"
			data-setbg="${pageContext.request.contextPath }/bootstrap/img/product/21summer2.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1>2021</h1>
						<h2>Summer</h2>
						<a href="lookbook.do" class="primary-btn">Lookbook</a>
					</div>
				</div>
			</div>
		</div>
		<div class="single-slider-item set-bg"
			data-setbg="${pageContext.request.contextPath }/bootstrap/img/product/21summer3.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1>2021</h1>
						<h2>Summer</h2>
						<a href="lookbook.do" class="primary-btn">Lookbook</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Slider End -->

<!-- Features Section Begin -->
<section class="features-section spad">
	<div class="features-ads" align="center">
		<div class="single-features-ads">
			<h4>For customer care</h4>
			<p>
				Online store<br> <br> hello@ore-clothing.com<br>
				070-7731-9010<br> MON - FRI 13:00-17:00<br>
			</p>
			<h4>For buying & press inquiry</h4>
			<p>info@ore-clothing.com</p>
		</div>
	</div>
</section>
<!-- Features Section End -->