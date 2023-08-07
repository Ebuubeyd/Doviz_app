// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:doviz_app/client.dart';
import 'package:doviz_app/kurHesaplat.dart';
import 'package:doviz_app/sabitKur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kur Sorgu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pages(),
    );
  }
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final DovizController dovizController = Get.put(DovizController());

  var olcak = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        olcak = true;
      });
    });
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    Doviz(),
    DovizTrans(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: _pages[_currentIndex],
      bottomNavigationBar: olcak
          ? BottomNavigationBar(
              backgroundColor: Colors.grey[700],
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  if (index != _currentIndex) {
                    olcak = false;
                    Timer(Duration(seconds: 2), () {
                      setState(() {
                        olcak = true;
                      });
                    });
                    _currentIndex = index;
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.currency_exchange,
                  ),
                  label: 'Anlık Dövizler',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Döviz Hesaplat',
                ),
              ],
              selectedItemColor: Colors.white,
              selectedFontSize: 20,
              unselectedItemColor: Colors.white,
              unselectedFontSize: 14,
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
    );
  }
}
