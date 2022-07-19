import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_impact_pratama_group/models/activity_model.dart';

class ActivityService {
  Future<ActivityResponse> getActivity() async {
    String url = "https://62d61e6415ad24cbf2d0fb63.mockapi.io/activities";
    final response = await http.get(
      Uri.parse(url),
    );
    var errorStatus = json.decode(response.body);
    if (errorStatus != null) {
      return ActivityResponse.fromJson(jsonDecode(response.body));
    } else {
      return ActivityResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<ActivityResponse> postActivity(Map<String, dynamic> body) async {
    String url = "https://62d61e6415ad24cbf2d0fb63.mockapi.io/activities";
    final response = await http.post(Uri.parse(url), body: body);
    var errorStatus = json.decode(response.body);
    if (errorStatus != null) {
      return ActivityResponse.fromJson(jsonDecode(response.body));
    } else {
      return ActivityResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<ActivityByIdResponse> getActivitybyId(String id) async {
    String url = "https://62d61e6415ad24cbf2d0fb63.mockapi.io/activities/$id";
    final response = await http.get(
      Uri.parse(url),
    );
    var errorStatus = json.decode(response.body);
    if (errorStatus != null) {
      return ActivityByIdResponse.fromJson(jsonDecode(response.body));
    } else {
      return ActivityByIdResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<ActivityByIdResponse> editActivitybyId(String id, Map<String, dynamic> body) async {
    String url = "https://62d61e6415ad24cbf2d0fb63.mockapi.io/activities/$id";
    final response = await http.put(body: body,
      Uri.parse(url),
    );
    var errorStatus = json.decode(response.body);
    if (errorStatus != null) {
      return ActivityByIdResponse.fromJson(jsonDecode(response.body));
    } else {
      return ActivityByIdResponse.fromJson(jsonDecode(response.body));
    }
  }
}
