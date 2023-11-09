import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_unn/domain/api/api_client.dart';
import '../../domain/entity/post.dart';

class ExampleWidgetModels extends ChangeNotifier {

  String myDate1 = '2023.09.01';
  String myDate2 = '2023.09.07';
  String Date1 = '';
  String Date2 = '';

  final apiClient = ApiClient();
  var _less = const <Less>[];
  List<Less> get less => _less;

  Future<void> reloadLess() async {

    var thirtyDaysFromNow1 = DateTime.now().add(new Duration(days: 0));
    String formattedDate1 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow1);
    String readableFormat1 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);
    var thirtyDaysFromNow2 = DateTime.now().add(new Duration(days: 6));
    String formattedDate2 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow2);
    String readableFormat2 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);

    myDate1 = formattedDate1;
    myDate2 = formattedDate2;
    Date1 = readableFormat1;
    Date2 = readableFormat2;

    String Date = 'start=${myDate1}&finish=${myDate2}&lng=1';
    final less = await apiClient.getLess(Date);
    _less += less;
    notifyListeners();
  }

  Future<void> decrementWeek() async {

    DateTime thirtyDaysFromNow1 = DateTime.parse(Date1).subtract(new Duration(days: 7));
    String formattedDate1 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow1);
    String readableFormat1 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);
    DateTime thirtyDaysFromNow2 = DateTime.parse(Date2).subtract(new Duration(days: 1));
    String formattedDate2 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow2);
    String readableFormat2 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);

    myDate1 = formattedDate1;
    myDate2 = formattedDate2;
    Date1 = readableFormat1;
    Date2 = readableFormat2;

    String Date = 'start=${myDate1}&finish=${myDate2}&lng=1';
    final less = await apiClient.getLess(Date);
    _less += less;
    notifyListeners();
  }

  Future<void> incrementWeek() async {

    var thirtyDaysFromNow1 = DateTime.parse(Date1).add(new Duration(days: 7));
    String formattedDate1 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow1);
    String readableFormat1 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);
    var thirtyDaysFromNow2 = DateTime.parse(Date2).add(new Duration(days: 13));
    String formattedDate2 = DateFormat('yyyy.MM.dd').format(thirtyDaysFromNow2);
    String readableFormat2 = DateFormat('yyyy-MM-dd hh:mm:ss').format(thirtyDaysFromNow1);

    myDate1 = formattedDate1;
    myDate2 = formattedDate2;
    Date1 = readableFormat1;
    Date2 = readableFormat2;

    String Date = 'start=${myDate1}&finish=${myDate2}&lng=1';
    final less = await apiClient.getLess(Date);
    _less += less;
    notifyListeners();
  }
}

class ExamleModelsProvider extends InheritedNotifier {
  final ExampleWidgetModels model;

  const ExamleModelsProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static ExamleModelsProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExamleModelsProvider>();
  }

  static ExamleModelsProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExamleModelsProvider>()
        ?.widget;
    return widget is ExamleModelsProvider ? widget : null;
  }
}
