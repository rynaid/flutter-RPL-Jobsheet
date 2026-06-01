import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/patch_post.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // 1. GET - Mengambil semua data Posts
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      // Mengubah string JSON menjadi List data dinamis
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Gagal mengambil data posts";
    }
  }

  // 2. PATCH - Memperbarui judul Post secara parsial
  Future<PatchPost> patchPost(int id, String title) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': title}),
    );

    if (response.statusCode == 200) {
      return PatchPost.fromJson(jsonDecode(response.body));
    } else {
      throw "Gagal memperbarui post (PATCH)";
    }
  }
}