import '../models/post_model.dart';
import '../services/api_client.dart';

class PostRepository {
  final ApiClient apiClient;

  PostRepository(this.apiClient);

  Future<List<Post>> fetchPosts() async {
    final response = await apiClient.get('/posts');
    return (response.data as List).map((json) => Post.fromJson(json)).toList();
  }
}
