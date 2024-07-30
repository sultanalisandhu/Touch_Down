import 'package:get_storage/get_storage.dart';

class LocalStorage{
  final GetStorage _storage= GetStorage();
  final String _bearerToken = 'bearerToken';
  final String _loginUserId = 'loginUserId';
  static LocalStorage? _instance;

  /// getters
  static LocalStorage get instance {
    _instance ??= LocalStorage._init();
    return _instance!;
  }
  LocalStorage._init();

  /// setters
  Future<void> setBearerToken(String token) async {
    await _storage.write(_bearerToken, token);
    print('tokenIS: $token: readToken: $bearerToken');
  }

  Future<void> setUserId(id) async {
    await _storage.write(_loginUserId, id);
    print('Id: $id: currentUserId: $currentUserId');
  }
  int get currentUserId => _storage.read(_loginUserId);

  String get bearerToken=> _storage.read(_bearerToken)??'';

}