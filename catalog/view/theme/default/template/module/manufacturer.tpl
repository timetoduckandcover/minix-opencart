 
<div id="pws-sidebar">
  <h3 class="epsilon">Brands</h3>
  <ul>
    <?php foreach ($manufacturers as $manufacturer) { ?>
      <li>
        <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
          <a href="<?php echo $manufacturer['href']; ?>" class="list-group-item active"><?php echo $manufacturer['name']; ?></a>
        <?php } else { ?>
          <a href="<?php echo $manufacturer['href']; ?>" class="list-group-item"><?php echo $manufacturer['name']; ?></a>
        <?php } ?>
      </li>
    <?php } ?>
  </ul>
</div>
  
  
  
  <!-- 
 for manufacturer list remove if you want without side navigation
 -->
 
 <!--
  <select onchange="gobrandpage(this.value)" class="form-control">
  	<?php foreach ($manufacturers as $manufacturer) { ?>
    <option value="<?php echo $manufacturer['href']; ?>" <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id){ echo "SELECTED"; } ?> class="list-group-item active"><?php echo $manufacturer['name']; ?></option>
    <?php } ?>
  
  </select>-->
  

<script>
	function gobrandpage(id){
		window.location.href=id;
	}
</script>