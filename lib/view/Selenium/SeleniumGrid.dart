import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Components/MasterUI.dart';

class SeleniumGrid extends StatefulWidget {
  const SeleniumGrid({Key? key}) : super(key: key);

  @override
  State<SeleniumGrid> createState() => _SeleniumGridState();
}

class _SeleniumGridState extends State<SeleniumGrid> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference pages = FirebaseFirestore.instance.collection('Pages');

  @override
  Widget build(BuildContext context) {
    return MasterUI(
      pages: pages,
      routes: 'Selenium grid',
      pageTitle: 'Selenium Grid',
    );
  }
}
