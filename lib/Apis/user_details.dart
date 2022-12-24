import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:practise/Apis/Models/user_model_list.dart';
import 'package:practise/Apis/data_controller.dart';

class UserDataDetails extends StatefulWidget {
  const UserDataDetails({super.key});

  @override
  State<UserDataDetails> createState() => _UserDataDetailsState();
}

class _UserDataDetailsState extends State<UserDataDetails> {
  //this is called dependecy injection
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getUserInformationFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => dataController.isDataLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                String image = "";
                String title = "";
                String subtitle = "";

                // initializing the data into variables form api
                try {
                  image = dataController.user_list!.data![i].picture!;
                } catch (e) {
                  image = "";
                }

                try {
                  title = dataController.user_list!.data![i].title!;
                } catch (e) {
                  title = "";
                }

                try {
                  subtitle = dataController.user_list!.data![i].title!;
                } catch (e) {
                  subtitle = "";
                }

                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        dataController.user_list!.data![i].picture!),
                  ),
                  title: Text(dataController.user_list!.data![i].title!),
                  subtitle: Text(dataController.user_list!.data![i].firstName!),
                );
              },
              itemCount: dataController.user_list!.data!.length,
            ),
    ));
  }
}
