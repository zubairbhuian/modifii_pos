class URLS {
  URLS._();
  // ***** Base URL
  // static String baseURL = 'https://modifiipos.com/api/v1'; //live
  // static String baseURLForNotification = 'https://modifiipos.com';

  static String baseURL = 'https://staging.modifii.com/api/v1';
  static String baseURLForNotification = 'https://staging.modifii.com';

  //** end popint **
  static String login = '$baseURL/server/login';
  static String categories = '$baseURL/server/categories';
  static String products = '$baseURL/products/latest';
  static String placeOrder = '$baseURL/table/order/place';

  static String tableList = '$baseURL/table/dine-in-area';
  static String barList = '$baseURL/bars/list';
  static String hallList = '$baseURL/table/hall-area';

  static String ordersList = '$baseURL/table/order/list';
}
