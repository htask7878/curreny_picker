class student {
  String? date;
  Info? info;
  Query? query;
  double? result;
  bool? success;

  student({this.date, this.info, this.query, this.result, this.success});

  student.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    result = json['result'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    data['result'] = this.result;
    data['success'] = this.success;
    return data;
  }
}

class Info {
  double? rate;
  int? timestamp;

  Info({this.rate, this.timestamp});

  Info.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Query {
  int? amount;
  String? from;
  String? to;

  Query({this.amount, this.from, this.to});

  Query.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}