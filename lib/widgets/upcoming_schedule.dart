import 'package:baid_health_dev/controller/care_plan_controller.dart';
import 'package:baid_health_dev/model/itens_care_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpcomingSchedule extends StatelessWidget {
  //const UpcomingSchedule({super.key});
  final CarePlanController carePlanController = Get.put(CarePlanController());
    

  @override
  Widget build(BuildContext context) {
    //if (carePlanController.itemCarePlanList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Plano de cuidados'),
        ),
      
    //} else {
      body: Obx(
        () {
      return carePlanController.isLoading.value ?
      Center( 
        child: CircularProgressIndicator(),
        )
        : carePlanController.itemCarePlanList.isEmpty ?
        Center(
          child: Text('Nenhum plano ainda.'),
          )
        :
         ListView.builder(
          itemCount: carePlanController.itemCarePlanList.length,
          itemBuilder: (context, index) {
            return _buildCard(carePlanController, context, index);
          });
  }));
      
  }
    //}
  }

  Widget _buildCard(
      CarePlanController carePlanController, BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    title: Obx(
                      () => Text(
                        "Nome: ${carePlanController.itemCarePlanList[index].nome}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Obx(
                      () => Text(
                          "Quantidade: ${carePlanController.itemCarePlanList[index].quantidade}"),
                    ),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/doctor1.jpg"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      // color: Colors.black,
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Obx(
                            () => Text(
                              "${carePlanController.itemCarePlanList[index].quantidade} x/ ${carePlanController.itemCarePlanList[index].frequencia}",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "10:30 AM",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Obx(
                            () => Text(
                              "${carePlanController.itemCarePlanList[index].observacao}",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6FA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Ver histórico",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7165D6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Aferir agora",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

