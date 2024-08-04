class CommonResponse {
  CommonResponse({
    required this.message,
    required this.status,
    this.data,
  });
  late final String message;
  late final int status;
  late final Null data;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data;
    return _data;
  }
}
