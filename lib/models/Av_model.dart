import 'dart:convert';


class AvModel{
  final String name;
  final String cover;
  final String video;

  AvModel({
    this.name,
    this.cover,
    this.video,
});

  AvModel copyWith({
    String name,
    String cover,
    String video,
  }) {
    return AvModel(
      name: name ?? this.name,
      cover: cover ?? this.cover,
      video: video ?? this.video,
    );
  }

  factory AvModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AvModel(
      name: map['name'],
      cover: map['cover'],
      video: map['video'],
    );
  }

  String toJson() => json.encode(Map());

  factory AvModel.fromJson(String source) => AvModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AvModel(name: $name, cover: $cover, video: $video)';
  }

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is AvModel &&
        o.name == name &&
        o.cover == cover &&
        o.video == video;
  }

    @override
    int get hashCode {
      return name.hashCode ^
      cover.hashCode ^
      video.hashCode;
    }
}