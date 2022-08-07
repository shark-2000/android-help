import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'CustScaffold.dart';

class MasterUI extends StatelessWidget {
  final String routes,pageTitle;
  const MasterUI({

    Key? key,
    required this.pages, required this.routes, required this.pageTitle,
  }) : super(key: key);

  final CollectionReference<Object?> pages;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: pages.doc(routes).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(body: Center(child:Text("Something went wrong")));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return  Scaffold(body: Center(child:Text("Doc doesn't exsist")));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return CustScaffold(
            mkd_src: data["body"].replaceAll(RegExp(r'\\n'), '\n'), pageTitile: pageTitle,);
        }

        return Scaffold(body: Center(child: CircularProgressIndicator(),),);
      },
    );
  }
}
