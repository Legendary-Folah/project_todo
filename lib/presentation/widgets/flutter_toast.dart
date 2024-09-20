import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_todo/constants/colors/colors.dart';

class CustomFlutterToast {
  CustomFlutterToast._();

  static Future<bool?> successFlutterToast(String msg) async {
    return await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: ColorsConst.purple,
      textColor: ColorsConst.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<bool?> errorFlutterToast(String msg) async {
    return await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: ColorsConst.error,
      textColor: ColorsConst.white,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
