import 'package:intl/intl.dart';

class TimeUtil {
  /// 把时间戳转成 yyyy-MM-dd HH:mm:Ss
  static String parseTimeStampToShowTime(int timeStamp){
    final f = new DateFormat('yyyy-MM-dd');
    String time = f.format(new DateTime.fromMillisecondsSinceEpoch(timeStamp));
    print("time:$time");
    return time;
  }
}
