import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_app/model/post_model.dart';
import 'package:social_app/screens/update_postscreen.dart';

class PostDetails extends StatelessWidget {
  final PostModel post;
  final Function deletePost;
  const PostDetails({
    Key? key,
    required this.post,
    required this.deletePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(height: 280),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 5, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        color: Colors.green,
                        onPressed: () {


                          Get.to(
                            UpdatePostScreen(post),
                          );
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        iconSize: 30,
                        color: Colors.red,
                        onPressed: (() => deletePost(post.id)),
                        icon: Icon(Icons.delete)),
                  ],
                )
              ],
            ),
            Text(post.subtitle,
                style: TextStyle(fontSize: 17, color: Colors.grey)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text(post.description)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              " less than one minute ago",
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
