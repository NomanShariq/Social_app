import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/create_postscreen.dart';
import 'package:social_app/screens/update_postscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postDetails = Provider.of<postData>(context);
    final rawData = postDetails.items; // var counter = 0.obs;
    // void increment() {
    //   counter++;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Social App"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView.builder(
            itemCount: rawData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rawData[index].title.toString(),
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(rawData[index].subtitle.toString(),
                        style: TextStyle(fontSize: 17)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(() => UpdatePostScreen());
                            },
                            child: Text(
                              "Edit Post",
                              style: TextStyle(),
                            )),
                        Text(rawData[index].description.toString()),
                        Text(
                          " less than one minute ago",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreatePostScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
























// Widget posts({
//   String? title,
//   String? subtitle,
//   String? description,
// }) {
//   var likeCounter = 0.obs;
//   var emotionCounter = 0.obs;
//   var heartCounter = 0.obs;
//   var rocketCounter = 0.obs;
//   var cakeCounter = 0.obs;

//   void likeincrement() {
//     likeCounter++;
//   }

//   void emotionincrement() {
//     emotionCounter++;
//   }

//   void rocketincrement() {
//     rocketCounter++;
//   }

//   void heartincrement() {
//     heartCounter++;
//   }

//   void cakeincrement() {
//     cakeCounter++;
//   }

//   return Stack(children: [
    //       Row(
    //         children: [
    //           IconButton(
    //             icon: Icon(
    //               Icons.thumb_up,
    //             ),
    //             color: Color.fromARGB(255, 243, 208, 12),
    //             onPressed: () {
    //               likeincrement();
    //             },
    //           ),
    //           Obx(() {
    //             return Text("$likeCounter");
    //           }),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           IconButton(
    //             onPressed: () {
    //               emotionincrement();
    //             },
    //             icon: Icon(
    //               Icons.emoji_emotions,
    //               color: Color.fromARGB(255, 243, 208, 12),
    //             ),
    //           ),
    //           Obx(() {
    //             return Text("$emotionCounter");
    //           }),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           IconButton(
    //             onPressed: () {
    //               heartincrement();
    //             },
    //             icon: Icon(
    //               Icons.favorite,
    //               color: Colors.red,
    //             ),
    //           ),
    //           Obx(() {
    //             return Text("$heartCounter");
    //           }),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           IconButton(
    //             onPressed: () {
    //               rocketincrement();
    //             },
    //             icon: Icon(
    //               Icons.rocket_launch,
    //               color: Colors.blueGrey,
    //             ),
    //           ),
    //           Obx(() {
    //             return Text("$rocketCounter");
    //           }),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           IconButton(
    //             onPressed: () {
    //               cakeincrement();
    //             },
    //             icon: Icon(
    //               Icons.cake,
    //               color: Colors.cyan,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 5,
    //           ),
    //           Obx(() {
    //             return Text("$cakeCounter");
    //           })
    //         ],
    //       ),
//         ],
//       ),
//     ),
//   ]);
// }
