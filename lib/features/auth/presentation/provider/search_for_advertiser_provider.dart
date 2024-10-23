import 'dart:async';
import 'package:flutter/material.dart';
class SearchForAdvertiserProvider extends ChangeNotifier {
  List<ResultModel>? list = [];

  Timer? _timer;

  TextEditingController search = TextEditingController();
  void onTextChanged(String val) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () async {
      // searchBranches();
      _timer?.cancel();
    });
  }

  void clear() {
    list?.clear();
  }

  void getResult() {
     list?.clear();
    list = [
      ResultModel(title: "name", description: "زيدان زيدان"),
      ResultModel(title: "subscription_duration", description: "سنه"),
      ResultModel(title: "subscription_type", description: "تجريبي"),
      ResultModel(
          title: "positive_evaluation",
          description: "600",
        //  icon: Images.thumbUpGreenIcon
          ),
      ResultModel(
          title: "negative_evaluation",
          description: "600",
        //  icon: Images.thumbDownRedIcon
          ),
      ResultModel(
          title: "number_of_likes",
          description: "600",
         // icon: Images.favoriteIcon
          ),
    ];
  }
}

class ResultModel {
  final String title;
  final String description;
  final String? icon; // it might take a svg or an Icon
  ResultModel({required this.title, required this.description, this.icon});
}
