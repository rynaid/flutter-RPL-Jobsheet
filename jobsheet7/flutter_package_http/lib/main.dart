import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'models/post.dart';
import 'models/patch_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter HTTP Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = _apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter HTTP Mobile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data post.'));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${post.id}')),
                title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Menambahkan 'async' agar 'await' di dalamnya bisa berjalan
        onPressed: () async {
          try {
            // Memanggil fungsi PATCH dari ApiService
            PatchPost result = await _apiService.patchPost(1, "Semarang Hebat");
            
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("PATCH Sukses! ID: ${result.id}, Title: ${result.title}"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Gagal melakukan PATCH: $e"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}