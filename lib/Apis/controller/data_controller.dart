//actual logic to fetch the data is implemented here using GetXcontroller

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:practise/Apis/Models/user_model_list.dart';

class DataController extends GetxController {
  //object of user model
  User_Model_List? user_list;

  //when the data is loading we need to show a loading inddicator

  var isDataLoading = false.obs;

  // so now we need a method / function to get the data from API
  //this fn. will be async because we are sending request to server which takes time
  getUserInformationFromApi() async {
    //since we need to fetch the data or we want the data so we have " get " request

    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://dummyapi.io/data/v1/user')!,
          headers: {'app-id': '63a5cb5110d477466fb9b186'});

      if (response.statusCode == 200) {
        //data successfully
        //here in result we have the data in the form of map or hashmap -> object
        var result = jsonDecode(response.body);

        user_list = User_Model_List.fromJson(result);
      } else {
        //error
      }
    } catch (e) {
      print("Error while loading");
    } finally {
      isDataLoading(false);
    }
  }
}
