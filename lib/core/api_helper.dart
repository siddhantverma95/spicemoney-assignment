import 'dio_client.dart';

class ApiEndPoints {
  static final String developmentHost = "https://api.jsonbin.io/";

  static final String productsApi = 'b/60141159ef99c57c734b89aa';
}

abstract class ApiHelper {
  Future<dynamic> executeLogin();
}

class ApiHelperImpl extends ApiHelper {
  final RestClient _api;

  ApiHelperImpl(this._api);
  @override
  Future executeLogin() {
    return _api.get(ApiEndPoints.productsApi).then((value) {
      return value.data;
    });
  }
}
