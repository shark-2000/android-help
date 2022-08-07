import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Components/MasterUI.dart';

class Cucumber extends StatefulWidget {
  const Cucumber({Key? key}) : super(key: key);

  @override
  State<Cucumber> createState() => _CucumberState();
}

class _CucumberState extends State<Cucumber> {
  @override
  CollectionReference pages = FirebaseFirestore.instance.collection('Pages');

  @override
  Widget build(BuildContext context) {
    return MasterUI(
      pages: pages,
      routes: 'Cucumber',
      pageTitle: 'Cucumber',
    );
  }
}
