import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:signature/signature.dart';

class SignaturController extends GetxController {
  SignatureController signatureController = SignatureController(
      penColor: ColorRes.black,
      penStrokeWidth: 5,
      exportBackgroundColor: ColorRes.white,
      onDrawEnd: () {});
}
