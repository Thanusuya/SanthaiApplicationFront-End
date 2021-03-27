class logindata {
  String id;
  bool status;
  String message;

  logindata({this.id, this.status, this.message});

  factory logindata.fromJson(Map<String, dynamic> json) {
    return logindata(
        id: json['id'], message: json['message'], status: json['status']);
  }
}
