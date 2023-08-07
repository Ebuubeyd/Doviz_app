import 'dart:async';

import 'package:doviz_app/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Doviz extends StatefulWidget {
  const Doviz({super.key});

  @override
  State<Doviz> createState() => _DovizState();
}

class _DovizState extends State<Doviz> {
  final DovizController dovizController = Get.put(DovizController());
  var olcak = false;

  @override
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

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[200],
        onPressed: () {
          setState(() {
            olcak = false;
          });
          var deneme = dovizController.incrementCounter();
          Timer(Duration(seconds: 2), () {
            setState(() {
              olcak = true;
            });
          });
        },
        child: Icon(Icons.refresh),
      ),
      backgroundColor: Colors.grey[800],
      body: Container(
        child: olcak
            ? ListView.builder(
                itemCount: dovizController.birimler.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        child: Center(
                          child: Image.network(
                              'http://vir-app.com/flags/flag_${dovizController.birimler.value[index]}.png'),
                        ),
                      ),
                      Container(
                        width: 80,
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
                        width: 80,
                        height: 80,
                        child: Center(
                          child: Text(
                            dovizController.alisDeger[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green[300],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Center(
                          child: Text(
                            dovizController.satisDeger[index],
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Center(
                          child: Text(
                            dovizController.degisimDeger[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'İşlem devam ediyor...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
