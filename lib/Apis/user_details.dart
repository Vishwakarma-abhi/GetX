import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:practise/Apis/Models/user_model_list.dart';
import 'package:practise/Apis/controller/data_controller.dart';

class UserDataDetails extends StatefulWidget {
  const UserDataDetails({super.key});

  @override
  State<UserDataDetails> createState() => _UserDataDetailsState();
}

class _UserDataDetailsState extends State<UserDataDetails> {

  //this is called dependency injection
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
        body: Obx(() => dataController.isDataLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _builScreen()
            ),
    );


  }
  Widget _builScreen() {
    return ListView.builder(
        itemCount: dataController.user_list!.data!.length,
        //this will build my items and decide what will be there in the list item controllers
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(dataController
                            .user_list!.data![index].picture!),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataController.user_list!.data! [index].title!
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Text(
                              dataController
                                  .user_list!.data![index].firstName!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(
                              dataController
                                  .user_list!.data![index].lastName!,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}




//Reference Code
/*
 return ListView.builder(
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
    );
* */





