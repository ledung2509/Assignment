<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.SanPham"%>
<!DOCTYPE html>
<html>
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

                                            <a class="dropdown-item" href="home">Quản lý người dùng</a>
                                            <a class="dropdown-item" href="home">Quản lý sản phẩm</a>

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
                                <a href="home1.jsp"><img src="images/fruit1.png" alt="logo" width="50" height="50"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form action="search" method="post">
                                        <input value="${txtS}" name="txt" placeholder="Tìm kiếm sản phẩm....." type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <form action="search" method="post">
                                        <input name="txt" placeholder="Tìm kiếm sản phẩm....." type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->                             
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
                                    <!-- Shopping Item -->
                                    <!--Danh sách sản phẩm đã được thêm-->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>2 Sản phẩm</span>
                                            <a href="cart.jsp">Xem giỏ hàng</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Ring</a></h4>
                                                <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Necklace</a></h4>
                                                <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Tổng tiền</span>
                                                <span class="total-amount"></span>
                                            </div>
                                            <a href="checkout.jsp" class="btn animate">Thanh toán</a>
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
                                            <li><a href="listproduct">${o.tenTheLoai}</a></li>
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
                                                    <li><a href="#">Cửa hàng<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="viewproduct">Sản phẩm</a></li>
                                                            <li><a href="cart.jsp">Giỏ hàng</a></li>
                                                            <li><a href="checkout.jsp">Thanh toán</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="home">Quản lý người dùng</a></li>
                                                    <li><a href="home">Quản lý sản phẩm</a></li>
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

        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="home">Home<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="listproduct">Shop Grid</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Product Style -->
        <section class="product-area shop-sidebar shop section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="shop-sidebar">
                            <!-- Single Widget -->
                            <div class="single-widget category">
                                <h3 class="title">Thể loại</h3>
                                <ul class="categor-list">
                                    <li><a href="viewproduct">Tất cả</a></li>
                                        <c:forEach items="${listCC}" var="o">
                                        <li><a href="theloai?maTheLoai=${o.maTheLoai}">${o.tenTheLoai}</a></li>
                                        </c:forEach>  
                                </ul>
                            </div>
                            <!--/ End Single Widget -->
                            <!-- Shop By Price -->
                            <!--Theo giá-->
                            <div class="single-widget range">
                                <form>
                                    <h3 class="title">Giá</h3>
                                    <div class="price-filter">
                                        <div class="price-filter-inner">
                                            <div id="slider-range"></div>
                                            <div class="price_slider_amount">
                                                <div class="label-input">
                                                    <span>Khoảng</span><input type="text" id="amount" name="price" placeholder="Add Your Price"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit">Lọc sản phẩm</button>
                                </form>

                            </div>
                            <!--/ End Shop By Price -->
                            <!-- Single Widget -->
                            <div class="single-widget recent-post">
                                <h3 class="title">Recent post</h3>
                                <!-- Single Post -->
                                <div class="single-post first">
                                    <div class="image">
                                        <img src="https://via.placeholder.com/75x75" alt="#">
                                    </div>
                                    <div class="content">
                                        <h5><a href="#">Girls Dress</a></h5>
                                        <p class="price">$99.50</p>
                                        <ul class="reviews">
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li><i class="ti-star"></i></li>
                                            <li><i class="ti-star"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Single Post -->
                                <!-- Single Post -->
                                <div class="single-post first">
                                    <div class="image">
                                        <img src="https://via.placeholder.com/75x75" alt="#">
                                    </div>
                                    <div class="content">
                                        <h5><a href="#">Women Clothings</a></h5>
                                        <p class="price">$99.50</p>
                                        <ul class="reviews">
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li><i class="ti-star"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Single Post -->
                                <!-- Single Post -->
                                <div class="single-post first">
                                    <div class="image">
                                        <img src="https://via.placeholder.com/75x75" alt="#">
                                    </div>
                                    <div class="content">
                                        <h5><a href="#">Man Tshirt</a></h5>
                                        <p class="price">$99.50</p>
                                        <ul class="reviews">
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                            <li class="yellow"><i class="ti-star"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Single Post -->
                            </div>
                            <!--/ End Single Widget -->
                            <!-- Single Widget -->
                            <div class="single-widget category">
                                <h3 class="title">Manufacturers</h3>
                                <ul class="categor-list">
                                    <li><a href="#">Forever</a></li>
                                    <li><a href="#">giordano</a></li>
                                    <li><a href="#">abercrombie</a></li>
                                    <li><a href="#">ecko united</a></li>
                                    <li><a href="#">zara</a></li>
                                </ul>
                            </div>
                            <!--/ End Single Widget -->
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-12">
                        <div class="row">
                            <div class="col-12">
                                <!-- Shop Top -->  
                                <form action="sort" method="post">                             
                                    <div class="shop-top">
                                        <div class="shop-shorter">
                                            <div class="single-shorter">
                                                <label>Sắp xếp :</label>
                                                <select name="op">
                                                    <option value="0"><a href="sort">Tên</a></option>
                                                    <option value="1"><a href="sort">Giá</a></option>
                                                    <option value="2"><a href="sort">Giá lớn nhất</a></option>
                                                    <option value="3"><a href="sort">Giá nhỏ nhất</a></option>
                                                </select>
                                                <script>
                                                    function  change() {
                                                        document.getElementById("frm").submit();
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                    </div>                              
                                </form> 
                                <!--/ End Shop Top -->
                            </div>
                        </div>
                        <div class="row">
                            <p class="text-danger" style="align-items: center">${err}</p>
                            <c:forEach items="${data}" var="o">
                                <div class="col-lg-4 col-md-6 col-12">
                                    <div class="single-product">
                                        <div class="product-img">
                                            <a href="detail?maTraiCay=${o.getMaTraiCay()}">
                                                <img class="default-img" src="${o.getAnh()}" alt="#" style="width:262.5px;height:357.96px">
                                                <img class="hover-img" src="${o.getAnh()}" alt="#" style="width:262.5px;height:357.96px">
                                            </a>
                                            <div class="button-head">
                                                <div class="product-action">
                                                </div>
                                                <div class="product-action-2">
                                                    <a title="Add to cart" href="#">Thêm  vào giỏ hàng</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <h3><a href="detail?maTraiCay=${o.getMaTraiCay()}">${o.getTenTraiCay()}</a></h3>
                                            <div class="product-price">
                                                <span>${o.getGia()}VNĐ</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Product Style 1  -->	

        <!-- Start Shop Newsletter  -->
        <section class="shop-newsletter section">
            <div class="container">
                <div class="inner-top">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2 col-12">
                            <!-- Start Newsletter Inner -->
                            <div class="inner">
                            </div>
                            <!-- End Newsletter Inner -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Newsletter -->
        <!-- Start Footer Area -->
        <footer class="footer">
            <!-- Footer Top -->
            <div class="footer-top section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer about">
                                <div class="logo">
                                    <a href="home"><img src="images/fruit1.png" alt="#" style="width: 50px;height: 50px"></a>
                                </div>
                                <p class="text">Chất lượng trái cây trên thị trường trong thời gian là vấn đề nhức nhối băn khoăn của các ông bố bà mẹ. 
                                    Khi mà hiện nay ở trên thị trường, nguồn gốc cũng như chất lượng của chủng loại hàng này không được kiểm soát chặt chẽ. 
                                    Tuy nhiên đảm bảo nguồn gốc sản phẩm cũng như chất lượng sản phẩm là yêu cầu cực kỳ quan trọng để khách hàng tin dùng và mua sắm.</p>
                                <p class="call">Đặt câu hỏi? Gọi cho chúng tôi 24/7<span><a href="tel:0942043555">0942043555</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Faq</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer links">
                                <h4>Customer Service</h4>
                                <ul>
                                    <li><a href="#">Payment Methods</a></li>
                                    <li><a href="#">Money-back</a></li>
                                    <li><a href="#">Returns</a></li>
                                    <li><a href="#">Shipping</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer social">
                                <h4>Get In Tuch</h4>
                                <!-- Single Widget -->
                                <div class="contact">
                                    <ul>
                                        <li>Đại học FPT.</li>
                                        <li>Thành phố Hà Nội.</li>
                                        <li>info@eshop.com</li>
                                        <li>+032 3456 7890</li>
                                    </ul>
                                </div>
                                <!-- End Single Widget -->
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
                                    <p>Copyright © 2020  -  All Rights Reserved.</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="right">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /End Footer Area -->


        <!-- Jquery -->
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
        <!-- Fancybox JS -->
        <script src="js/facnybox.min.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Ytplayer JS -->
        <script src="js/ytplayer.min.js"></script>
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
    </body>
</html>
