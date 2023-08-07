import 'dart:async';

import 'package:doviz_app/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DovizTrans extends StatefulWidget {
  const DovizTrans({super.key});

  @override
  State<DovizTrans> createState() => _DovizTransState();
}

class _DovizTransState extends State<DovizTrans> {
  final DovizController dovizController = Get.put(DovizController());
  var olcak = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    var deneme = dovizController.incrementCounter();
    Timer(Duration(seconds: 2), () {
      setState(() {
        olcak = true;
      });
    });
  }

  var denemesss = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[200],
        onPressed: () {
          var deneme = dovizController.dovizToTl(denemesss);

          setState(() {
            olcak = false;
          });
          Timer(Duration(seconds: 2), () {
            setState(() {
              olcak = true;
            });
          });
        },
        child: Icon(Icons.refresh),
      ),
      backgroundColor: Colors.grey[800],
      body: olcak
          ? Container(
              child: ListView.builder(
                itemCount: dovizController.birimler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 70,
                        child: Center(
                          child: Image.network(
                            'http://vir-app.com/flags/flag_${dovizController.birimler.value[index]}.png',
                          ),
                        ),
                      ),
                      Container(
                        width: 65,
                        height: 80,
                        child: Center(
                          child: Text(
                            dovizController.birimler[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 65,
                        height: 80,
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              dovizController.kurDeger[index].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onChanged: (doviz) {
                            var dovizRet = int.parse(doviz);
                            setState(() {
                              denemesss = dovizRet;

                              print(denemesss);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 65,
                        height: 80,
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              dovizController.tlDeger[index].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onChanged: (tl) {
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        width: 65,
                        height: 80,
                        child: Center(
                          child: Text(
                            'TRY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 70,
                        child: Center(
                          child: Image.network(
                            'http://vir-app.com/flags/flag_TRY.png',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          : Container(),
    );
  }
}
