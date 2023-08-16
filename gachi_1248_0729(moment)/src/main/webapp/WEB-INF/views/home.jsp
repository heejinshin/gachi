<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>가치(價値)함께</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<style>
@font-face {
    font-family: 'ChosunGs';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGs.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'HakgyoansimGaeulsopungB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimGaeulsopungB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
.gachi{
        font-family: 'ChosunGs';
        width: auto;
        height: auto;
        font-size: 30px;
    }
.gachi2{
        font-size: 30px;
        font-family: 'HakgyoansimGaeulsopungB';
    }
.carousel-item img {
		width: auto;
        height: 600px; /* Or any other fixed height */
        object-fit: cover; /* This will make the images cover the full area, possibly cropping them */
    }
@font-face {
    font-family: 'ChosunGs';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGs.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
    font-size: 30px;
    font-weight: bold;
	box-sizing: border-box;
}
body {
	font-family: 'Montserrat', sans-serif;
	line-height: 1.6;
	margin: 0;
	min-height: 100vh;
}
ul {
  margin: 0;
  padding: 0;
  list-style: none;
}


h2,
h3,
a {
	color: #34495e;
  
}

a {
	text-decoration: none;
  
}



.logo {
  font-family: 'ChosunGs';
	margin: 0;
	font-size: 1.45em;
}

.main-nav {
	margin-top: 5px;

}
.logo a,
.main-nav a {
	padding: 10px 15px;
	text-transform: uppercase;
	text-align: center;
	display: block;
  
}


.main-nav a {
	color: #000000;
	font-size: .99em;
}

.main-nav a:hover {
	color: #eea63a;
}

.main-nav a:hover {
    border-bottom: 5px solid #FF8800A0;
  }


.header {
	padding-top: .5em;
	padding-bottom: .5em;
	border: 1px solid #a2a2a2;
	background-color: #f4f4f4;
	-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}




@media (min-width: 1025px) {
	.header,
	.main-nav {
		display: flex;
	}
	.header {
		flex-direction: column;
		align-items: center;
    	.header{
		width: 100%;
		margin: 0 auto;
		max-width: 1150px;
	}
	}

}

@media (min-width: 1025px) {
	.header {
		flex-direction: row;
		justify-content: space-between;
	}

}
.nav-link {
	margin:0.5;
    font-size: 0.65em;  /* 현재 크기 대비 80%로 줄입니다. */
}	
.container{
	width:100%;
	height:100%
}


</style>
<body>
<%@ include file="navibar.jspf" %>

   <!--::header part start::-->

    <!-- Header part end-->

    <!-- banner part start-->
        <section>
        <div class="container" >
          <div class="row align-items-center justify-content-center">
            <div class="col-lg-10">
              <div class="banner_text text-center">
                <div class="banner_text_iner">
                  <h1 class="gachi">가치(價値)함께</h1>
                  <p class="gachi2">취미활동 혼자하지말고 같이 함께하자!</p>
                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="./img/원피스.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="./img/요리모임.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="./img/파티.jpg" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- banner part start-->

    <!-- booking part start-->
<section class="booking_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="booking_menu">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true">전체</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="outdoor-tab" data-toggle="tab" href="#outdoor" role="tab" aria-controls="outdoor" aria-selected="false">아웃도어</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="sports-tab" data-toggle="tab" href="#sports" role="tab" aria-controls="sports" aria-selected="false">스포츠</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="crafts-tab" data-toggle="tab" href="#crafts" role="tab" aria-controls="crafts" aria-selected="false">공예DIY</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="selfdev-tab" data-toggle="tab" href="#selfdev" role="tab" aria-controls="selfdev" aria-selected="false">자기계발</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="meeting-tab" data-toggle="tab" href="#meeting" role="tab" aria-controls="meeting" aria-selected="false">모임</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="watersports-tab" data-toggle="tab" href="#watersports" role="tab" aria-controls="watersports" aria-selected="false">수상레포츠</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="cooking-tab" data-toggle="tab" href="#cooking" role="tab" aria-controls="cooking" aria-selected="false">요리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="baking-tab" data-toggle="tab" href="#baking" role="tab" aria-controls="baking" aria-selected="false">베이킹</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="fitness-tab" data-toggle="tab" href="#fitness" role="tab" aria-controls="fitness" aria-selected="false">피트니스</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="artculture-tab" data-toggle="tab" href="#artculture" role="tab" aria-controls="artculture" aria-selected="false">문화예술</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="surfing-tab" data-toggle="tab" href="#surfing" role="tab" aria-controls="surfing" aria-selected="false">서핑</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- Header part end-->

    <!--top place start-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>카테고리</h2>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    	<div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">축구모임</a>
			                <p style="font-size:18px">축구 가치하자!!</p>
			                <p>서초구, 축구경기장</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>30명모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_1.jpg" alt="">
			    </div>
			</div> 
                    
                    
                </div>
               
               <div class="col-lg-3 col-md-6">
                    <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    	<div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">헬스모임</a>
			                <p style="font-size:18px">다이어트, 근력강화</p>
			                <p>관악구, 관악헬스장</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>30명모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_10.jpg" alt="">
			    </div>
			</div> 
                    
                    
                </div>
               
                <div class="col-lg-3 col-md-6">
                    
                    <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    <div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">서핑모임</a>
			                <p style="font-size:18px">여름엔 서핑이지~</p>
			                <p>양양, 양양서피비치</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>25명 모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_100.jpg" alt="">
			    </div>
			</div>          
                    
                    
                </div>
                <div class="col-lg-3 col-md-6">
                <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    <div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">독서모임</a>
			                <p style="font-size:18px">하루 한 줄 독서 습관 형성모임</p>
			                <p>강남구, 강남스터디카페</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>10명모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_11.jpg" alt="">
			    </div>
			</div>               
			 </div>
			  <a href="#" class="btn_1 text-cnter">9402개 모임 전체보기</a>
            </div>
        </div>
    </section>
    <!--top place end-->

    <!--::industries start::-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>주간 최고 모임🎊🎊</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    	<div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">축구모임</a>
			                <p style="font-size:18px">축구 가치하자!!</p>
			                <p>서초구, 축구경기장</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>30명모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_121.jpg" alt="">
			    </div>
			</div> 
                    
                    
                </div>
               
                <div class="col-lg-4 col-md-6">
                    
                    <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    <div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">서핑모임</a>
			                <p style="font-size:18px">여름엔 서핑이지~</p>
			                <p>양양, 양양서피비치</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>25명 모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_101.jpg" alt="">
			    </div>
			</div>          
                    
                    
                </div>
                <div class="col-lg-4 col-md-6">
                <div class="card d-flex flex-column" style="height : 20rem; align-items:end; justify-content:between">
			    <div class="single_place d-flex flex-column align-items-center mt-auto">
			        <div class="hover_Text position-absolute top-0 start-0 end-0 bottom-0 d-flex align-items-end justify-content-between">
			            <div class="hover_text_iner">
			                <a href="#" class="place_btn">독서모임</a>
			                <p style="font-size:18px">하루 한 줄 독서 습관 형성모임</p>
			                <p>강남구, 강남스터디카페</p>
			                <div class="place_review">
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <a href="#"><i class="fas fa-star"></i></a>
			                    <span>10명모집</span>
			                </div>
			            </div>
			            <div class="details_icon text-right">
			                <i class="ti-share"></i>
			            </div>
			        </div>
			        <img class="my-auto" src="img/outdoor_123.jpg" alt="">
			    </div>
			</div>               
			 </div>
            </div>
        </div>
    </section>
    <!--::industries end::-->

    <!-- footer part start-->
    <footer class="footer-area">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> gachi. All rights reserved. <i class="ti-heart" aria-hidden="true"></i>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>


</html>