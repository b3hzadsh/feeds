import 'dart:convert';

import 'package:flutter/cupertino.dart';

NewsModel clientFromJson(String str) {
  final jsonData = json.decode(str);
  return NewsModel.fromMap(jsonData);
}

String clientToJson(NewsModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class NewsModel {
  @required
  final String title;
  @required
  final String desc;
  @required
  final String url;
  NewsModel({this.desc, this.title, this.url});
  factory NewsModel.fromMap(Map<String, dynamic> json) => new NewsModel(
        title: json["title"],
        desc: json["desc"],
        // lastName: json["last_name"],
        url: json["url"],
      );
  Map<String, dynamic> toMap() => {
        "title": title,
        "desc": desc,
        // "last_name": lastName,
        "url": url,
      };
}
