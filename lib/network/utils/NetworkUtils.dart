class NetworkUtils{

  static Map<String, String> getApiHeaders() {
    Map<String, String> headers = Map<String, String>();
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    return headers;
  }

}