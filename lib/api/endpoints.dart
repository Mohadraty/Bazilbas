class Endpoints {
  static String baseUrl = "https://bazilbas.store/backend";

  // Authentication
  static String loginUser = "$baseUrl/public/auth/login.php";
  static String createUser = "$baseUrl/public/auth/register.php";

  // User
  static String showUserData = "$baseUrl/public/users/show_user.php";

  // Orders
  static String createOrder = "$baseUrl/public/orders/create_order.php";
  static String showOrders = "$baseUrl/public/orders/show_orders.php";

  // Products
  static String showProducts = "$baseUrl/public/products/show_products.php";
  static String addToFavorite = "$baseUrl/public/products/bookmark_product.php";

  // Cart
  static String showCart = "$baseUrl/public/cart/show_cart.php";
  static String updateCart = "$baseUrl/public/cart/update_cart.php";
  static String addToCart = "$baseUrl/public/cart/add_to_cart.php";
}
