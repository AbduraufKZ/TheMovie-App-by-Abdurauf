class Actor {
  dynamic id;
  final String character;
  final String originalName;
  final String profilePath;

  Actor(
      {
      required this.id,
      required this.character,
      required this.originalName,
      required this.profilePath});

  factory Actor.fromJson(Map<String, dynamic> json) {
  return Actor(
    id: json["id"],
    character: json["character"] ?? '', // Provide default empty string if null
    originalName: json["original_name"] ?? '', // Provide default empty string if null
    profilePath: json["profile_path"] ?? '', // Provide default empty string if null
  );
}

}