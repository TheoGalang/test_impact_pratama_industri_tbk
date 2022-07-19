import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_impact_pratama_group/models/activity_model.dart';
import 'package:test_impact_pratama_group/pages/detail_activity_page.dart';
import 'package:test_impact_pratama_group/pages/home_page.dart';
import 'package:test_impact_pratama_group/services/activity_service.dart';

import '../utils/v_date.dart';
import '../utils/v_widget.dart';

class ActivityController extends GetxController {
  RxInt index = 0.obs;
  final ActivityService _resp = ActivityService();

  final RxList<Activities> _dataActivity = <Activities>[].obs;

  RxList<Activities> get dataActivity => _dataActivity;

  ActivityByIdResponse dataActivityDetail = ActivityByIdResponse();

  RxBool isSelected1 = false.obs;
  RxBool isSelected2 = false.obs;

  TextEditingController activityType = TextEditingController();
  TextEditingController institution = TextEditingController();
  TextEditingController when = TextEditingController();
  TextEditingController objective = TextEditingController();
  TextEditingController remarks = TextEditingController();

  String date = "";

  RxBool isFromEdit = false.obs;

  @override
  void refresh() {
    getActivity();
  }

  @override
  void onReady() {
    getActivity();
    isSelected1.value = true;
    super.onReady();
  }

  getActivity() async {
    Get.dialog(
      const Loading(),
      barrierDismissible: false,
    );
    ActivityResponse _dataActivityresp = await _resp.getActivity();
    Get.back();

    if (_dataActivityresp != null) {
      _dataActivity.value = _dataActivityresp.activities!;
    } else {
      Fluttertoast.showToast(msg: "Fail");
    }
  }

  getActivityById(String id) async {
    Get.dialog(
      const Loading(),
      barrierDismissible: false,
    );
    ActivityByIdResponse _dataActivityresp = await _resp.getActivitybyId(id);
    Get.back();

    if (_dataActivityresp != null) {
      dataActivityDetail = _dataActivityresp;
      activityType.text = dataActivityDetail.activityType!;
      institution.text = dataActivityDetail.institution!;
      when.text = VDate.dateToDisplay(DateTime.parse(dataActivityDetail.when!));
      objective.text = dataActivityDetail.objective!;
      remarks.text = dataActivityDetail.remarks!;
      isFromEdit.value = true;
      Get.to(DetailActivity());
    } else {
      Fluttertoast.showToast(msg: "Fail");
    }
  }

  requestPostActivity() async {
    ActivityRequest data = ActivityRequest()
      ..activityType = activityType.text
      ..when = date
      ..remarks = remarks.text
      ..objective = objective.text
      ..institution = institution.text;

    await postActivity(data.toJson());
    dataActivity.refresh();
    await Get.offAll(() => HomePage());
  }

  requestEditActivity(String id) async {
    ActivityRequest data = ActivityRequest()
      ..activityType = activityType.text
      ..when = date
      ..remarks = remarks.text
      ..objective = objective.text
      ..institution = institution.text;

    await editActivity(data.toJson(), id);
    dataActivity.refresh();
    await Get.offAll(() => HomePage());
  }

  postActivity(Map<String, dynamic> data) async {
    Get.dialog(
      const Loading(),
      barrierDismissible: false,
    );
    ActivityResponse _dataActivitypost = await _resp.postActivity(data);
    Get.back();
    if (_dataActivitypost != null) {
      Fluttertoast.showToast(msg: "Success");
      getActivity();
      activityType.clear();
      institution.clear();
      when.clear();
      objective.clear();
      remarks.clear();
    } else {
      Fluttertoast.showToast(msg: "Fail");
    }
  }

  editActivity(Map<String, dynamic> data, String id) async {
    Get.dialog(
      const Loading(),
      barrierDismissible: false,
    );
    ActivityByIdResponse _dataActivityput =
        await _resp.editActivitybyId(id, data);
    Get.back();
    if (_dataActivityput != null) {
      Fluttertoast.showToast(msg: "Success");
      getActivity();
      activityType.clear();
      institution.clear();
      when.clear();
      objective.clear();
      remarks.clear();
    } else {
      Fluttertoast.showToast(msg: "Fail");
    }
  }
}
