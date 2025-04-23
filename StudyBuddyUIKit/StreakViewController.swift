import UIKit
import Foundation    

class StreakViewController: UIViewController {
    @IBOutlet weak var streakLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStreak()
    }

    func updateStreak() {
        let sessions = loadSessions()
        let streak = calculateStreak(from: sessions)
        streakLabel.text =
          "🔥 Current Streak: \(streak) day" + (streak == 1 ? "" : "s")
    }

    // Loads StudySession array from UserDefaults
    func loadSessions() -> [StudySession] {
        guard let data = UserDefaults.standard.data(forKey: "sessions"),
              let sessions = try? JSONDecoder().decode([StudySession].self, from: data)
        else { return [] }
        return sessions
    }

    // Calculate consecutive days up to today
    func calculateStreak(from sessions: [StudySession]) -> Int {
        let calendar = Calendar.current
        let dates = Set(sessions.map { calendar.startOfDay(for: $0.date) })
        var streak = 0
        var dayOffset = 0

        while dates.contains(
          calendar.date(byAdding: .day, value: -dayOffset, to: Date())!
        ) {
            streak += 1
            dayOffset += 1
        }
        return streak
    }
}
