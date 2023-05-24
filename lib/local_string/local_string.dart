import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:restaurant_athen_app/main.dart';

class LocalString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": mpEnLng!,
        "gr": mpGrLng!,
      };
}
