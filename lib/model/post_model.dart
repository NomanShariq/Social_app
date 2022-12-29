import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class PostModel extends ChangeNotifier {
  String id;
  String title;
  String subtitle;
  String description;

  PostModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super();
}

class postData with ChangeNotifier {
  final List<PostModel> _items = [
    PostModel(
        id: "1",
        title: "Short Note",
        subtitle: "subtitle",
        description: "description"),
    PostModel(
        id: "2",
        title: "Short Note",
        subtitle: "subtitle",
        description: "description"),
    PostModel(
        id: "3",
        title: "Short Note",
        subtitle: "subtitle",
        description: "description"),
  ];

  List<PostModel> get items {
    return [..._items];
  }

  PostModel findById(String id) {
    return _items.firstWhere((post) => post.id == id);
  }
}
