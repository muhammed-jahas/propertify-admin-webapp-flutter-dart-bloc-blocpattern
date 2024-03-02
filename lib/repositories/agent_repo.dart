import 'package:flutter/material.dart';
import 'package:propertify_webapp/data/network/network_api_services.dart';
import 'package:propertify_webapp/resources/app_urls/app_urls.dart';
import 'package:propertify_webapp/utils/data_class.dart';

class AgentRepo {
  Future<DataClass> getAllAgents() async {
    return await ApiServices.getApi(Appurls.getAllAgents);
  }
}
