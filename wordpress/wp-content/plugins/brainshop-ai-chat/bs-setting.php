<?php if ( ! defined( 'ABSPATH' ) ) exit; ?>
<div class="wrap reddit_add">
    <h2>BrainShop Settings</h2>     
    <?php     
		if(isset($_POST['submit'])) :
            $this->update_brainshop_settings($_POST);
		endif;		
    ?>
    <form method="post" action="" enctype="multipart/form-data"> 
        <table class="form-table">             
            <tr valign="top">
                <td scope="row" class="col-sm-2"><label for="brain-shop-script">Brainshop Script :</label></td>
                <td class="col-sm-10">                    
                    <textarea class="form-control" name="brainshop_script" id="brain-shop-script" placeholder="Eg:http://brainshop.ai/api/aco.js" rows="3" style="width:70% !important"><?php echo get_option('brain_shop_script'); ?></textarea>
                </td>
            </tr>                  
            <tr>
                <td class="col-sm-2">&nbsp;</td>
                <td class="col-sm-10">
                    <?php wp_nonce_field( 'name_bs_setting', 'bs_script_setting' ); ?>
                    <?php @submit_button(); ?>
                </td>
            </tr>     
        </table>        
    </form>
</div>