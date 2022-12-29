import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CreatePostScreen extends StatefulWidget {
  final Function addpost;
  const CreatePostScreen(this.addpost, {super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titlecont = TextEditingController();
    TextEditingController subtitlecont = TextEditingController();
    TextEditingController descrptionController = TextEditingController();

    void submit() {
      final enteredtitle = titlecont.text;
      final enteredsubtitle = subtitlecont.text;
      final entereddesc = descrptionController.text;
      widget.addpost(enteredtitle, enteredsubtitle, entereddesc);
      Navigator.of(context).pop();
    }

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
                    TextField(
                      onSubmitted: (_) {
                        submit();
                      },
                      controller: titlecont,
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
                    TextField(
                      onSubmitted: (value) => submit(),
                      controller: subtitlecont,
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
                    TextField(
                      onSubmitted: (value) => submit(),
                      controller: descrptionController,
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
                        onPressed: () {
                          submit();
                        },
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
