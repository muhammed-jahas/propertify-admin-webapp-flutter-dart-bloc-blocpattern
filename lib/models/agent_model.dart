class AgentModel {
  String id;
  String email;
  String fullname;
  String mobNo;
  bool status;
  List<String> requests;

  AgentModel({
    required this.id,
    required this.email,
    required this.fullname,
    required this.mobNo,
    required this.status,
    required this.requests,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['_id'],
      email: json['email'],
      fullname: json['fullname'],
      mobNo: json['mobNo'],
      status: json['status'],
      requests: List<String>.from(json['requests']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['mobNo'] = this.mobNo;
    data['status'] = this.status;
    data['requests'] = this.requests;
    return data;
  }
}
