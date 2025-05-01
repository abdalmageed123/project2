import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project2/core/constants/staterequest.dart';
import 'package:http/http.dart' as http;

String bs = "Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}";
Map<String, String> myh = {'authorization': bs};

class Crud {
  Future<Either<Staterequest, Map>> postdata(String url, Map data) async {

      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return Left(Staterequest.server);
      }
    
  }

  Future<Either<Staterequest, Map>> postdata1(
    String url,
    Map data,
    File? image, [
    String? namerequest,
  ]) async {
    namerequest ??= "files";
    var ur = Uri.parse(url);
    var requeast = http.MultipartRequest("POST", ur);
    requeast.headers.addAll(myh);
    var length = await image!.length();
    var Stream = http.ByteStream(image.openRead());
    Stream.cast();
    var mfile = http.MultipartFile(
      namerequest,
      Stream,
      length,
      filename: basename(image.path),
    );
    requeast.files.add(mfile);
    data.forEach((key, value) {
      requeast.fields[key] = value;
    });
    var myr = await requeast.send();

    var response = await http.Response.fromStream(myr);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return Left(Staterequest.server);
    }
  }
}

init() async {
  Get.put(Crud());
}
