class ApiLink{

  static const String baseUriOfCustomer = "http://localhost:33633/api";
  static const String baseUriOfOrder = "http://localhost:33633/api";
  static const String baseUriOfRestaurant = "http://localhost:33633/api";

  //Customer Api
  static  const String login  ="$baseUriOfCustomer/customer/v1/Login";
  static  const String signUp ="$baseUriOfCustomer/customer/v1/register";
  static  const String tokenUpdate ="$baseUriOfCustomer/customer/v1/update-customer-notification-token";

  //Restaurant Api
  static  const String restaurant ="$baseUriOfRestaurant/restaurants";


}