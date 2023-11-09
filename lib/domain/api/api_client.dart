import 'dart:convert';
import 'dart:io';
import '../entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Less>> getLess(String Date) async {

    const String Base = 'https://portal.unn.ru/ruzapi/schedule/'; // Не изминяемая часть
    String Type = 'student/'; // Получаем с запроса поисковой строки
    String Id = '272086?'; // Получаем методом поиска ID
    String date = Date; // Получаем как стандартное время
    final json = await get('$Base$Type$Id$date')
    as List<dynamic>;

    final less = json
        .map((dynamic e) => Less.fromJson(e as Map<String, dynamic>))
        .toList();
    return less;

  }

  Future<dynamic> get(String ulr) async {
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final responce = await request.close();

    final jsonStirngs = await responce.transform(utf8.decoder).toList();
    final jsonStirng = jsonStirngs.join();
    final dynamic json = jsonDecode(jsonStirng);

    return json;
  }
}
