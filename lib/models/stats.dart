import 'package:shared_preferences/shared_preferences.dart';

class GameStats {
  int totalGames;
  int currentStreak;
  int maxStreak;
  int totalScore;

  GameStats({
    this.totalGames = 0,
    this.currentStreak = 0,
    this.maxStreak = 0,
    this.totalScore = 0,
  });

  // Method to update stats when a game is completed
  void updateStats(bool won) {
    totalGames++;
    if (won) {
      totalScore +=30;
      currentStreak++;
      if (currentStreak > maxStreak) {
        maxStreak = currentStreak;
      }
    } else {
      currentStreak = 0;
    }
    saveStats();
  }

  // Save stats to SharedPreferences
  Future<void> saveStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalGames', totalGames);
    await prefs.setInt('currentStreak', currentStreak);
    await prefs.setInt('maxStreak', maxStreak);
    await prefs.setInt('totalScore', totalScore);
  }

  // Load stats from SharedPreferences
  static Future<GameStats> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    return GameStats(
      totalGames: prefs.getInt('totalGames') ?? 0,
      currentStreak: prefs.getInt('currentStreak') ?? 0,
      maxStreak: prefs.getInt('maxStreak') ?? 0,
      totalScore: prefs.getInt('totalScore') ?? 0,

    );
  }

  // Reset stats (if needed)
  Future<void> resetStats() async {
    totalGames = 0;
    currentStreak = 0;
    maxStreak = 0;
    totalScore = 0;
    await saveStats();
  }
}
