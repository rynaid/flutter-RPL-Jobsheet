class PatchPost {
  final int id;
  final String title;

  PatchPost({required this.id, required this.title});

  factory PatchPost.fromJson(Map<String, dynamic> json) {
    return PatchPost(
      // Mengamankan jika API mengembalikan id dalam bentuk String atau int
      id: json['id'] is String ? int.parse(json['id']) : (json['id'] as int),
      title: json['title'] ?? '',
    );
  }
}