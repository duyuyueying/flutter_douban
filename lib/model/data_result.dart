class DataResult{
  var data;
  int code;
  String message;
  DataResult({this.code, this.data, this.message});
  

  factory DataResult.fromJson(Map<String, dynamic> json) {
    return DataResult(data: json['data'], code: json['code'], message: json['message']);
  }
}