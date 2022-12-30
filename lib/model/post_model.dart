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