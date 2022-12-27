import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Post",
              style: TextStyle(fontSize: 30),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 120 * 4,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title:",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 4,
                          ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subtitle:",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                        width: 4,
                      ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description:",
                      style: TextStyle(fontSize: 24),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                        width: 4,
                      ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text("Submit"),
                        onPressed: () {},
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(84, 44))),
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
