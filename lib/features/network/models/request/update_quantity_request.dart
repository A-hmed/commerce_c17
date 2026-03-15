class UpdateQuantityRequest {
  UpdateQuantityRequest({this.count});

  UpdateQuantityRequest.fromJson(dynamic json) {
    count = json['count'];
  }

  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }
}
