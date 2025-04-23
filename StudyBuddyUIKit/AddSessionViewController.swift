import UIKit
import Foundation

class AddSessionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var durationField: UITextField!
    @IBOutlet weak var sessionsTableView: UITableView!

    private var sessions: [StudySession] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        sessionsTableView.dataSource = self
        sessionsTableView.delegate   = self
        sessions = fetchSessions()
    }

    @IBAction func saveSessionTapped(_ sender: UIButton) {
        guard let subject = subjectField.text, !subject.isEmpty,
              let duration = durationField.text, !duration.isEmpty else { return }

        let newSession = StudySession(subject: subject,
                                      date: datePicker.date,
                                      duration: duration)
        sessions.append(newSession)
        saveSessions()
        subjectField.text = ""
        durationField.text = ""
        sessionsTableView.reloadData()
    }

    private func fetchSessions() -> [StudySession] {
        guard let data = UserDefaults.standard.data(forKey: "sessions"),
              let saved = try? JSONDecoder().decode([StudySession].self, from: data)
        else { return [] }
        return saved
    }

    private func saveSessions() {
        if let data = try? JSONEncoder().encode(sessions) {
            UserDefaults.standard.set(data, forKey: "sessions")
        }
    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sessions.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath)
        let session = sessions[indexPath.row]

        // configure the text
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let dateString = formatter.string(from: session.date)
        cell.textLabel?.text =
            "\(session.subject) - \(session.duration) mins on \(dateString)"

        // show or hide checkmark
        cell.accessoryType = session.isCompleted
            ? .checkmark
            : .none

        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sessions.remove(at: indexPath.row)
            saveSessions()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - TableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sessions[indexPath.row].isCompleted.toggle()
        saveSessions()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
