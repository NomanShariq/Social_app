import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/update_postscreen.dart';

class PostDetails extends StatelessWidget {
  final PostModel posts;
  const PostDetails({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
        centerTitle: true,
      ),
      body: Container(
        height: 150,
        width: 400,
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
              posts.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(posts.subtitle, style: TextStyle(fontSize: 17)),
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
                Text(posts.description),
                Text(
                  " less than one minute ago",
                  style: TextStyle(fontStyle: FontStyle.italic),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
