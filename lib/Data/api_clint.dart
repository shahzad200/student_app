

import 'dart:convert';



import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:student_app/Controller/home_page_controller.dart';
import 'package:student_app/Model/chapte.dart';
import 'package:student_app/Model/facts_model.dart';

import 'package:student_app/Model/level_model.dart';
import 'package:student_app/Model/subject_model.dart';

class ApiClient {

  static const _baseUrl = "http://192.168.0.113:8080/";
  static const _endPLevel = _baseUrl + 'get_levels';
  static const _endPSubject = _baseUrl + 'get_subjects/1';
  static const _endPChapter = _baseUrl +'get_chapters/1';
  static const _endPFact = _baseUrl +'get_facts/1';

  // final homeController = Get.find<HomeScreenController>();

  Future<dynamic> onLoadLevel() async {
    final response = await http.get( Uri.parse(_endPLevel),);

    if (response.statusCode == 200) {
      print("<<<<<<<<<<response1>>>>>>>>>>>>>>>>>>>>");
      printInfo(info: response.body.toString());
      var resBody = json.decode(response.body);
      var data = resBody as List;
      List <LevelModel> postData = [];
      for (var element in data) {
        var data2 = LevelModel.fromJson(element);
        postData.add(data2);
      }
      print(resBody);
      return postData;
    } else {

    throw Exception('Failed to load post');
    }
  }



  Future<dynamic> onLoadSubject(id) async {



    final response = await http.get( Uri.parse(_endPSubject+'level_id=$id'),);


    if (response.statusCode == 200) {

      print("<<<<<<<<<<response1>>>>>>>>>>>>>>>>>>>>");
      printInfo(info: response.body.toString());
      var resBody = json.decode(response.body);
      var datasub = resBody as List;
      List <SubjectModel> dataPost = [];
      for (var element in datasub) {
        var data2 = SubjectModel.fromJson(element);
        dataPost.add(data2);

      }
      print(resBody);
       return dataPost;
    } else {

      throw Exception('Failed to load post');
    }
  }



  Future<dynamic> onLoadChapter(id) async {
    final response = await http.get( Uri.parse(_endPChapter+'level_id=$id'));

    if (response.statusCode == 200) {
      print("<<<<<<<<<<response1>>>>>>>>>>>>>>>>>>>>");
      printInfo(info: response.body.toString());
      var resBody = json.decode(response.body);
      var datasub = resBody as List;
      List <ChapterModel> dataPost = [];
      for (var element in datasub) {
        var data2 = ChapterModel.fromJson(element);
        dataPost.add(data2);
      }
      print(resBody);
      return dataPost;
    } else {

      throw Exception('Failed to load post');
    }
  }


  Future<dynamic> onLoadFact(id) async {
    final response = await http.get( Uri.parse(_endPFact+'level_id=$id'),);

    if (response.statusCode == 200) {
      print("<<<<<<<<<<response1>>>>>>>>>>>>>>>>>>>>");
      printInfo(info: response.body.toString());
      var resBody = json.decode(response.body);
      var datasub = resBody as List;
      List <FactsModel> dataPost = [];
      for (var element in datasub) {
        var data2 = FactsModel.fromJson(element);
        dataPost.add(data2);
      }
      print(resBody);
      return dataPost;
    } else {

      throw Exception('Failed to load post');
    }
  }
}