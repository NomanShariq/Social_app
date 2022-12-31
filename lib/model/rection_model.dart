import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ReactionModel {
  int like;
  int heart;
  int rocket;
  int coffee;

  ReactionModel({
    required this.like,
    required this.heart,
    required this.rocket,
    required this.coffee,
  }) : super();
}
