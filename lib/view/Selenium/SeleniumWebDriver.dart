import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Components/MasterUI.dart';

class SeleniumWebDriver extends StatefulWidget {
  const SeleniumWebDriver({Key? key}) : super(key: key);

  @override
  State<SeleniumWebDriver> createState() => _SeleniumWebDriverState();
}

class _SeleniumWebDriverState extends State<SeleniumWebDriver> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference pages = FirebaseFirestore.instance.collection('Pages');

  @override
  Widget build(BuildContext context) {
    return MasterUI(
      pages: pages,
      routes: 'Selenium WebDriver',
      pageTitle: 'Selenium Webdriver',
    );
  }
}