import 'package:flutter/material.dart';
import 'package:student_app/Views/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


      ),
      home: HomeScreen()
    );
  }
}

// import "package:flutter/material.dart";
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(MaterialApp(
//   title: "Hospital Management",
//   home: MyApp(),
// ));
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String? _mySelection;
//
//   final String url = "http://webmyls.com/php/getdata.php";
//
//   List data = []; //edited line
//
//   Future<String> getSWData() async {
//     var res = await http
//         .get( Uri.parse(url), headers: {"Accept": "application/json"});
//     var resBody = json.decode(res.body);
//
//     setState(() {
//       data = resBody;
//     });
//
//     print(resBody);
//
//     return "Sucess";
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     this.getSWData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("Hospital Management"),
//       ),
//       body: new Center(
//         child: new DropdownButton(
//           items: data.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['item_name']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//           onChanged: ( String? newVal) {
//             setState(() {
//               _mySelection = newVal!;
//             });
//           },
//           value: _mySelection,
//         ),
//       ),
//     );
//   }
// }