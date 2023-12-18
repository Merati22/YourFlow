import UIKit

class DetailEmployeeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var taskTableView: UITableView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!

    var selectedUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        setupTableView()

        if let user = selectedUser {
            nameLabel.text = (user.firstName ?? "") + " " + (user.lastName ?? "")
            emailLabel.text = user.email
            phoneNumberLabel.text = String(user.phoneNumber ?? 09123456789)
        }
    }

    func initView() {
        title = "Employee Information"
    }

    func setupTableView() {
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseIdentifier)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedUser?.tasks.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseIdentifier, for: indexPath) as! TaskCell

        if let task = selectedUser?.tasks[indexPath.row] {
            cell.configure(with: task)
        }

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle task selection if needed
    }
}
