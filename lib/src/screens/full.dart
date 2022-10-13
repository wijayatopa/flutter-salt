import 'package:belajar_flutter/src/models/modelsName.dart';
import 'package:belajar_flutter/src/utilities/dataDumy.dart';
import 'package:belajar_flutter/src/widgets/buttonComponent.dart';
import 'package:flutter/material.dart';

class FullWidget extends StatefulWidget {
  const FullWidget({super.key});

  @override
  State<FullWidget> createState() => _FullWidgetState();
}

class _FullWidgetState extends State<FullWidget> {
  String say = "hello";
  bool isOpen = false;
  int angka = 0;
  List<int> listAngka = [1, 2];
  List<dynamic> listObj = [
    {"nama": "budi"},
    {"nama": "budi 2"}
  ];

  void _change() {
    setState(() {
      say = "hai";
    });
  }

  // void callAPIBE (){
  //   final resp = 5;
  //   setState(() {
  //     angka = resp;
  //   });
  // }

  void _changeListAngka() {
    // final banyak = [6,7,8,9];
    // listAngka..addAll(banyak);
    listAngka.add(listAngka.length + 1);
    setState(() {
      listAngka = listAngka;
    });
    // print(listAngka);
  }

  void _changeListObj() {
    final readyToAdd = {"nama": "ayah"};
    // final readyToAddAll = [{"nama": "ayah" },{"nama": "ayah 2" }, {"nama": "ayah 3" }];
    listObj.add(readyToAdd);
    // listObj..addAll(readyToAddAll);
    setState(() {
      listObj = listObj;
    });
    // print(listObj);
  }

  void _changeBool() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = ProductSource.getProduct();

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("Full Widget"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: Text(
                "$say Full Widget ",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),

            ButtonComponent(func: _change, label: "change text"),

            ListView.builder(
                shrinkWrap: true,
                itemCount: listAngka.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return Center(
                      child: Text(
                    listAngka[i].toString(),
                    style: const TextStyle(fontSize: 18.0),
                  ));
                }),
            ButtonComponent(
                func: _changeListAngka, label: "change List number"),

            Text("${isOpen}"),
            ButtonComponent(func: _changeBool, label: "change boolean"),

            ListView.builder(
                shrinkWrap: true,
                itemCount: listObj.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return Center(
                      child: Text(
                    listObj[i]["nama"],
                    style: const TextStyle(fontSize: 18.0),
                  ));
                }),
            ButtonComponent(func: _changeListObj, label: "Change List Object"),

            //example use model
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return Center(
                        child: Column(
                      children: [
                        Image.network(products[i].url),
                        Text(
                          products[i].title,
                          style: const TextStyle(fontSize: 18.0),
                        )
                      ],
                    ));
                  }),
            )
            //example use model
          ],
        )));
  }
}
