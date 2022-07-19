class ActivityResponse {
  List<Activities>? activities;

  ActivityResponse({this.activities});

  ActivityResponse.fromJson(Map<String, dynamic> json) {
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  String? activityType;
  String? institution;
  String? when;
  String? objective;
  String? remarks;
  String? id;

  Activities(
      {this.activityType,
        this.institution,
        this.when,
        this.objective,
        this.remarks,
        this.id});

  Activities.fromJson(Map<String, dynamic> json) {
    activityType = json['activityType'];
    institution = json['institution'];
    when = json['when'];
    objective = json['objective'];
    remarks = json['remarks'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityType'] = this.activityType;
    data['institution'] = this.institution;
    data['when'] = this.when;
    data['objective'] = this.objective;
    data['remarks'] = this.remarks;
    data['id'] = this.id;
    return data;
  }
}

class ActivityRequest {
  String? activityType;
  String? institution;
  String? when;
  String? objective;
  String? remarks;

  ActivityRequest(
      {this.activityType,
        this.institution,
        this.when,
        this.objective,
        this.remarks});

  ActivityRequest.fromJson(Map<String, dynamic> json) {
    activityType = json['activityType'];
    institution = json['institution'];
    when = json['when'];
    objective = json['objective'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityType'] = this.activityType;
    data['institution'] = this.institution;
    data['when'] = this.when;
    data['objective'] = this.objective;
    data['remarks'] = this.remarks;
    return data;
  }
}

class ActivityByIdResponse {
  String? activityType;
  String? institution;
  String? when;
  String? objective;
  String? remarks;
  String? id;

  ActivityByIdResponse(
      {this.activityType,
        this.institution,
        this.when,
        this.objective,
        this.remarks,
        this.id});

  ActivityByIdResponse.fromJson(Map<String, dynamic> json) {
    activityType = json['activityType'];
    institution = json['institution'];
    when = json['when'];
    objective = json['objective'];
    remarks = json['remarks'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityType'] = this.activityType;
    data['institution'] = this.institution;
    data['when'] = this.when;
    data['objective'] = this.objective;
    data['remarks'] = this.remarks;
    data['id'] = this.id;
    return data;
  }
}



