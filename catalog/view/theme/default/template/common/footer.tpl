
  </main>
  
  <footer class="global-footer">
    <div class="wrapper padding">
      <div class="row">
        <?php if ($informations) { ?>
        <div class="col-xs-12 col-sm-6 col-md-3">
          <h4 class="epsilon"><?php echo $text_information; ?></h4>
          <ul>
            <?php foreach ($informations as $information) { ?>
              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          </ul>
        </div>
        <?php } ?>
        <div class="col-xs-12 col-sm-6 col-md-3">
          <h4 class="epsilon"><?php echo $text_service; ?></h4>
          <ul>
            <li><a href="/frequently-asked-questions"><?php echo $text_faq; ?></a></li>
            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
          <h4 class="epsilon"><?php echo $text_social; ?></h4>
          <?php include('catalog/view/theme/default/template/partials/social.php');?>
        </div>
       <!--  <div class="col-xs-12 col-sm-6 col-md-3">
          <h4 class="epsilon"><?php echo $text_extra; ?></h4>
          <ul>
            <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
            <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_vip; ?></a></li>
            <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
            <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          </ul>
        </div> -->
        <div class="col-xs-12 col-sm-6 col-md-3">
            <h4 class="epsilon">Join Our Newsletter</h4>
            <div class="footer-newsletter">
              <form action="">
                  <input type="text" placeholder="Your Email Address" />
                  <input type="submit" value="Submit" />
              </form>
            </div>
        </div>

      </div>
      <!-- 
      <p><?php echo $powered; ?></p> -->
    </div>
  </footer>

  <!-- Scripts -->
  <script src="catalog/view/javascript/main.min.js" type="text/javascript"></script>
  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>

</body>
</html>