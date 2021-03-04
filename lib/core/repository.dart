import 'package:spicemoney_ecom_assignment/core/api_helper.dart';
import 'package:spicemoney_ecom_assignment/core/demo_api_helper.dart';
import 'package:spicemoney_ecom_assignment/core/dio_client.dart';

enum ApiEnvironment { dev, demo }

abstract class DataHelper {
  set apiHelper(ApiHelper apiHelper);

  ApiHelper get apiHelper;
}

class DataHelperImpl implements DataHelper {
  static final DataHelperImpl _singleton = DataHelperImpl._internal();
  static final ApiEnvironment _currentEnvironment = ApiEnvironment.dev;

  ApiHelper _apiHelper;
  DemoApiHelperImpl _demoApiHelperImpl;

  DataHelperImpl._internal() {
    _demoApiHelperImpl = DemoApiHelperImpl();
    _apiHelper = ApiHelperImpl(RestClient(ApiEndPoints.developmentHost));
  }

  static DataHelperImpl get instance => _singleton;

  void setApiHelper(ApiHelper apiHelper) {}

  @override
  ApiHelper get apiHelper => _currentEnvironment == ApiEnvironment.demo
      ? _demoApiHelperImpl
      : _apiHelper;

  @override
  set apiHelper(ApiHelper apiHelper) {
    _apiHelper = apiHelper;
  }
}
