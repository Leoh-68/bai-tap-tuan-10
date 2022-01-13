import 'package:baitaptuan_10/Model/hinh_anh_dia_danh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:baitaptuan_10/Model/dia_danh.dart';
import 'package:baitaptuan_10/Model/hinh_anh_dia_danh.dart';

String urlBaseAPI = "http://10.0.2.2:8001/api/";
Future<List<DiaDanh>> api_GetAll_DiaDanh() async {
  List<DiaDanh> lstSanPham = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "DiaDanh"));
    if (response.statusCode == 200) {
      //nay von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay
      lstSanPham = jsonRaw.map((data) => DiaDanh.fromJson(data)).toList();
    } else {
      throw Exception(
          "Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lstSanPham;
}

Future<List<DiaDanh>> api_Find_DiaDanh(String TenDiaDanh) async {
  List<DiaDanh> lstSanPham = [];
  try {
    final response = await http
        .post(Uri.parse(urlBaseAPI + "TimKiem?TenDiaDanh=$TenDiaDanh"));
    if (response.statusCode == 200) {
      //nay von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay
      lstSanPham = jsonRaw.map((data) => DiaDanh.fromJson(data)).toList();
    } else {
      throw Exception(
          "Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lstSanPham;
}

Future<String> api_Image_DiaDanh(int? id) async {
  HinhAnhDiaDanh lstSanPham = HinhAnhDiaDanh();
  try {
    final response = await http.post(
        Uri.parse(urlBaseAPI + "LayHinhAnhTheoDiaDanh"),
        body: {"id": "$id"});
    if (response.statusCode == 200) {
      //nay von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay
      lstSanPham = HinhAnhDiaDanh.fromJson(jsonRaw);
    } else {
      throw Exception(
          "Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPham.duongDan.toString();
}

Future<DiaDanh> api_Hot_DiaDanh() async {
  DiaDanh lstSanPham = DiaDanh();
  try {
    final response =
        await http.post(Uri.parse(urlBaseAPI + "LayDiaDanhHotNhat"));
    if (response.statusCode == 200) {
      final jsonRaw = json.decode(response.body);
      lstSanPham = DiaDanh.fromJson(jsonRaw);
    } else {
      throw Exception(
          "Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPham;
}

Future<List<DiaDanh>> api_Finds_DiaDanh(String TenDiaDanh) async {
  List<DiaDanh> lstSanPham = [];
  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "TimKiem"), body: {"name": "$TenDiaDanh"});
    if (response.statusCode == 200) {
      //nay von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay
      lstSanPham = jsonRaw.map((data) => DiaDanh.fromJson(data)).toList();
    } else {
      throw Exception(
          "Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lstSanPham;
}
