import UIKit

class ManagerEmployeesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var userEmployees: [User] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        setupTableView()
        // Load user employees data
        userEmployees = FakeDataManager.shared.userEmployees
    }

    func initView() {
        title = "Employees"
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "employeeCell")
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmployees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) 
        let user = userEmployees[indexPath.row]
        cell.textLabel?.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = userEmployees[indexPath.row]

        // You can navigate to a detailed view controller and pass the selected user for more details
        // For example:
         let detailedViewController = storyboard?.instantiateViewController(withIdentifier: "DetailEmployeeViewController") as! DetailEmployeeViewController
        
         detailedViewController.selectedUser = selectedUser
         navigationController?.pushViewController(detailedViewController, animated: true)
    }
}
