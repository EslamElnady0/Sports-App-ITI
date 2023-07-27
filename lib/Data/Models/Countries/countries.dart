import 'result.dart';

class Countries {
  int? success;
  List<Result>? result;

  Countries({this.success, this.result});

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        success: json['success'] as int?,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
