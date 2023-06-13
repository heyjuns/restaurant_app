class Utils {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static getImageUrl(String imageSize, String path) {
    return '$baseUrl/images/$imageSize/$path';
  }
}
