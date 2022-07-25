import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/Data/api_clint.dart';
import 'package:student_app/Model/chapte.dart';
import 'package:student_app/Model/facts_model.dart';
import 'package:student_app/Model/level_model.dart';
import 'package:student_app/Model/subject_model.dart';

class HomeScreenController extends GetxController {
  ApiClient apiClient = ApiClient();

  List<LevelModel> levelModelList = [];
  List<SubjectModel> subjectModelList = [];
  List<ChapterModel> chapterModelList = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool noInternet = false;
  String dropdownValue = 'One';

  bool unitButton = true;
  bool percentageButton = false;
  bool percentageEnable = false;
  bool allUnitButton = false;

  LevelModel? levelModel;
  SubjectModel? subjectModel;
  FactsModel? factsModel;
  ChapterModel? chapterModel;
  @override
  void initState() {

     onFunctionlevl();

  }

  onFunctionlevl() async {
    levelModelList = await apiClient.onLoadLevel();
    update();
  }

  onFunctionSubject(id) async {
    subjectModelList = await apiClient.onLoadSubject(id);
    update();
  }

  onFunctionChpter(id) async {
    chapterModelList = await apiClient.onLoadChapter(id);

    update();
  }

  onFunctionfact(id) async {
    factsModel = await apiClient.onLoadFact(id);
    update();
  }

  investTrust(index) {
    switch (index) {
      case 0:
        {
          unitButton = true;
          percentageButton = false;
          allUnitButton = false;

          update();
          break;
        }
      case 1:
        {
          unitButton = false;
          percentageButton = true;
          allUnitButton = false;

          update();
          break;
        }
      case 2:
        {
          unitButton = false;
          percentageButton = false;
          allUnitButton = true;

          update();

          break;
        }
    }
  }
}
