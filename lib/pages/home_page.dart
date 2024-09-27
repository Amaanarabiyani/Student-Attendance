import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_attendance/pages/Add_Student.dart';
import 'package:student_attendance/service/database.dart';
import 'package:student_attendance/widget/Blue_text.dart';
import 'package:student_attendance/widget/Text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? studentStream;

  @override
  void initState() {
    getontheLoad();
    super.initState();
  }

  getontheLoad() async {
    studentStream = await DatabaseMethods().getStudents();
    setState(
      () {},
    );
  }

  Widget showStudentList() {
    return StreamBuilder(
      stream: studentStream,
      builder: (context, AsyncSnapshot snapshots) {
        return snapshots.hasData
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                itemCount: snapshots.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot ds = snapshots.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Student Name : ',
                                ),
                                BlueText(
                                  text: ds['Name'],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    await DatabaseMethods()
                                        .deleteStudent(ds.id);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Roll No : ',
                                ),
                                BlueText(
                                  text: ds['Roll Number'],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Age : ',
                                ),
                                BlueText(
                                  text: ds['Age'],
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Attendance :  ',
                                ),
                                ds['Presnt'] == false
                                    ? GestureDetector(
                                        onTap: () async {
                                          await DatabaseMethods()
                                              .updateAttendance(
                                                  'Presnt', ds.id);
                                        },
                                        child: Container(
                                          width: 50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "P",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 50,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "P",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  width: 20,
                                ),
                                ds['Absent'] == false
                                    ? GestureDetector(
                                        onTap: () async {
                                          await DatabaseMethods()
                                              .updateAttendance(
                                                  'Absent', ds.id);
                                        },
                                        child: Container(
                                          width: 50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "A",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 50,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'A',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.to(() => AddStudent());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 40,
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Student ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Attendance',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  showStudentList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
