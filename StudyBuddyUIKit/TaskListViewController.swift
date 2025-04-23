import UIKit

struct Task: Codable {
    var title: String
    var isCompleted: Bool
}

class TaskListViewController: UIViewController {

    @IBOutlet weak var newTaskField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    private var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self
        tasks = loadTasks()
    }

    @IBAction func addTapped(_ sender: UIButton) {
        guard let text = newTaskField.text, !text.isEmpty else { return }
        addTask(text)
        newTaskField.text = ""
        tableView.reloadData()
    }

    private func addTask(_ title: String) {
        let task = Task(title: title, isCompleted: false)
        tasks.append(task)
        saveTasks()
    }

    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: "tasks")
        }
    }

    private func loadTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "tasks"),
              let saved = try? JSONDecoder().decode([Task].self, from: data)
        else { return [] }
        return saved
    }
}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tv: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tv: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "TaskCell",
                                          for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }

    func tableView(_ tv: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tv.deselectRow(at: indexPath, animated: true)
        tasks[indexPath.row].isCompleted.toggle()
        saveTasks()
        tv.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        tasks.remove(at: indexPath.row)
        saveTasks()
        tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }

}
