import 'result.dart';

class Leagues {
  int? success;
  List<Result>? result;

  Leagues({this.success, this.result});

  factory Leagues.fromJson(Map<String, dynamic> json) => Leagues(
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
