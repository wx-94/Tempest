<?php
/**
 * eCommerce Gem functions and definitions.
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package eCommerce_Gem
 */

if ( ! function_exists( 'ecommerce_gem_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function ecommerce_gem_setup() {
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on eCommerce Gem, use a find and replace
	 * to change 'ecommerce-gem' to the name of your theme in all the template files.
	 */
	load_theme_textdomain( 'ecommerce-gem', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for custom logo.
	 */
	add_theme_support( 'custom-logo' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
	 */
	add_theme_support( 'post-thumbnails' );
	add_image_size('ecommerce-gem-common', 370, 260, true);

	// Register navigation menu locations.
	register_nav_menus( array(
		'top' 		=> esc_html__( 'Top Header', 'ecommerce-gem' ),
		'primary' 	=> esc_html__( 'Primary Header', 'ecommerce-gem' ),
		'social'  	=> esc_html__( 'Social Links', 'ecommerce-gem' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form',
		'comment-form',
		'comment-list',
		'gallery',
		'caption',
	) );

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'ecommerce_gem_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );

	// Add woocommerce support, gallery zoom, lightbox and thumbnail slider.
	add_theme_support( 'woocommerce' );
	add_theme_support( 'wc-product-gallery-lightbox' );
	add_theme_support( 'wc-product-gallery-slider' );

	$gallery_zoom = ecommerce_gem_get_option( 'enable_gallery_zoom' );

	if( 1 == $gallery_zoom ){
		add_theme_support( 'wc-product-gallery-zoom' );
	}
}
endif;
add_action( 'after_setup_theme', 'ecommerce_gem_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function ecommerce_gem_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'ecommerce_gem_content_width', 810 );
}
add_action( 'after_setup_theme', 'ecommerce_gem_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function ecommerce_gem_widgets_init() {

	register_sidebar( array(
		'name'          => esc_html__( 'Blog Sidebar', 'ecommerce-gem' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here to appear in Sidebar.', 'ecommerce-gem' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );

	if( class_exists( 'WooCommerce' ) ){

		register_sidebar( array(
			'name'          => esc_html__( 'Shop Sidebar', 'ecommerce-gem' ),
			'id'            => 'shop-sidebar',
			'description'   => esc_html__( 'Widgets added here will appear in sidebar of shop pages only.', 'ecommerce-gem' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		) );

	}

	register_sidebar( array(
		'name'          => esc_html__( 'Advertisements Below Slider', 'ecommerce-gem' ),
		'id'            => 'advertisement-area',
		'description'   => esc_html__( 'Add widgets here to appear in advertisement area below main slider of home page', 'ecommerce-gem' ),
		'before_widget' => '<div id="%1$s" class="%2$s">',
		'after_widget'  => '</div>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
		'name'          => esc_html__( 'Home Page Widget Area', 'ecommerce-gem' ),
		'id'            => 'home-page-widget-area',
		'description'   => esc_html__( 'Add widgets here to appear in Home Page Widget Area.', 'ecommerce-gem' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s"><div class="container">',
		'after_widget'  => '</div></section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
		'name'          => sprintf( esc_html__( 'Footer %d', 'ecommerce-gem' ), 1 ),
		'id'            => 'footer-1',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
		'name'          => sprintf( esc_html__( 'Footer %d', 'ecommerce-gem' ), 2 ),
		'id'            => 'footer-2',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
		'name'          => sprintf( esc_html__( 'Footer %d', 'ecommerce-gem' ), 3 ),
		'id'            => 'footer-3',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
	register_sidebar( array(
		'name'          => sprintf( esc_html__( 'Footer %d', 'ecommerce-gem' ), 4 ),
		'id'            => 'footer-4',
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'ecommerce_gem_widgets_init' );

/**
* Enqueue scripts and styles.
*/
function ecommerce_gem_scripts() {

	wp_enqueue_style( 'ecommerce-gem-fonts', ecommerce_gem_fonts_url(), array(), null );

	wp_enqueue_style( 'jquery-meanmenu', get_template_directory_uri() . '/assets/third-party/meanmenu/meanmenu.css' );

	wp_enqueue_style( 'jquery-slick', get_template_directory_uri() . '/assets/third-party/slick/slick.css', '', '1.6.0' );

	wp_enqueue_style( 'ecommerce-gem-icons', get_template_directory_uri() . '/assets/third-party/et-line/css/icons.css', '', '1.0.0' );

	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/assets/third-party/font-awesome/css/font-awesome.min.css', '', '4.7.0' );

	wp_enqueue_style( 'ecommerce-gem-style', get_stylesheet_uri() );

	wp_enqueue_script( 'ecommerce-gem-navigation', get_template_directory_uri() . '/assets/js/navigation.js', array(), '20151215', true );

	wp_enqueue_script( 'ecommerce-gem-skip-link-focus-fix', get_template_directory_uri() . '/assets/js/skip-link-focus-fix.js', array(), '20151215', true );

	wp_enqueue_script( 'jquery-meanmenu', get_template_directory_uri() . '/assets/third-party/meanmenu/jquery.meanmenu.js', array('jquery'), '2.0.2', true );

	wp_enqueue_script( 'jquery-slick', get_template_directory_uri() . '/assets/third-party/slick/slick.js', array('jquery'), '1.6.0', true );

	// Add script for sticky sidebar.
	$sticky_sidebar = ecommerce_gem_get_option( 'enable_sticky_sidebar' );

	if( 1 == $sticky_sidebar ){

		wp_enqueue_script( 'jquery-theia-sticky-sidebar', get_template_directory_uri() . '/assets/third-party/theia-sticky-sidebar/theia-sticky-sidebar.min.js', array('jquery'), '1.0.7', true );

	}

	wp_enqueue_script( 'ecommerce-gem-custom', get_template_directory_uri() . '/assets/js/custom.js', array( 'jquery' ), '2.0.2', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'ecommerce_gem_scripts' );

/**
* Enqueue scripts and styles for admin >> widget page only.
*/
function ecommerce_gem_admin_scripts( $hook ) {

	if( 'widgets.php' === $hook ){

		wp_enqueue_style( 'ecommerce-gem-admin', get_template_directory_uri() . '/includes/widgets/css/admin.css', array(), '2.0.2' );

		wp_enqueue_media();

		wp_enqueue_script( 'ecommerce-gem-admin', get_template_directory_uri() . '/includes/widgets/js/admin.js', array( 'jquery' ), '2.0.2' );

	}

	if( is_admin() ) { 
	    wp_enqueue_style( 'wp-color-picker' ); 
	    wp_enqueue_script( 'wp-color-picker' );
	}

}

add_action( 'admin_enqueue_scripts', 'ecommerce_gem_admin_scripts' );

/**
 * Register new endpoint to use inside My Account page.
 *
 * @see https://developer.wordpress.org/reference/functions/add_rewrite_endpoint/
 */
function my_custom_endpoints() {
	add_rewrite_endpoint( 'my-appointments', EP_ROOT | EP_PAGES );
}

add_action( 'init', 'my_custom_endpoints', 0 );

/**
 * Add new query var.
 *
 * @param array $vars
 * @return array
 */
function my_custom_query_vars( $vars ) {
	$vars[] = 'my-appointments';

	return $vars;
}

add_filter( 'query_vars', 'my_custom_query_vars', 0 );

/**
 * Flush rewrite rules on theme activation.
 */
function my_custom_flush_rewrite_rules() {
	add_rewrite_endpoint( 'my-appointments', EP_ROOT | EP_PAGES );
	flush_rewrite_rules();
}

add_action( 'after_switch_theme', 'my_custom_flush_rewrite_rules' );

/**
 * Custom help to add new items into an array after a selected item.
 *
 * @param array $items
 * @param array $new_items
 * @param string $after
 * @return array
 */
function my_custom_insert_after_helper( $items, $new_items, $after ) {
	// Search for the item position and +1 since is after the selected item key.
	$position = array_search( $after, array_keys( $items ) ) + 1;

	// Insert the new item.
	$array = array_slice( $items, 0, $position, true );
	$array += $new_items;
	$array += array_slice( $items, $position, count( $items ) - $position, true );

    return $array;
}

/**
 * Insert the new endpoint into the My Account menu.
 *
 * @param array $items
 * @return array
 */
function my_custom_my_account_menu_items( $items ) {
	$new_items = array();
	$new_items['my-appointments'] = __( 'My Appointments', 'woocommerce' );

	// Add the new item after `orders`.
	return my_custom_insert_after_helper( $items, $new_items, 'orders' );
}

add_filter( 'woocommerce_account_menu_items', 'my_custom_my_account_menu_items' );

/**
 * Endpoint HTML content.
 */
function my_custom_endpoint_content() {

	if (is_user_logged_in()){
		$current_user = wp_get_current_user();
	
		global $wpdb;
		
		$email = $current_user->user_email;
			
		$myrows = $wpdb->get_results( 
			$wpdb->prepare(
				"SELECT appt.id, loc.name as location , svc.name as service, staff.name as stylist, date, start, end, status, appt.price
				FROM wp_ea_appointments appt INNER JOIN wp_ea_locations loc 
				ON appt.location=loc.id 
				INNER JOIN wp_ea_services svc
				ON appt.service=svc.id
				INNER JOIN wp_ea_staff staff
				ON appt.worker=staff.id
				INNER JOIN wp_ea_fields fields
				ON appt.id=fields.app_id 
				WHERE fields.value = %s", $email
			)
		);
		
		echo "<table border='1'>
				<tr>
				<th>ID</th>
				<th>Location</th>
				<th>Service</th>
				<th>Stylist</th>
				<th>Date</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Status</th>
				<th>Price</th>
				</tr>";

		foreach ($myrows as $details) {
			echo "<tr>";
			echo "<td>" . $details->id . "</td>";
			echo "<td>" . $details->location . "</td>";
			echo "<td>" . $details->service . "</td>";
			echo "<td>" . $details->stylist . "</td>";
			echo "<td>" . $details->date . "</td>";
			echo "<td>" . $details->start . "</td>";
			echo "<td>" . $details->end . "</td>";
			echo "<td>" . $details->status . "</td>";
			echo "<td>" . $details->price . "</td>";
		}   
		
		echo "</table>";
	}
}

add_action( 'woocommerce_account_my-appointments_endpoint', 'my_custom_endpoint_content' );

/*
 * Change endpoint title.
 *
 * @param string $title
 * @return string
 */
function my_custom_endpoint_title( $title ) {
	global $wp_query;

	$is_endpoint = isset( $wp_query->query_vars['my-appointments'] );

	if ( $is_endpoint && ! is_admin() && is_main_query() && in_the_loop() && is_account_page() ) {
		// New page title.
		$title = __( 'My Appointments', 'woocommerce' );

		remove_filter( 'the_title', 'my_custom_endpoint_title' );
	}

	return $title;
}

add_filter( 'the_title', 'my_custom_endpoint_title' );

function cron_daily_send_appointment_reminder_d2d59476() {
    // do stuff
	
}

add_action( 'daily_send_appointment_reminder', 'cron_daily_send_appointment_reminder_d2d59476', 10, 0 );

// Load main file.
require_once trailingslashit( get_template_directory() ) . '/includes/main.php';

// Add term and conditions check box on registration form
add_action( 'woocommerce_register_form', 'add_terms_and_conditions_to_registration', 20 );
function add_terms_and_conditions_to_registration() {

    if ( wc_get_page_id( 'terms' ) > 0 && is_account_page() ) {
        ?>
        <p class="form-row terms wc-terms-and-conditions">
            <label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                <input type="checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox" name="terms" <?php checked( apply_filters( 'woocommerce_terms_is_checked_default', isset( $_POST['terms'] ) ), true ); ?> id="terms" /> <span><?php printf( __( 'I&rsquo;ve read and accept the <a href="%s" target="_blank" class="woocommerce-terms-and-conditions-link">terms &amp; conditions</a>', 'woocommerce' ), esc_url( wc_get_page_permalink( 'terms' ) ) ); ?></span> <span class="required">*</span>
            </label>
            <input type="hidden" name="terms-field" value="1" />
        </p>
    <?php
    }
}

// Validate required term and conditions check box
add_action( 'woocommerce_register_post', 'terms_and_conditions_validation', 20, 3 );
function terms_and_conditions_validation( $username, $email, $validation_errors ) {
    if ( ! isset( $_POST['terms'] ) )
        $validation_errors->add( 'terms_error', __( 'Terms and condition are not checked!', 'woocommerce' ) );

    return $validation_errors;
}