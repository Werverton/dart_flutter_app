import 'package:baid_health_dev/controller/care_plan_controller.dart';
import 'package:baid_health_dev/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarePlanScreen extends StatefulWidget{
  const CarePlanScreen({super.key});
  
  @override
  State<CarePlanScreen> createState() => _CarePlanScreenState();
}

class _CarePlanScreenState extends State<CarePlanScreen> {
   late final CarePlanController _carePlanController;
  late final RemoteServices remoteServices;
  @override
  void initState() {
    super.initState();
    _carePlanController = CarePlanController(remoteServices: remoteServices);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MyPage')),
        body: Obx(() => ListView.builder(
              itemCount: _carePlanController.itemCarePlanList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${_carePlanController.itemCarePlanList[index].code}"),
                );
              },
            )));
  }
}
 


