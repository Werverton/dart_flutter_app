import 'dart:convert';

import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:baid_health_dev/screens/care_plan_screen.dart';
import 'package:baid_health_dev/services/care_plan_services.dart';
import 'package:baid_health_dev/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class CarePlanController extends GetxController {
  //final RemoteServices remoteServices;
  var itemCarePlanList = <ItemCarePlan>[].obs;
  var medicamentoList = <Medicamento>[].obs;
  var horarioList = <Horario>[].obs;
  final UserController userController = Get.put(UserController());

  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchDoencas(String token) async {
    var body = await RemoteServices.getItensCarePlan(token);
    final jsonBody = json.decode(body);
    print(body);
    _isLoading.value = true;
    itemCarePlanList.value = [];
    medicamentoList.value = [];
    horarioList.value = [];

    if (jsonBody.isNotEmpty) {
      //final token = jsonBody["itens"];
      //print(jsonBody[0]["itens"]);
      final itens = jsonBody[0]["itens"];
      final medicamentos = jsonBody[0]["medicamentos"];
      final itensString = json.encode(itens);
      print(itensString);

      final medicamentosString = json.encode(medicamentos);
      //pegar horarios
      final horarios = medicamentos[0]["horarios"];
      final horariosString = json.encode(horarios);

      itemCarePlanList.addAll(ItemCarePlan.itemCareFromJson(itensString));
      medicamentoList
          .addAll(Medicamento.medicamentoFromJson(medicamentosString));
      horarioList.addAll(Horario.horarioFromJson(horariosString));
      print(horarioList.value.first);

      _isLoading.value = false;
    } else {
      print("erro");
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document).toString();

    return parsedString;
  }
}
