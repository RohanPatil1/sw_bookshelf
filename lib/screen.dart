import 'package:flutter/material.dart';

class UI extends StatelessWidget {

 String subject;
 String SubjectCode;
 UI({this.subject,this.SubjectCode});



  var itemList = [
    "May 2015",
    "Dec 2015",
    "May 2016",
    "Dec 2016",
    "MAy 2017",
    "May 2018"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      child: Text(
                        subject,
                        style: TextStyle(color: Colors.blue[50], fontSize: 24),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.file_download),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Download Syllabus",
                        style:
                            TextStyle(fontSize: 22, color: Colors.green[800]),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Question Paper",
                    style: TextStyle(fontSize: 22),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.85),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {}, //TODO implementation

                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(child: Text("${itemList[index]}")),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
