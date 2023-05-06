class TestHistory {
  String? id;
  String? userId;
  String? testId;
  int? totalPoint;
  DateTime? testDate;

  TestHistory({
    this.id,
    this.userId,
    this.testId,
    this.totalPoint,
    this.testDate,
  });

  TestHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    testId = json['testId'];
    totalPoint = json['totalPoint'];
    testDate = json['testDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['testId'] = testId;
    data['totalPoint'] = totalPoint;
    data['testDate'] = testDate;
    return data;
  }
}
