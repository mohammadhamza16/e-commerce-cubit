class EndPoints {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String login = '/auth/login';
  static const String register = '/users';
  static const String allProducts = '/products';
  static const String productDetails = '/products/details';
  static const String categories = '/products/categories';
  static String getUserCart(int userId) => '/carts/user/$userId';
  static String updateCart(int cartId) => '/carts/$cartId';
  static const String productsByCategory = '/products/category';
}
