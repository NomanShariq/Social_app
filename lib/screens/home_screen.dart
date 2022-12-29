import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/create_postscreen.dart';
import 'package:social_app/screens/post_details.dart';
import 'package:social_app/screens/update_postscreen.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titlecont = TextEditingController();
  TextEditingController subtitlecont = TextEditingController();
  TextEditingController descrptionController = TextEditingController();

  final List<PostModel> posts = [];

  void addnewPost(String title, String subtitle, String desc) {
    final newPost = PostModel(
      title: title,
      subtitle: subtitle,
      description: desc,
      id: DateTime.now().toString(),
    );
    setState(() {
      posts.add(newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final postDetails = Provider.of<postData>(context);
    // final rawData = postDetails.items; // var counter = 0.obs;
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
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostDetails(posts: posts[index]))),
                child: Container(
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
                        posts[index].title.toString(),
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(posts[index].subtitle.toString(),
                          style: TextStyle(fontSize: 17)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(posts[index].description.toString()),
                          Text(
                            " less than one minute ago",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => UpdatePostScreen());
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          ),
                          child: Text(
                            "Edit Post",
                            style: TextStyle(),
                          )),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreatePostScreen(addnewPost));
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
