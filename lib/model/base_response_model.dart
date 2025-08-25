class BaseResponseModel {
  bool isSuccess;
  dynamic data;

  BaseResponseModel({this.isSuccess = false, this.data});
}

class BaseResponseList<T> {
  final int total;
  final List<T> data;

  BaseResponseList({required this.total, required this.data});

  factory BaseResponseList.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) formJson) => BaseResponseList(
        total: json["total"] ?? json['totalRecords'] ?? 0,
        data: json["data"] == null ? [] : (json["data"] as List).map((e) => formJson(e)).toList(),
      );

  factory BaseResponseList.fromTotal(Map<String, dynamic> json) => BaseResponseList(
        total: json["total"] ?? json['totalRecords'] ?? 0,
        data: [],
      );
}
