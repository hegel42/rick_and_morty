import 'dart:convert';

class CharactersResponse {
  CharactersResponse({required this.charactersList, required this.pages});
  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
      charactersList: (json['characters']['results'] as List)
          .map((characterJson) => Character.fromMap(characterJson))
          .toList(),
      pages: json['characters']['info']['pages'],
    );
  }
  final List<Character> charactersList;
  final int pages;
}

class Character {
  Character({
    required this.gender,
    required this.id,
    required this.image,
    required this.name,
    required this.status,
    required this.type,
  });

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        gender: json['gender'],
        id: json['id'],
        image: json['image'],
        name: json['name'],
        status: json['status'],
        type: json['type'],
      );
  final String? gender;
  final String? id;
  final String? image;
  final String? name;
  final String? status;
  final String? type;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'id': id,
        'image': image,
        'name': name,
        'status': status,
        'type': type,
      };
}
