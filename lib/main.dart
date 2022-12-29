import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/create_postscreen.dart';
import 'package:social_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }

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

  void startaddnewpost(BuildContext ctx) {
    showBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: CreatePostScreen(addnewPost),
          );
        });
  }
}
