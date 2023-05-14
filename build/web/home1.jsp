<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.KhachHang" %>
<%@page import="Model.SanPham" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Fruit Shop</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Magnific Popup -->
        <link href="css/magnific-popup.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <!-- Fancybox -->
        <link href="css/jquery.fancybox.min.css" rel="stylesheet" type="text/css"/>
        <!-- Themify Icons -->
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css"/>
        <!-- Nice Select CSS -->
        <link href="css/niceselect.css" rel="stylesheet" type="text/css"/>
        <!-- Animate CSS -->
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>
        <!-- Flex Slider CSS -->
        <link href="css/flex-slider.min.css" rel="stylesheet" type="text/css"/>
        <!-- Owl Carousel -->
        <link href="css/owl-carousel.css" rel="stylesheet" type="text/css"/>
        <!-- Slicknav -->
        <link href="css/slicknav.min.css" rel="stylesheet" type="text/css"/>
        <!-- Eshop StyleSheet -->
        <link href="css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css"/>      
    </head>
    <body class="js">
        <!-- Preloader -->
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- End Preloader -->
        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li><i class="ti-headphone-alt"></i>0912156389</li>
                                    <li><i class="ti-email"></i>dunglahe163907@fpt.edu.vn</li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">
                                    <c:if test="${sessionScope.acc == null}">
                                        <li><i class="ti-power-off"></i><a href="login.jsp">Đăng nhập</a></li>
                                        <li><i class="ti-power-off"></i><a href="signin.jsp">Đăng ký</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.acc != null}">
                                        <div class="btn-group dropleft">
                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                ${sessionScope.acc.tenDangNhap}
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i>${sessionScope.acc.hoVaTen}</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="cart.jsp">Đơn hàng của tôi</a>
                                                <a class="dropdown-item" href="#">Thay đổi thông tin</a>
                                                <a class="dropdown-item" href="changepass.jsp">Đổi mật khẩu</a>
                                                <c:if test="${sessionScope.acc.dangKyNhanBangTin==true}">
                                                    <a class="dropdown-item" href="home">Quản lý người dùng</a>
                                                    <a class="dropdown-item" href="home">Quản lý sản phẩm</a>
                                                </c:if>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="dangxuat">Đăng xuất</a>
                                            </div>
                                        </div>
                                    </c:if>       
                                </ul>
                            </div>
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="home"><img src="images/fruit1.png" alt="logo" width="50" height="50"></a>
                            </div>
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                            </div>
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <form action="search" method="post">
                                        <input value="${txtS}" name="txt" placeholder="Tìm kiếm sản phẩm....." type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->                             
                                <div class="sinlge-bar shopping">
                                    <c:set var="size" value="${sessionScope.size}"/>
                                    <a href="#" class="single-icon"><i class="ti-bag"></i><span>${size}</span></a>
                                    <!-- Shopping Item -->
                                    <!--Danh sách sản phẩm đã được thêm-->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span></span>
                                            <a href="cart.jsp">Xem giỏ hàng</a>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="cat-nav-head">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="all-category">
                                    <h3 class="cat-heading"><i class="fa fa-bars" aria-hidden="true"></i>Thể loại</h3>
                                    <ul class="main-category">
                                        <c:forEach items="${listCC}" var="o">
                                            <li><a href="viewproduct">${o.tenTheLoai}</a></li>
                                            </c:forEach>             
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-9 col-12">
                                <div class="menu-area">
                                    <!-- Main Menu -->
                                    <nav class="navbar navbar-expand-lg">
                                        <div class="navbar-collapse">	
                                            <div class="nav-inner">	
                                                <ul class="nav main-menu menu navbar-nav">
                                                    <li class="active"><a href="home">Trang chủ</a></li>

                                                    <li><a href="home">Cửa hàng<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="viewproduct">Sản phẩm</a></li>
                                                            <li><a href="cart.jsp">Giỏ hàng</a></li>
                                                            <li><a href="checkout.jsp">Thanh toán</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->
        <!-- Slider Area -->
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/banner1.jpg" style="width:1519.2px; height:510px" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner2.jpg" style="width:1519.2px; height:510px"  alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner4.jpg" style="width:1519.2px; height:510px" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- End Small Banner -->

        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Mặt hàng phổ biến</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="nav-main">
                                <!-- Tab Nav -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#man" role="tab">Trái Cây</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#women" role="tab">Giỏ quà</a></li>
                                </ul>
                                <!--/ End Tab Nav -->
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <!--Dùng foreach-->
                                            <form name="f" action="buy" method="post">
                                                <c:forEach items="${list}" var="o">
                                                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                        <div class="single-product">
                                                            <div class="product-img">
                                                                <a href="detail?maTraiCay=${o.maTraiCay}">
                                                                    <img class="default-img" src="${o.anh}" alt="#" style="width:262.5px;height:357.96px">
                                                                    <img class="hover-img" src="${o.anh}" alt="#" style="width:262.5px;height:357.96px">
                                                                </a>
                                                                <div class="button-head">
                                                                    <div class="product-action-2">
                                                                        <button onclick="buy(${o.maTraiCay})">Thêm vào giỏ hàng</button>
                                                                        <form method="post" name="f" action="">
                                                                            <input type="number" name="num" value="1">
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="product-content">
                                                                <h3><a href="detail?maTraiCay=${o.maTraiCay}">${o.tenTraiCay}</a></h3>
                                                                <div class="product-price">
                                                                    <span>${o.gia}VNĐ</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>  
                                            </form>
                                        </div>
                                    </div>
                                </div>     
                                <!--Giỏ hàng-->
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade" id="women" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${listD}" var="o">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="#">
                                                                <img class="default-img" src="${o.anh}" alt="#" style="width:262.5px;height:357.96px">
                                                                <img class="hover-img" src="${o.anh}" alt="#" style="width:262.5px;height:357.96px">
                                                            </a>
                                                            <div class="button-head">
                                                                <div class="product-action-2">
                                                                    <a title="Add to cart" href="buy(${o.maTraiCay})">Thêm vào giỏ hàng</a>
                                                                    <form method="post" name="f" action="">
                                                                        <input type="number" name="num" value="1">
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="detail?maTraiCay=${o.maTraiCay}">${o.tenTraiCay}</a></h3>
                                                            <div class="product-price">
                                                                <span>${o.gia}VNĐ</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>  
                                        </div>
                                    </div>
                                </div>
                                <!--/ End Single Tab -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Product Area -->
        <!-- Start Most Popular -->
        <div class="product-area most-popular section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Măt hàng bán chạy nhất</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="owl-carousel popular-slider">
                            <!-- Start Single Product -->
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/dao.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/dao.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <span class="out-of-stock">Hot</span>
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Quả đào</a></h3>
                                    <div class="product-price">
                                        <span class="old">$60.00</span>
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                            <!-- Start Single Product -->
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/gio2.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/gio2.jpg" alt="#" style="width:262.5px;height:357.96px">
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Giỏ quà 02</a></h3>
                                    <div class="product-price">
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                            <!-- Start Single Product -->
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/dautay.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/dautay.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <span class="new">New</span>
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Dâu tây</a></h3>
                                    <div class="product-price">
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/coc.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/coc.jpg" alt="#" style="width:262.5px;height:357.96px">

                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Quả cóc</a></h3>
                                    <div class="product-price">
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/vietquat.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/vietquat.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <span class="new">New</span>
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Việt quất</a></h3>
                                    <div class="product-price">
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                            <!-- Start Single Product -->
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img class="default-img" src="images/quyt.jpg" alt="#" style="width:262.5px;height:357.96px">
                                        <img class="hover-img" src="images/quyt.jpg" alt="#" style="width:262.5px;height:357.96px">
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product-details.html">Quả Quýt</a></h3>
                                    <div class="product-price">
                                        <span>$50.00</span>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Most Popular Area -->

        <!-- Start Shop Home List  -->
        <section class="shop-home-list section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>Giảm giá</h1>
                                </div>
                            </div>
                        </div>
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/gio10.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h4 class="title"><a href="#">Giỏ quà 10</a></h4>
                                        <p class="price with-discount">$59</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/duahau.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Dưa hấu</a></h5>
                                        <p class="price with-discount">$44</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/dualuoi.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Dưa lưới</a></h5>
                                        <p class="price with-discount">$89</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>Được mua nhiều nhất</h1>
                                </div>
                            </div>
                        </div>
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/cam.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Quả cam</a></h5>
                                        <p class="price with-discount">$65</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/buoi.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Quả bưởi</a></h5>
                                        <p class="price with-discount">$33</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/xoaichin.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Quả xoài</a></h5>
                                        <p class="price with-discount">$77</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>Được xem nhiều nhất</h1>
                                </div>
                            </div>
                        </div>
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/gio1.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Giỏ quà 01</a></h5>
                                        <p class="price with-discount">$22</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/dautay.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Dâu tây</a></h5>
                                        <p class="price with-discount">$35</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                        <!-- Start Single List  -->
                        <div class="single-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="list-image overlay">
                                        <img src="images/gio2.jpg" alt="#" style="width:154.26px;height:187.8px">
                                        <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12 no-padding">
                                    <div class="content">
                                        <h5 class="title"><a href="#">Giỏ quà 02</a></h5>
                                        <p class="price with-discount">$99</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Single List  -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Home List  -->
        <!-- Start Cowndown Area -->

        <!-- /End Cowndown Area -->

        <!-- Start Shop Blog  -->

        <!-- End Shop Blog  -->

        <!-- Start Shop Services Area -->
        <section class="shop-services section home">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-rocket"></i>
                            <h4>Free shiping</h4>
                            <p>Orders over $100</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-reload"></i>
                            <h4>Free Return</h4>
                            <p>Within 30 days returns</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-lock"></i>
                            <h4>Sucure Payment</h4>
                            <p>100% secure payment</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-tag"></i>
                            <h4>Best Peice</h4>
                            <p>Guaranteed price</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Services Area -->
        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-8 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="home1.jsp"><img src="images/fruit1.png" alt="#" style="width: 50px;height:50px"></a>
                                </div>
                                <p class="text">Chất lượng trái cây trên thị trường trong thời gian là vấn đề nhức nhối băn khoăn của các ông bố bà mẹ. 
                                    Khi mà hiện nay ở trên thị trường, nguồn gốc cũng như chất lượng của chủng loại hàng này không được kiểm soát chặt chẽ. 
                                    Tuy nhiên đảm bảo nguồn gốc sản phẩm cũng như chất lượng sản phẩm là yêu cầu cực kỳ quan trọng để khách hàng tin dùng và mua sắm.</p>
                                <p class="call">Đặt câu hỏi? Gọi cho chúng tôi<span><a href="tel:0942043555">0942043555</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>

                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer social">
                                <h4>Liên hệ</h4>
                                <!-- Single Widget -->
                                <div class="contact">
                                    <ul>
                                        <li>Đại học FPT</li>
                                        <li>Thành phố Hà Nội</li>
                                        <li>dunglahe163907@fpt.edu.vn</li>
                                        <li>0942043555</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer Top -->
            <div class="copyright">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="left">
                                    <p>Copyright © 2023 -  All Rights Reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /End Footer Area -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/magnific-popup.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Flex Slider JS -->
        <script src="js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
        <script src="js/buy.js" type="text/javascript"></script>
    </body>
</html>
