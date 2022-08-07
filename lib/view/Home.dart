import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:super_scaffold/super_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing_concepts/view/Components/MasterUI.dart';

import 'Components/CustScaffold.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference pages = FirebaseFirestore.instance.collection('Pages');

  @override
  Widget build(BuildContext context) {
    return MasterUI(
      pages: pages,
      routes: 'Home',
      pageTitle: 'Software testing help by shark',
    );
  }
}
