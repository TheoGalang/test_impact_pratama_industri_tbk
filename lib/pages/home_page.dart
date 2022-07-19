import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:test_impact_pratama_group/controller/activity_controller.dart';
import 'package:test_impact_pratama_group/pages/add_activity_page.dart';
import 'package:test_impact_pratama_group/pages/detail_activity_page.dart';
import 'package:test_impact_pratama_group/utils/v_widget.dart';
import 'package:get/get.dart';

import '../utils/color.dart';
import '../utils/v_date.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityController _activityController = Get.put(ActivityController());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddActivity()),
        backgroundColor: VColor.primaryBackground,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: VColor.primaryBackground),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'My Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_sharp),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Profile',
          ),
        ],
        backgroundColor: VColor.primaryBackground,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: VColor.primaryBackground,
            height: 200,
            padding: const EdgeInsets.all(24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Activities",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: () {
                            _activityController.isSelected1.value = true;
                            _activityController.isSelected2.value = false;
                          },
                          child: Obx(
                              () => VButton(height: 50, text: "Open", isSelected: _activityController.isSelected1.value,))),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          _activityController.isSelected2.value = true;
                          _activityController.isSelected1.value = false;
                        },
                          child: Obx(
                            () => VButton(
                        height: 50,
                        text: "Complete",
                        isSelected: _activityController.isSelected2.value,
                      ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Obx(
            () => _activityController.dataActivity.isEmpty
                ? Container()
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GroupedListView<dynamic, String>(
                        elements: _activityController.dataActivity,
                        groupBy: (element) {
                          return element.when.substring(0,10);
                        },
                        groupSeparatorBuilder: (String groupByValue) => Text(
                          VDate.dateToDisplay(DateTime.parse(groupByValue)),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        indexedItemBuilder: (context, element, index) => InkWell(
                          onTap: (){
                            _activityController.getActivityById(element.id);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Text(VDate.forHour(element.when.toString())),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.indigo.shade400,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          height: 50,
                                          child: Text(
                                            element.activityType.toString(),
                                            style: TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        order: GroupedListOrder.ASC,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
