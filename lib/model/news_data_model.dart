import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
PublicApiResponse? responseDataBbc;

Future<void> fetchapidatabbc(BuildContext context) async {
  try{
  final url = Uri.parse('https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=cc852c9efd2447d4af948a5d561f9a1d');
  var response = await http.get(url);
  print(response.statusCode);
  if(response.statusCode == 200){
  responseDataBbc = PublicApiResponse.fromJson(jsonDecode(response.body));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("retry again")));
  }
  } catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('rety')));
  }
}

PublicApiResponse? responseDataSearch;
Future<void> fetchapidatasearch({String? searchquery}) async {
  final url = Uri.parse('https://newsapi.org/v2/everything?q=$searchquery&apiKey=cc852c9efd2447d4af948a5d561f9a1d');
  var response = await http.get(url);
  print(response.statusCode);
  responseDataSearch = PublicApiResponse.fromJson(jsonDecode(response.body));
}

class PublicApiResponse {
    String? status;
    int? totalResults;
    List<Article>? articles;

    PublicApiResponse({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory PublicApiResponse.fromJson(Map<String, dynamic> json) => PublicApiResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };
}

class Source {
    String? id;
    String? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
