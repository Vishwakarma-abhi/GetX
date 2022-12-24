import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:practise/Apis/user_details.dart';

class api_testing extends StatefulWidget {
  const api_testing({super.key});

  @override
  State<api_testing> createState() => _api_testingState();
}

class _api_testingState extends State<api_testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' API Testing '),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () => Get.to(UserDataDetails()),
                child: Text('Fetch Data'),
              )
            ],
          ),
        ));
  }
}
