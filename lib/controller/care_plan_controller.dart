import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:baid_health_dev/screens/care_plan_screen.dart';
import 'package:baid_health_dev/services/care_plan_services.dart';
import 'package:baid_health_dev/services/remote_services.dart';
import 'package:get/get.dart';

class CarePlanController extends GetxController {
  //final RemoteServices remoteServices;
  var itemCarePlanList = <ItemCarePlan>[].obs;
  final UserController userController = Get.put(UserController());

  final RxBool _isLoading = false.obs;

  //RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchDoencas(String token) async {
    var itens = await RemoteServices.getItensCarePlan(token);
    print(itens);

    if (itens.isNotEmpty) {
      //itemCarePlanList.addAll(itens);
      itemCarePlanList.value = itens;
      print(itemCarePlanList.length);
      //Get.to(() => CarePlanScreen());
    } else {
      print("erro");
    }
  }
}
