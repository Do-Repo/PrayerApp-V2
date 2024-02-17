import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class QuranChapter {
  int? id;
  String? revelation_place;
  int? revelation_order;
  bool? bismillah_pre;
  String? name_simple;
  String? name_complex;
  String? name_arabic;
  int? verses_count;
  List<dynamic>? pages;
  String? translated_name;
  QuranChapter({
    this.id,
    this.revelation_place,
    this.revelation_order,
    this.bismillah_pre,
    this.name_simple,
    this.name_complex,
    this.name_arabic,
    this.verses_count,
    this.pages,
    this.translated_name,
  });

  factory QuranChapter.fromMap(Map<String, dynamic> map) {
    return QuranChapter(
      id: map['id'] != null ? map['id'] as int : null,
      revelation_place: map['revelation_place'] != null ? map['revelation_place'] as String : null,
      revelation_order: map['revelation_order'] != null ? map['revelation_order'] as int : null,
      bismillah_pre: map['bismillah_pre'] != null ? map['bismillah_pre'] as bool : null,
      name_simple: map['name_simple'] != null ? map['name_simple'] as String : null,
      name_complex: map['name_complex'] != null ? map['name_complex'] as String : null,
      name_arabic: map['name_arabic'] != null ? map['name_arabic'] as String : null,
      verses_count: map['verses_count'] != null ? map['verses_count'] as int : null,
      pages: map['pages'] != null ? List<dynamic>.from((map['pages'] as List<dynamic>)) : null,
      translated_name: map['translated_name']['name'] != null ? map['translated_name']['name'] as String : null,
    );
  }

  factory QuranChapter.fromJson(String source) => QuranChapter.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'revelation_place': revelation_place,
      'revelation_order': revelation_order,
      'bismillah_pre': bismillah_pre,
      'name_simple': name_simple,
      'name_complex': name_complex,
      'name_arabic': name_arabic,
      'verses_count': verses_count,
      'pages': pages,
      'translated_name': translated_name,
    };
  }

  String toJson() => json.encode(toMap());
}
