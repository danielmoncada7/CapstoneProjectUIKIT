import UIKit

class SessionDetailViewController: UIViewController {
  // The session to display; must be set before push
  var session: StudySession!

  @IBOutlet weak var subjectLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Session Details"
    subjectLabel.text  = session.subject
    dateLabel.text     = session.date.formatted(date: .abbreviated, time: .omitted)
    durationLabel.text = "\(session.duration) mins"
  }
}

