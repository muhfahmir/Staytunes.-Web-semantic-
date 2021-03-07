<%-- 
    Document   : index
    Created on : Jan 15, 2021, 8:07:33 AM
    Author     : Muhamad Fahmi Rahmatullah
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="" name="searchInput">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staytunes.</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="assets/vendor/fontawesome-free/css/all.min.css">
    <!-- MYCSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <!-- navbar -->
    <section class="navbar-app fixed-top">
        <nav class="navbar navbar-expand-lg navbar-dark  ">
            <div class="container justify-content-center align-items-center">
                <a class="navbar-brand brand-text-icon" href="">Staytunes.</a>

                
            </div>
        </nav>
    </section>

    <!-- banner -->
    <section class="banner-app " id="banner-app">
        <div class="container banner__container  w3-animate-right">
            <div class="row">
                <div class="col-lg-5 banner__left col-md-12">
                    <h2 class="visible-xs-block visible-sm-block">hai</h2>
                    <div class="banner__leftBackground w3-hover-sepia">
                        <div class="banner__leftContent">
                            <h1 class="banner__leftContentHeader">Listen What You Need To Enjoy Yourself</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 banner__right col-md-12">
                    <h2>Staytunes.</h2>
                    <h4>Listen What You Need To Enjoy Yourself</h4>
                    <h3 class="mt-3">
                        Let's find artists, songs, and podcasts to get through this long day.</h3>
                    <a href="#hero-app" class="btn banner__button mt-3 page-scroll">
                        Let's Play Music
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- hero -->
    <section class="hero-app" id="hero-app">
        <div class="container hero__container w3-animate-left">
            <div class="hero__info">
                <h2>Staytunes.</h2>
                <h4>
                    Forget Busy Work,<br>
                    Start listen music
                    <!-- Forget Busy Work,<br>
                    Start New Song -->
                </h4>
                <h6>We provide what you need to enjoy your time.<br>It's time to make yourself happy.</h6>
                <a href="#search-app" class="page-scroll">
                    <button class="btn hero__infoButton mt-4" id="heroInfoButton" name="heroInfoButton">
                        Search Music Now
                    </button>
                </a>
            </div>
        </div>
    </section>

    <section class="search-app" id="search-app">
        <div class="container">
            <div class="row">
                <!-- input -->
                <div class="col-md-6 col-12 mx-auto justify-content-center text-center">
                    <!-- Start FORM -->
                    <form action="#search-app" method="POST" >
                        <div class="input-group mb-3">
                            <input type="text" class="form-control search__input"
                                placeholder="Ketikkan genre lagu yang diingikan" name="searchInput">
                            <div class="input-group-append">
                                <button class="btn search__button" type="submit" id="searchButton"
                                    name="searchButton">Search</button>
                            </div>
                        </div>
                    </form>

                </div>
                <!-- end input -->
            </div>

            <!-- table data -->
            <div class="row">
                <div class="col-12 col-md-10 mx-auto text-center justify-content-center my-3">
                    <%@ include file = "hasilpencarian.jsp" %>
                    <!-- END TABLE DATA -->
                </div>
            </div>

        </div>
    </section>

    <!-- footer -->
    <section class="footer-app ">
        <div class="container footer__container">
            <div class="row">
                <div class="col-6 col-md-12 col-sm-6 col-lg-2 footer__brandText">
                    <a href="#banner-app" class="brand-text-icon page-scroll">Staytunes.</a>
                </div>

                <div class="col-6 col-md-4 col-sm-6 col-lg-2">
                    <h6 class="footer__headerText">
                        Perusahaan
                    </h6>
                    <div class="footer__link">
                        <ul>
                            <li><a href="#">Tentang</a></li>
                            <li><a href="#">Pekerjaan</a></li>
                            <li><a href="#">For the record</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-sm-6 col-lg-2">
                    <h6 class="footer__headerText">
                        Komunitas
                    </h6>
                    <div class="footer__link">
                        <ul>
                            <li><a href="#">Untuk Artis</a></li>
                            <li><a href="#">Pengembang</a></li>
                            <li><a href="#">Iklan</a></li>
                            <li><a href="#">Investor</a></li>
                            <li><a href="#">Vendor</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-6 col-md-auto col-sm-6 ">
                    <h6 class="footer__headerText">
                        Tautan Berguna
                    </h6>
                    <div class="footer__link">
                        <ul>
                            <li><a href="#">Dukungan</a></li>
                            <li><a href="#">Pemutar Web</a></li>
                            <li><a href="#">Aplikasi Seluler Gratis</a></li>
                            <li><a href="#">Kilas Balik 2020</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-auto col-md-auto footer__icons col-sm-6">
                    <ul>
                        <li><a href="#"><i class="fab fa-instagram fa-2x"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter fa-2x"></i></a></li>
                        <li><a href="#"><i class="fab fa-facebook-f fa-2x"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row copyright">
                <span>Copyright 2021 ? All rights reserved ? Staytunes.</span>
            </div>
        </div>
    </section>

<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <script src="assets/js/script.js"></script>
</body>

</html>