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

  var uuid = Uuid();

  final List<PostModel> posts = [
    PostModel(
        id: "1",
        title: "This is first post",
        subtitle: "subtitle",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
    PostModel(
        id: "2",
        title: "This is second post",
        subtitle: "subtitle",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book,"),
    PostModel(
        id: "3",
        title: "This is third post",
        subtitle: "subtitle",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
  ];

  void addnewPost(String title, String subtitle, String desc) {
    final newPost = PostModel(
      title: title,
      subtitle: subtitle,
      description: desc,
      id: uuid.v4(),
    );
    setState(() {
      posts.add(newPost);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              return Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetails(
                                  post: posts[index],
                                  deletePost: (String id) {
                                    setState(() {
                                      posts
                                          .removeWhere((post) => post.id == id);
                                    });
                                    Navigator.pop(context);
                                  },
                                ))),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts[index].title.toString(),
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(posts[index].subtitle.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  posts[index].description.toString(),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            " less than one minute ago",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
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