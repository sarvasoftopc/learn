import 'package:flutter/material.dart';

class ItemData {
  final String iconAsset;
  final String title;
  final String description;
  final Color backgroundColor;

  ItemData({
    required this.iconAsset,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      title: json['title'],
      description: json['description'],
      iconAsset: json['iconAsset'],
      backgroundColor: Color(int.parse(json['backgroundColor'])), // HEX color code
    );
  }
}
