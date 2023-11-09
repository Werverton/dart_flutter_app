import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:baid_health_dev/screens/profile/care_plan_screen.dart';
import 'package:baid_health_dev/services/remote_services.dart';
import 'package:get/get.dart';

class CarePlanController extends GetxController {
  final RemoteServices remoteServices;
  var itemCarePlanList = <ItemCarePlan>[].obs;
  final UserController userController = Get.put(UserController());

  CarePlanController({required this.remoteServices});
  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDoencas();
  }

  void fetchDoencas() async {
    _isLoading.value = true;
    var itens =
        await RemoteServices.getItensCarePlan(userController.token.string);

    if (itens.isNotEmpty) {
      itemCarePlanList.addAll(itens);
      //itemCarePlanList.value = itens;
      //Get.to(() => CarePlanScreen());
      _isLoading.value = false;
    } else {
      print("erro");
    }
  }
}
