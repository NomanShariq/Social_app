import 'package:flutter/material.dart';

import 'package:social_app/model/post_model.dart';

class UpdatePostScreen extends StatefulWidget {
  const UpdatePostScreen(this.posts) : super(key: null);

  final PostModel posts;

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  final _addformkey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController description = TextEditingController();
  String postTitle = '';
  String postSubtitle = '';
  String postDesc = '';
  void onInitState() {
    postTitle = widget.posts.title;
    postSubtitle = widget.posts.subtitle;
    postDesc = widget.posts.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Update Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Update Form",
              style: TextStyle(fontSize: 30),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 120 * 4,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                    key: _addformkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title:",
                          style: TextStyle(fontSize: 24),
                        ),
                        TextFormField(
                          initialValue: postTitle,
                          controller: title,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                            width: 4,
                          ))),
                          validator: (value) {
                            if (value != null) {
                              return 'please enter a title';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Subtitle:",
                          style: TextStyle(fontSize: 24),
                        ),
                        TextFormField(
                          controller: subtitle,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                            width: 4,
                          ))),
                          validator: (value) {
                            if (value != null) {
                              return 'please enter a subtitle.';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Description:",
                          style: TextStyle(fontSize: 24),
                        ),
                        TextFormField(
                          controller: description,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                            width: 4,
                          ))),
                          validator: (value) {
                            if (value != null) {
                              return 'please enter a description';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Text("Update"),
                            onPressed: () {
                              if (_addformkey.currentState!.validate()) {
                                _addformkey.currentState!.save();
                              }
                            },
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(84, 44))),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
