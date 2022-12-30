import 'package:flutter/material.dart';
import 'package:social_app/model/post_model.dart';

class UpdatePostScreen extends StatefulWidget {
  UpdatePostScreen(this.posts);

  final PostModel posts;

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  _UpdatePostScreenState();

  String id = '';
  final _addformkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _subtitle = TextEditingController();
  final _description = TextEditingController();

  @override
  void onInitState() {
    id = widget.posts.id;
    _title.text = widget.posts.title;
    _subtitle.text = widget.posts.subtitle;
    _description.text = widget.posts.description;
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
                          controller: _title,
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
                          controller: _subtitle,
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
                          controller: _description,
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
