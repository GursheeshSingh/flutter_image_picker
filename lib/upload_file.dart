import 'dart:io';

import 'package:http/http.dart' as http;

class UploadFile {
  bool success;
  String message;

  bool isUploaded;

  Future<void> call(String url, File image) async {
    try {
      var response = await http.put(url, body: image.readAsBytesSync());
      if (response.statusCode == 200) {
        isUploaded = true;
      }
    } catch (e) {
      throw ('Error uploading photo');
    }
  }
}
