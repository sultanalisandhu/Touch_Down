import 'package:get_storage/get_storage.dart';
import 'package:touch_down/utils/constants.dart';

class LocalStorage{
  static final GetStorage _storage= GetStorage();
  static const String bearerToken = 'bearerToken';
  static const String userId = 'userId';
  static const String coachId = 'coachId';
  static const String playerId = 'playerId';



  static void write(String key, dynamic value){
    _storage.write(key, value);
    printWarning('key from method write: $key  value: $value');
  }
  static dynamic read(String key) {
    dynamic value = _storage.read(key) ?? '';
    printWarning('Read key: $key  value: $value');
    return value;
  }

  static void remove(String key){
    _storage.remove(key);
  }

  static dynamic eraseAllLocalStorage(){
    _storage.erase();
  }

  // /// setters
  //  setBearerToken(String token) async {
  //   await _storage.write(_bearerToken, token);
  //   if (kDebugMode) {
  //     print('tokenIS: $token: readToken: $bearerToken');
  //   }
  // }
  //
  // static  setUserId(id) async {
  //   await _storage.write(_loginUserId, id);
  //   if (kDebugMode) {
  //     print('Id: $id: currentUserId: $currentUserId');
  //   }
  // }
  // Future<void> setCoachId(String id) async {
  //   await _storage.write(_coachIdKey, id);
  //   if (kDebugMode) {
  //     print('Coach ID: $id');
  //   }
  // }
  // String get bearerToken=> _storage.read(_bearerToken)??'';
  // String get currentUserId => _storage.read(_loginUserId) ?? '';
  // String get currentCoachId => _storage.read(_coachIdKey)??'cfcc1add-6e22-44a1-9cbd-c0c15541a170';

}