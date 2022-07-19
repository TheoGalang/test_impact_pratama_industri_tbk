import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_impact_pratama_group/utils/v_widget.dart';
import '../controller/activity_controller.dart';
import '../utils/color.dart';
import '../utils/v_date.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddActivity extends StatelessWidget {
  AddActivity({Key? key}) : super(key: key);
  final ActivityController _activityController = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {

    var currentSelectedValue;
    List data = ["Meeting", "Phone Call"];
    List data2 = ["New Order", "Last Order"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: VColor.primaryBackground,
              height: 120,
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _activityController.isFromEdit.value ? "Edit Activity" : "New Activity",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What do you want to do?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.black)),
                    child: DropdownButtonFormField<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      value: _activityController.activityType.text == "" ? currentSelectedValue : _activityController.activityType.text,
                      hint: Text(
                        "Choose Here",
                        style: TextStyle(fontSize: 15),
                      ),
                      items: data
                          .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                              )))
                          .toList(),
                      onChanged: (item) {
                        currentSelectedValue = item;
                        _activityController.activityType.text = item.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Who do you want to meet/call?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: _activityController.institution,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: "CV Anugerah Jaya",
                          suffixIcon: Icon(
                            Icons.search,
                            size: 24,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "When do you want to meet/call CV Anugerah Jaya",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () async {
                      DatePicker.showDateTimePicker(context,
                              theme: DatePickerTheme(
                                  backgroundColor: Colors.white))
                          .then((value) {
                        _activityController.when.text =
                            VDate.dateToDisplay(value!);
                        DateFormat dateFormat =
                            DateFormat("yyyy-MM-dd HH:mm:ss");
                        _activityController.date = dateFormat.format(value);
                      });
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.black)),
                          child: TextFormField(
                            controller: _activityController.when,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              hintText: "01-April-2022 09:00",
                              suffixIcon: Icon(
                                Icons.edit_calendar,
                                size: 24,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Why do you want to meet/call CV Anugerah Jaya",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.black)),
                    child: DropdownButtonFormField<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16)),
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      value: _activityController.objective.text == "" ? currentSelectedValue : _activityController.objective.text,
                      hint: Text(
                        "Choose Here",
                        style: TextStyle(fontSize: 15),
                      ),
                      items: data2
                          .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                              )))
                          .toList(),
                      onChanged: (item) {
                        currentSelectedValue = item;
                        _activityController.objective.text = item.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Could you describe it more details?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: _activityController.remarks,
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: "Add Order Twinlight",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: _activityController.isFromEdit.value ? () => _activityController.requestEditActivity(_activityController.dataActivity.first.id!) : () => _activityController.requestPostActivity(),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white),
                        color: Colors.greenAccent,
                      ),
                      child: Center(
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
