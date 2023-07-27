import 'result.dart';

class Teams {
	int? success;
	List<Result>? result;

	Teams({this.success, this.result});

	factory Teams.fromJson(Map<String, dynamic> json) => Teams(
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
