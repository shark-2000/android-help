import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:super_scaffold/super_app_bar_widget.dart';
import 'package:super_scaffold/super_scaffold_widget.dart';
import 'package:get/get.dart';
import 'package:testing_concepts/view/Frameworks/TestNG.dart';
import 'package:testing_concepts/view/Selenium/SeleniumGrid.dart';

import '../Frameworks/Cucumber.dart';
import '../Selenium/SeleniumWebDriver.dart';
class CustScaffold extends StatefulWidget {
  final String mkd_src,pageTitile;


  const CustScaffold({
    Key? key,
    required this.mkd_src, required this.pageTitile,
  }) : super(key: key);

  @override
  State<CustScaffold> createState() => _CustScaffoldState();
}

class _CustScaffoldState extends State<CustScaffold> {
  bool isSeleniumVisible = false;
  bool isTestingvisble = false;
  bool isAPITestingVisible=false;

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      appBar: SuperAppBar(
        title: Text(widget.pageTitile),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Topics",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90,
            ),
            ListTile(
                onTap: () { setState(() {

                      isSeleniumVisible = !isSeleniumVisible;
                    });},
                title: Text(
                  "Selenium Components",
                ),
                trailing: Icon(
                  Icons.arrow_drop_down_circle,
                )),
            Visibility(visible: isSeleniumVisible, child: Selenium()),
            SizedBox(
              height: 30,
            ),
            ListTile(
                onTap: () => setState(() {
                      isTestingvisble = !isTestingvisble;
                    }),
                title: Text(
                  "Testing frameworks",
                ),
                trailing: Icon(
                  Icons.arrow_drop_down_circle,
                )),
            Visibility(
              child: Testing(),
              visible: isTestingvisble,
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
                onTap: () =>setState((){isAPITestingVisible=!isAPITestingVisible;}),
                title: Text(
                  "API Testing",
                ),
                trailing: Icon(
                  Icons.arrow_drop_down_circle,
                )),Visibility(child: ApiTesting(),visible: isAPITestingVisible,)
          ],
        ),
      ),
      body: Markdown(
        selectable: true,
        data: widget.mkd_src,
      ),
    );
  }

  Widget Selenium() {
    return Column(
      children: [
        ListTile(title: Text("Selenium WebDriver"),onTap: ()=>Get.to(SeleniumWebDriver())),
        SizedBox(
          height: 10,
        ),
        ListTile(title: Text("Selenium Grid"),onTap: ()=>Get.to(SeleniumGrid()),),
      ],
    );
  }

  Widget Testing() {
    return Column(
      children: [
        ListTile(title: Text("Cucumber"),onTap: ()=>Get.to(Cucumber()),),
        SizedBox(
          height: 10,
        ),
        ListTile(title: Text("TestNG"),onTap: ()=>Get.to(TestNG()),),
      ],
    );
  }
  Widget ApiTesting() {
    return Column(
      children: [
        ListTile(title: Text("Postman")),
        SizedBox(
          height: 10,
        ),
        ListTile(title: Text("RestAssured")),
      ],
    );
  }
}
