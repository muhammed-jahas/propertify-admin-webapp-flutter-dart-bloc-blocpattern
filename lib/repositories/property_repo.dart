import 'package:flutter/foundation.dart';
import 'package:propertify_webapp/data/network/network_api_services.dart';
import 'package:propertify_webapp/resources/app_urls/app_urls.dart';
import 'package:propertify_webapp/utils/data_class.dart';

class PropertyRepo {
  Future<DataClass> getAllProperties() async {
    debugPrint('In Repo');
    return await ApiServices.getApi(Appurls.getAllProperties);
  }

  Future<DataClass> approveProperty({var data, String? id}) async {
    debugPrint('In Repo');
    return await ApiServices.patchApi(data, '${Appurls.approveProperty}/${id}');
  }
}
