import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taskly/model/project.dart';

import 'package:http/http.dart' as http;

class ProjectApiProvider {
  String token = "0d3d9c3c9a4599d3cef1b52404bfd276763cf602";
  Future<List<Project>> fetchProjects() async {
    http.Client client;

    final response = await client.get(
      'https://api.todoist.com/rest/v1/projects',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    // Use the compute function to run parseProjects in a separate isolate.
    return compute(parseProjects, response.body);
  }

// A function that converts a response body into a List<Project>.
  List<Project> parseProjects(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Project>((json) => Project.fromJson(json)).toList();
  }
}
