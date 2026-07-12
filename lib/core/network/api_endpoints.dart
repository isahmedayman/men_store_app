class ApiEndpoints {
  const ApiEndpoints._();

  static const String baseUrl = 'https://api.escuelajs.co/api/v1';
  static const String products = '/products';
  static const String categories = '/categories';
  static const String login = '/auth/login';
  static const String users = '/users';
  static const String locations = '/locations';

  static String searchProducts(String title) => '/products/?title=$title';

  static String productsByCategory(int categoryId) =>
      '/products/?categoryId=$categoryId';

  // DummyJSON API
  static const String dummyBaseUrl = 'https://dummyjson.com';

  static String userCart(int userId) => '/carts/user/$userId';

  static const String addCart = '/carts/add';
}
