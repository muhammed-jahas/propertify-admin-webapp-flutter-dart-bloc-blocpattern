import 'package:propertify_webapp/data/exceptions/app_exceptions.dart';

class DataClass<T> {
  final T? data;
  final AppException? appexception;
  DataClass({this.data, this.appexception});
}
