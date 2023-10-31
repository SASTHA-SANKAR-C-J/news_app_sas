import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_sas/model/news_data_model.dart';
class NewsController {
PublicApiResponse? responseDataBbc;
Future<void> fetchapidatabbc(BuildContext context) async {
  try{
  final url = Uri.parse('https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=cc852c9efd2447d4af948a5d561f9a1d');
  var response = await http.get(url);
  if(response.statusCode == 200){
  responseDataBbc = PublicApiResponse.fromJson(jsonDecode(response.body));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Swipe down to refresh")));
  }
  } catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.toString()} ; Swipe down to refresh")));
  }
}

PublicApiResponse? responseDataSearch;
Future<void> fetchapidatasearch({String? searchquery,required BuildContext context}) async {
  try{
  final url = Uri.parse('https://newsapi.org/v2/everything?q=$searchquery&apiKey=cc852c9efd2447d4af948a5d561f9a1d');
  var response = await http.get(url);
  if(response.statusCode == 200){
  responseDataSearch = PublicApiResponse.fromJson(jsonDecode(response.body));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Retry again")));
  }
  } catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  }}
}