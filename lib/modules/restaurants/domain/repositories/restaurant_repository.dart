abstract class RestaurantRepository {
  Future<dynamic> getRestaurants() async {}
  Future<dynamic> getRestaurant(int id) async {}
  Future<dynamic> getRestaurantImage(String size, String pictureId) async {}
  Future<dynamic> postRestaurantReview(
      String id, String name, String review) async {}
}
