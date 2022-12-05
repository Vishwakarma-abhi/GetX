import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Practise App'),
        ),
        body: Center(
          child: Column(

            children: [
              SizedBox(
                height: 50,
              ),
              
              Text('GetX ',
                style: TextStyle(
                  fontSize: 70
                      ,color: Colors.purple,
                  fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(
                height: 20,
              ),
              //Snackbar
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Message 1', 'Hi Your message ',
                        titleText: Text('Abhijeet'),
                        messageText: Text('Hi I am Abhijeet'),
                        // snackPosition: SnackPosition.BOTTOM,
                        // backgroundColor: Colors.blue,
                        colorText: Colors.black,
                        borderColor: Colors.black,
                        // backgroundGradient:
                        //     LinearGradient(colors: [Colors.red, Colors.green]),
                        // duration: Duration(milliseconds: 5000),
                        borderWidth: 1);
                  },
                  child: Text('Show Snackbar')),


              //Dialog Box
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      // backgroundColor: Color.fromARGB(255, 144, 199, 245),
                      // textCancel: "cancel",
                      // textConfirm: "confirm",
                      // radius: 80,

                      title: 'My Dialog Box',
                      middleText: 'Hey Its Flutter',
                    );
                  },
                  child: Text('Show Dialog')),

              //Bottom Sheet
              ElevatedButton(
                  onPressed: () {
                    //using bottom sheet
                    Get.bottomSheet(Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text('Light Theme'),
                            onTap: () {

                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Dark Theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    ));
                  },
                  child: Text('Bottom Sheet'))
            ],
          ),
        ),
      ),
    );
  }
}
