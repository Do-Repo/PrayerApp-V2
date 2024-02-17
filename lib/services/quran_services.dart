import 'dart:convert';

import 'package:new_prayer_app/models/quran_model.dart';
import 'package:http/http.dart' as http;

class QuranServices {
  static Future<List<QuranChapter>?> listChapters() async {
    try {
      var url = Uri.parse("https://api.quran.com/api/v4/chapters");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body)['chapters'];
        return jsonResponse.map((e) => QuranChapter.fromMap(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
