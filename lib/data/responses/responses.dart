import 'package:json_annotation/json_annotation.dart';

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
part 'responses.g.dart';

@JsonSerializable(
    genericArgumentFactories: true,
    fieldRename: FieldRename.snake,
    nullable: true)
class BaseResponse<T> {
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "data")
  final T? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  BaseResponse(this.status, this.data, this.message, this.token);
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

class CommonResponse {
  CommonResponse({
    required this.message,
    required this.status,
  });
  late final String message;
  late final int status;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
