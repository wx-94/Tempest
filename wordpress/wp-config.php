<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'monsoondb');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'b3M3ik[}TAd?8D-62E^O(Cdo#o+X=?STV-4;c2gvOV7{F&g_]Y*E_dar@6!X!)$d');
define('SECURE_AUTH_KEY',  'M/5t-U+FdEKbv;X[SZ,|50hae:kvHL7wl(/uhqpUUbJ!7D.#vGs}B6|AYt3&k~fi');
define('LOGGED_IN_KEY',    'Bocc^*G(.t!`b]L}No) hjO k_&Pt}y#OO|0B(0`dw(`4wvqx8|Q*NZ*5#u]u|[9');
define('NONCE_KEY',        'XoMK_&VNL,5Y3=+AwgqDjKbguCF4AGA5QvGgF/ttYh?9J({xP-1:kNWP6zAkOKGY');
define('AUTH_SALT',        'xCV@uN3A=C?pjPB`5oGf.]A]F]l[Js]xb6N9;/rA6#I:!ht..6wk-pfothIq9_Gi');
define('SECURE_AUTH_SALT', 'KUyxBS>T%aH01R!I0Be+o179(FB>AO~sLl]ch59NePd$?L)v nlEH?;.8sTJRpIg');
define('LOGGED_IN_SALT',   'r}JbhIK3t+LJ;y6gcSk]pIKt2)c|/etK% y:Uf dJa<%~y)(PNh~+]D/Q6;3GxQw');
define('NONCE_SALT',       'e8~D&^n4nkms+3Y<C!0PA8x-B<M[X*Y/+Crab{}SJM~|!UDzeb:BA#3AYi(,k3>;');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
