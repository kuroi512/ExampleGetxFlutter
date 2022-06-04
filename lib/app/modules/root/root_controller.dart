import 'package:get/get.dart';

class RootController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed('/intro');
    });
  }

  @override
  void onClose() {}
}
