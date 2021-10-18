import 'package:http/http.dart' as http;

class Api {
  static String serverIP = "127.0.0.1";
  Future<http.Response> fetchAlbum() {
    
     return (http.get(Uri.parse('http://127.0.0.1:3000/classes/2')));
  }
}
