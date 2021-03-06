<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <?php if ($icon) { ?>
  <link href="<?php echo $icon; ?>" rel="icon" />
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>

  <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">

  <script src="catalog/view/theme/default/javascript/jquery.js"></script>
  <!--<script src="catalog/view/theme/default/javascript/jquery-ui.js"></script>
  <script>
    $(function(){
      console.log(jQuery.ui);
    });
  </script>-->

  <!--<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
  <script src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script>
  <script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>-->

  <?php echo $google_analytics; ?>

</head>

<body class="<?php echo $class; ?>">

  <!-- Register/Login Popup -->
  <?php if (!$logged) { ?>
    <?php include('catalog/view/theme/default/template/partials/register-login-popup.php');?>
  <?php } ?>

  <!-- Refer a friend popup -->
  <?php include('catalog/view/theme/default/template/partials/refer-a-friend-popup.php');?>

  <!-- If user is not logged in, show promo banner -->
  <?php if (!$logged) { ?>
    <div class="header-promo-banner">
      <span>Enjoy 20% off your first order</span>
      <span>Use code: FIRST20</span>
      <a href="javascript:;" class="underline">details</a>
    </div>
  <?php } ?>
  <!-- -->

  <header class="global-header">
     <div class="wrapper">


        <div class="row full hide-small desktop-header">
          <nav class="burger-menu desktop">
          <a href="javascript:;" class="burger">
            <i class="top"></i>
            <i class="middle"></i>
            <i class="bottom"></i>
          </a>
          <ul class="burger-nav desktop">
            <li>
              <a href="/about">About</a>
            </li>
            <li>
              <a href="vip.php">VIP Members</a>
            </li>
            <li>
              <a href="index.php?route=information/contact">Customer Care</a>
            </li>
            <li>
              <a href="index.php?route=account/return/add">Shipping &amp; Returns</a>
            </li>
            <li>
              <a href="page-with-sidebar.php">Fit &amp; Size Guide</a>
            </li>
            <li>
              <a href="page-with-sidebar.php">Gift Cards</a>
            </li>

            <?php if($currency) { 
  
                $selectedCurrency = $_SESSION['currency'];

                if($selectedCurrency == 'USD') {

                  $selectedCurrency = "$" . $selectedCurrency . " | United States";
                };
                if($selectedCurrency == 'GBP') {

                  $selectedCurrency = "£" . $selectedCurrency . " | United Kingdom";
                };
                if($selectedCurrency == 'EUR') {

                  $selectedCurrency = "€" . $selectedCurrency . " | Europe";
                };

              ?>

              <li class="currency-list-item">
                <a href="javascript:;" class="select-currency"><?php echo $selectedCurrency; ?></a>
                <?php echo $currency; ?>
              </li>
              
            <?php } ?>

            <li>
              <a href="index.php?route=information/contact">Contact Us</a>
            </li>
            <li>
              <a href="page-with-sidebar.php">Terms of Use</a>
            </li>
            <li>
              <a href="/privacy-policy">Privacy Policy</a>
            </li>
          </ul>
          </nav>
          
          <nav class="nav-left visible-nav">
            <ul>
              <li class="has-sub-nav">
                <a href="index.php?route=product/allproduct">Shop</a>
                <?php include('catalog/view/theme/default/template/partials/header-sub-nav.php');?>
              </li>
              <li>
                <a href="/about">About</a>
              </li>
              <li>
                <a href="lookbooks.php">Lookbooks</a>
              </li>
            </ul>
          </nav>

          <!-- Header logo -->
          <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>" class="logo">
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-full" />
            </a>
            <?php } else { ?>
            <h2><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h2>
          <?php } ?>

          <nav class="nav-right visible-nav">
            <ul>
              <li>
                <a href="/help">Help</a>
              </li>
              <li>
                <a href="javascript:;" class="raf-link">Get $20</a>
              </li>
              <li>
                <?php if ($logged) : ?>
                  <a href="<?php echo $account; ?>">Account</a> 
                <?php else : ?>
                  <a href="javascript:;" class="sign-in-link">Sign in</a>
                <?php endif;?>
              </li>
              <li class="cart-link">
                <a href="<?php echo $shopping_cart; ?>" class="no-underline"><i class="header-cart-count">0</i></a>
                <?php include('catalog/view/theme/default/template/partials/cart-quickview.php');?>
              </li>
            </ul>
          </nav>
        </div>
  
        <!-- Mobile header -->
        <div class="hide-large mobile-header">
          <nav class="burger-menu mobile">
          <a href="javascript:;" class="burger">
            <i class="top"></i>
            <i class="middle"></i>
            <i class="bottom"></i>
          </a>
          <ul class="burger-nav mobile">
            <li>
              <?php if ($logged) : ?>
                <a href="<?php echo $account; ?>">Account</a> 
              <?php else : ?>
                <a href="javascript:;" class="sign-in-link">Sign in</a>
              <?php endif;?>
            </li>
            <li>
              <a href="javascript:;" class="has-mobile-sub-nav">Shop</a>
              <ul class="mobile-sub-nav">
                <li>
                  <a href="collection.php">New In</a>
                </li>
                <li>
                  <a href="collection.php">Popular</a>
                </li>
                <li>
                  <a href="collection.php">Leggings</a>
                </li>
                <li>
                  <a href="collection.php">Tees</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="collection.php">Collections</a>
            </li>
            <li>
              <a href="javascript:;" class="has-mobile-sub-nav">Brands</a>
              <ul class="mobile-sub-nav">
                <li>
                  <a href="page-with-sidebar.php">Adidas</a>
                </li>
                <li>
                  <a href="page-with-sidebar.php">Nike</a>
                </li>
                <li>
                  <a href="page-with-sidebar.php">Kara</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="page-with-sidebar.php">VIP Membership</a>
            </li>
          </ul>
          </nav>
          <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>" class="logo">
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-full" />
            </a>
            <?php } else { ?>
            <h2><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h2>
          <?php } ?>
          <div class="cart-link">
            <a href="<?php echo $shopping_cart; ?>" class="no-underline"><i class="header-cart-count">0</i></a>
            <?php include('catalog/view/theme/default/template/partials/cart-quickview.php');?>
          </div>
        </div>

        <div class="tagline-mobile hide-large">
          <span>Free Shipping</span>
          <span>|</span>
          <span>Become a VIP</span>
        </div>

     </div>
  </header>
  <!-- end static header -->

<!-- 
  <header>
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          
        </div>
        <div class="col-sm-5"><?php echo $search; ?>
        </div>
        <div class="col-sm-3"><?php echo $cart; ?></div>
      </div>
    </div>
  </header>
  <?php if ($categories) { ?>

  <div class="container">
    <nav id="menu" class="navbar">
      <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
        <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
      </div>
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">

				<li><a href="index.php?route=product/allproduct">All Products</a></li>
			
          <?php foreach ($categories as $category) { ?>
          <?php if ($category['children']) { ?>
          <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
            <div class="dropdown-menu">
              <div class="dropdown-inner">
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <ul class="list-unstyled">
                  <?php foreach ($children as $child) { ?>
                  <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <?php } ?>
              </div>
              <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
          </li>
          <?php } else { ?>
          <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
    </nav>
  </div>
  <?php } ?> -->

  <main class="global-content">
