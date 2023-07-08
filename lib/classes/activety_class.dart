class Activity {
  String activityName;
  List<List<double>> shots;

  Activity({required this.activityName, required this.shots});

  factory Activity.fromJson(Map<String, dynamic> json) {
    final activityName = json['activity_name'] as String;

    final shotsJson = json['shots'] as List<dynamic>;

    final shots = shotsJson.map<List<double>>((value) {
      return List<double>.from(value.map<double>((v) => v as double));
    }).toList();

    return Activity(
      activityName: activityName,
      shots: shots,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activity_name': activityName,
      'shots': convertListToJson(shots),
    };
  }

  Map<String, List<double>> convertListToJson(List<List<double>> inputList) {
    Map<String, List<double>> result = {};
    for (int i = 0; i < inputList.length; i++) {
      final key = (i + 1).toString();
      result[key] = inputList[i];
    }
    return result;
  }
}
