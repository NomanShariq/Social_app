import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/create_postscreen.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/screens/post_details.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var uuid = Uuid();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }

  TextEditingController titlecont = TextEditingController();

  TextEditingController subtitlecont = TextEditingController();

  TextEditingController descrptionController = TextEditingController();

  final List<PostModel> posts = [];

  // editPost(
  //     String postId, String postTitle, String postSubtitle, String postDesc) {
  //   final updatePost = PostModel(
  //       id: postId,
  //       title: postTitle,
  //       subtitle: postSubtitle,
  //       description: postDesc);
  //   setState(() {
  //     posts.replace(updatePost);
  //   });
  //   // var postId = posts.id.toString();
  //   // var postTitle = post.title.toString();
  //   // var postSubtitle = post.subtitle.toString();
  //   // var postDesc = post.description.toString();
  // }

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

  void startaddnewpost(BuildContext ctx) {
    showBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: CreatePostScreen(addnewPost),
          );
        });
  }

  void deletePost(String id) {
    setState(() {
      posts.remove((tx) => tx.id == id);
    });
  }
}
