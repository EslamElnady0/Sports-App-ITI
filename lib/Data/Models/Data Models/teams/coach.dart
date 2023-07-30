class Coach {
	String? coachName;
	dynamic coachCountry;
	dynamic coachAge;

	Coach({this.coachName, this.coachCountry, this.coachAge});

	factory Coach.fromJson(Map<String, dynamic> json) => Coach(
				coachName: json['coach_name'] as String?,
				coachCountry: json['coach_country'] as dynamic,
				coachAge: json['coach_age'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'coach_name': coachName,
				'coach_country': coachCountry,
				'coach_age': coachAge,
			};
}
