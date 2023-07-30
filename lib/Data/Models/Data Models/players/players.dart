import 'result.dart';

class Players {
  int? success;
  List<Result>? result;

  Players({this.success, this.result});

  factory Players.fromJson(Map<String, dynamic> json) => Players(
        success: json['success'] as int?,
        result: ((json['result'] as List<dynamic>?)
                ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
                .toList()) ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
