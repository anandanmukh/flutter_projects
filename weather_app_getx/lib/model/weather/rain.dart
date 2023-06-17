class Rain {
	double? 1h;

	Rain({this.1h});

	factory Rain.fromJson(Map<String, dynamic> json) => Rain(
				1h: (json['1h'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'1h': 1h,
			};
}
