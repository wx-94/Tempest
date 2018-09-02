<?php
/*
Plugin Name: BrainShop AI Chat
Plugin URI: http://bainshop.ai
Description: This plugin adds BrainShop AI chat to your WordPress.
Version: 1.0 
Author: Acobot LLC
Author URI: http://acobot.com
License: GPL2
*/

// Is ABSPATH defined?
if ( ! defined( 'ABSPATH' ) ) exit;

$pluginfoldername = basename(__DIR__);
$rootpluginfoldername = basename(basename(__DIR__));
define('Brainshop_Name', $pluginfoldername);
define('Plugin_Dir', $rootpluginfoldername);

if(!class_exists('Brainshop_Script'))
{
    class Brainshop_Script  
    {
        /**
         * Construct the plugin object
         */
        public function __construct()
        {
            // register actions
            add_action('admin_init', array(&$this, 'admin_init'));
			add_action('admin_menu', array(&$this, 'add_menu'));
			#Using registered $page handle to hook stylesheet loading      		
       		add_action( 'admin_enqueue_scripts', array(&$this, 'register_plugin_styles' ) );
       		add_action( 'admin_enqueue_scripts', array(&$this, 'register_plugin_scripts' ) );
       		##
       		add_action( 'wp_footer', array(&$this, 'add_brainshop_scripts' ) );     		
		} 

		/**
         * Activate the plugin
        */
        public static function activate()
        {
        	ob_start();
           	update_option('brainshop_version', '1.0' ); // update option in option table           	
			require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        } 
    
        /**
         * Deactivate the plugin
         */     
        public static function deactivate()
        {            
        }

        /*
        * uninstall the plugin
        */
        public static function brainshop_deinstall()
        {        	
        }

        /**
		 * hook into WP's admin_init action hook
		*/
		public function admin_init()
		{		    
		    // Possibly do additional admin_init tasks
		    if(!current_user_can('manage_options'))
		    {
		        wp_die(__('You do not have sufficient permissions to access this page.'));
		    }
		}
		
		/*
		* function to update setting option of the brainshop
		*/
		public function update_brainshop_settings($post)
		{
			$bs_script 	= sanitize_text_field( $post['brainshop_script']);			
			##
			//if($bs_script !=''){
				update_option( 'brain_shop_script', $bs_script);			
				$msg = 'AI Chat settings are saved.';
				$this->message_show($msg);
			/*}else{
				$msg = 'BrainShop Script is wrong.....!';
				$this->error_show($msg);
			}*/			
		}

		/*
		* function call the script in the footer
		*/
		public function add_brainshop_scripts()
		{
			$script = get_option('brain_shop_script');
			if($script !=''){
				echo '<script src="'.$script.'"></script>';
			}
		}

		/**
		 * message show
		*/
		public function message_show($msg){
			echo '<div class="updated"><br>';
			echo '<div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Well done!</strong> '.$msg.'
            </div>';
            echo '</div>';
		}

		/**
		 * message show
		*/
		public function error_show($msg){
			echo '<div class="notice notice-warning"><br>';
			echo '<div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Warning!</strong> '.$msg.'
            </div>';
			echo '</div>';
		}

		/*
		 * add a menu 
		*/     
		public function add_menu()
		{		    
		    add_menu_page('BrainShop', 'BrainShop Settings', 'manage_options', 'brain_shop-options', array(&$this, 'brainshop_importer'));  			
  			add_submenu_page( 'brain_shop-options', 'Brainshop Settings', 'BrainShop Settings', 'manage_options', 'brain_shop-options', array(&$this, 'brainshop_setting')); 			
		} 
		
		/**
		 * Register and enqueue style sheet.
		 */
		public function register_plugin_styles() 
		{
			wp_register_style( 'Brainshop_Script', plugins_url('/css/bp-bulk.css', __FILE__ ) );
			wp_enqueue_style( 'Brainshop_Script' );
		}

		/**
	     * Register and enqueue scripts.
	    */
	    public function register_plugin_scripts() 
	    {	        
	        wp_register_script( 'myscript', plugins_url('/js/bp-bulk.js', __FILE__ ), array(), '1.0.0', false);
	        wp_enqueue_script( 'myscript' );
	        wp_register_script( 'jquery', plugins_url('/js/jquery-2.1.3.min.js', __FILE__ ), array(), '1.0.0', false);
	        wp_enqueue_script( 'jquery' );

	    }

		/**
		 * Menu Callback
		 */     
		public function brainshop_importer()
		{
		    if(!current_user_can('manage_options'))
		    {
		        wp_die(__('You do not have sufficient permissions to access this page.'));
		    }		    
		   
		    // Render the template    		
    		include(sprintf("%s/bs-adds.php", dirname(__FILE__)));    		
		}		

		/*
		* brainshop Setting page
		*/ 
		public function brainshop_setting()
		{
			if(!current_user_can('manage_options'))
		    {
		        wp_die(__('You do not have sufficient permissions to access this page.'));
		    }

		    // Render the template
    		include(sprintf("%s/bs-setting.php", dirname(__FILE__)));
		}

    } // END class Brainshop_Script
}

if(class_exists('Brainshop_Script'))
{
    // Installation and uninstallation hooks
    register_activation_hook(__FILE__, array('Brainshop_Script', 'activate'));
    register_deactivation_hook(__FILE__, array('Brainshop_Script', 'deactivate'));  
    register_uninstall_hook(__FILE__, array('Brainshop_Script', 'brainshop_deinstall'));  

    // instantiate the plugin class
    $Brainshop_Script = new Brainshop_Script();
} 