import 'package:shared_preferences/shared_preferences.dart';

class SebhaStorage {
  static const _counterKey = 'sebha_counter';
  static const _lastTimeKey = 'sebha_last_time';

  static Future<int> loadCounterWithResetCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;

    final lastTime = prefs.getInt(_lastTimeKey) ?? 0;
    final diff = now - lastTime;

    if (diff >= 86400000) {
      await prefs.remove(_counterKey);
      await prefs.setInt(_lastTimeKey, now);
      return 0;
    }

    return prefs.getInt(_counterKey) ?? 0;
  }

  static Future<void> saveCounterWithTime(int counter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, counter);
    await prefs.setInt(_lastTimeKey, DateTime.now().millisecondsSinceEpoch);
  }
}
