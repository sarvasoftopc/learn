import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:learn/models/itemdata_model.dart';
import 'api_constants.dart';

class ApiService {
  Future<List<ItemData>> fetchAlphabetItems() async {
    final url = ApiConstants.getAlphabetItemsUrl;
    debugPrint('📤 Sending GET request to: $url');
    final response = await http.get(Uri.parse(url));
    debugPrint('📥 Received response with status: ${response.statusCode}');
    debugPrint('📄 Response body: ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      final itemList  = jsonList.map((jsonItem) => ItemData.fromJson(jsonItem)).toList();
      debugPrint('✅ Parsed ${itemList.length} items from JSON.');

      return itemList;
    } else {
      debugPrint('❌ Failed to load alphabet items. Status Code: ${response.statusCode}');
      throw Exception('Failed to load alphabet items');
    }
  }

  Future<List<ItemData>> fetchNumberItems() async {
    final url = ApiConstants.getNumberItemsUrl;
    debugPrint('📤 Sending GET request to: $url');
    final response = await http.get(Uri.parse(url));
    debugPrint('📥 Received response with status: ${response.statusCode}');
    debugPrint('📄 Response body: ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      final itemList  = jsonList.map((jsonItem) => ItemData.fromJson(jsonItem)).toList();
      debugPrint('✅ Parsed ${itemList.length} items from JSON.');

      return itemList;
    } else {
      debugPrint('❌ Failed to load alphabet items. Status Code: ${response.statusCode}');
      throw Exception('Failed to load alphabet items');
    }
  }

// Add similar methods for fruits, animals, etc.
}
