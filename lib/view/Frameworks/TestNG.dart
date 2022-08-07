import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Components/MasterUI.dart';

class TestNG extends StatefulWidget {
  const TestNG({Key? key}) : super(key: key);

  @override
  State<TestNG> createState() => _TestNGState();
}

class _TestNGState extends State<TestNG> {
  CollectionReference pages = FirebaseFirestore.instance.collection('Pages');

  @override
  Widget build(BuildContext context) {
    return MasterUI(
      pages: pages,
      routes: 'TestNG',
      pageTitle: 'TestNG',
    );
  }
}
