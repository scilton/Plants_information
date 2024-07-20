class EndPoints {
  /// Base URL
  static const String baseURL = "https://trefle.io";

  /// API Key
  static const String allPlants = "/api/v1/plants";
  static String zonePlants(String zoneId) => "/api/v1/distributions/$zoneId/plants";
}
