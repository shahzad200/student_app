import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:student_app/Controller/home_page_controller.dart';
import 'package:student_app/Model/chapte.dart';
import 'package:student_app/Model/facts_model.dart';
import 'package:student_app/Model/level_model.dart';
import 'package:student_app/Model/subject_model.dart';
import 'package:student_app/Utils/color.dart';
import 'package:student_app/Widget/custom_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  LevelModel? _selectedValue;
  SubjectModel? _selected;
  ChapterModel? _select;
  FactsModel? _selectValue;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.whiteColor,
              elevation: 0,
              title: const RestInvestTitle(
                text: "StudentApp",
                textColor: AppColor.black,
                fontWeight: FontWeight.w900,
              ),
              centerTitle: true,
            ),
            key: _.scaffoldKey,
            body: Stack(
              children: [
                ListView(
                    shrinkWrap: true,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RestInvestTitle(
                            text: "Level",
                            fontSize: 14,
                            textColor: AppColor.black,
                            fontWeight: FontWeight.w900,
                          ),
                          Container(
                              // margin: EdgeInsets.all(10.0),
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.isLoading
                                  ? const SizedBox()
                                  : DropdownButton<LevelModel>(
                                      isExpanded: true,
                                      value: _selectedValue,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: AppColor.black),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                      onChanged: (LevelModel? newValue) {
                                        _selectedValue = newValue!;
                                        _.levelModel = newValue;
                                        _.onFunctionSubject(newValue.levelId);

                                        _.update();
                                      },
                                      items: _.levelModelList
                                          .map<DropdownMenuItem<LevelModel>>(
                                              (LevelModel value) {
                                        return DropdownMenuItem<LevelModel>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RestInvestTitle(
                            text: "Subject",
                            fontSize: 14,
                            textColor: AppColor.black,
                            fontWeight: FontWeight.w900,
                          ),
                          Container(
                              // margin: EdgeInsets.all(10.0),
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.isLoading
                                  ? const SizedBox()
                                  : DropdownButton<SubjectModel>(
                                      isExpanded: true,
                                      value: _selected,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: AppColor.black),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                      onChanged: (SubjectModel? newValue) {
                                        _selected = newValue!;
                                        _.subjectModel = newValue;
                                        _.onFunctionChpter(newValue.level);
                                        _.update();
                                      },
                                      items: _.subjectModelList
                                          .map<DropdownMenuItem<SubjectModel>>(
                                              (SubjectModel value) {
                                        return DropdownMenuItem<SubjectModel>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RestInvestTitle(
                            text: "Chapter",
                            fontSize: 14,
                            textColor: AppColor.black,
                            fontWeight: FontWeight.w900,
                          ),
                          Container(
                              // margin: EdgeInsets.all(10.0),
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 5.0),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColor.whiteColor,
                                  border: Border.all(
                                      width: 1, color: AppColor.black)),
                              child: _.isLoading
                                  ? const SizedBox()
                                  : DropdownButton<ChapterModel>(
                                      value: _select, isExpanded: true,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      // elevation: 16,
                                      style: const TextStyle(
                                          color: AppColor.black),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                      onChanged: (ChapterModel? newValue) {
                                        _select = newValue!;
                                        _.onFunctionfact(newValue.chapterId);
                                        _.chapterModel = newValue;
                                        _.update();
                                      },
                                      items: _.chapterModelList
                                          .map<DropdownMenuItem<ChapterModel>>(
                                              (ChapterModel value) {
                                        return DropdownMenuItem<ChapterModel>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      }).toList(),
                                    )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RestInvestTitle(
                            text: "Search By Color",
                            fontSize: 14,
                            textColor: AppColor.black,
                            fontWeight: FontWeight.w900,
                          ),
                          CustomTextFormField(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomRowButton(
                                  text: "red",
                                  textColor: _.unitButton
                                      ? AppColor.whiteColor
                                      : AppColor.black,
                                  textSize: 14,
                                  onPress: () {
                                    _.investTrust(0);
                                  },
                                  buttonColor: _.unitButton
                                      ? AppColor.red
                                      : AppColor.whiteColor)),
                          Expanded(
                              child: CustomRowButton(
                            text: "yellow",
                            textColor: _.percentageButton
                                ? AppColor.whiteColor
                                : AppColor.black,
                            textSize: 14,
                            onPress: () {
                              _.investTrust(1);
                            },
                            buttonColor: _.percentageButton
                                ? AppColor.yellow
                                : AppColor.whiteColor,
                          )),
                          Expanded(
                              child: CustomRowButton(
                            text: "green",
                            textColor: _.allUnitButton
                                ? AppColor.whiteColor
                                : AppColor.black,
                            textSize: 14,
                            onPress: () {
                              _.investTrust(2);
                            },
                            buttonColor: _.allUnitButton
                                ? AppColor.green
                                : AppColor.whiteColor,
                          )),
                          const SizedBox(),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              border:
                                  Border.all(width: 1, color: AppColor.black)),
                          child: Column(
                            children: [
                              _.unitButton
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 30),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.",
                                            style:
                                                TextStyle(color: AppColor.red),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast."),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.",
                                            style:
                                                TextStyle(color: AppColor.red),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              _.percentageButton
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 30),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.",
                                            style: TextStyle(
                                                color: AppColor.yellow),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.")
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              _.allUnitButton
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 30),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.",
                                            style: TextStyle(
                                                color: AppColor.green),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              "Eliminate English Grammar Errors Instantly and Enhance Your Writing. Try Now for Free! Grammarly Helps You Eliminate Errors And Find The Perfect Words To Express Yourself. Eliminate Grammar Errors. Easily Improve Any Text. Find and Add Sources Fast.")
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                _.isLoading
                    ? const Center(
                        child: DialogBox(),
                      )
                    : _.noInternet
                        ? Positioned(
                            bottom: 0,
                            child: Container(
                              height: 180,
                              width: Get.width,
                              color: Colors.white,
                              child: NoInternetWgt(
                                onTryAgain: () {
                                  _.noInternet = false;
                                  _.update();
                                },
                              ),
                            ),
                          )
                        : const SizedBox()
              ],
            ),
          );
        });
  }
}
