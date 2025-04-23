import Foundation

struct StudySession: Identifiable, Codable {
    let id: UUID
    var subject: String
    var date: Date
    var duration: String
    var isCompleted: Bool

    init(subject: String, date: Date, duration: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.subject = subject
        self.date = date
        self.duration = duration
        self.isCompleted = isCompleted
    }
}
