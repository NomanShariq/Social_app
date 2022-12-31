import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'rection_model.dart';

class PostModel extends ChangeNotifier {
  String id;
  String title;
  String subtitle;
  String description;
  ReactionModel reactions =
      new ReactionModel(like: 0, heart: 0, rocket: 0, coffee: 0);

  PostModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super();
}
