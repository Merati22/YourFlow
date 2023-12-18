import UIKit

class EmployeeTasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var currentUser: User?
    var tasks: [Task] = []
    let dataManager = FakeDataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assuming there is a user logged in. You need to set the currentUser based on your authentication logic.
        currentUser = dataManager.userEmployees.first
        tasks = currentUser?.tasks ?? []
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseIdentifier)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseIdentifier, for: indexPath) as! TaskCell
        
        if let task = tasks[safe: indexPath.row] {
            cell.configure(with: task)
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle task selection if needed
        let selectedTask = tasks[indexPath.row]
        print("Selected Task: \(selectedTask.id)")
    }
    
    
    // MARK: - Logout Action
    
    @IBAction func logOutTapped(_ sender: Any) {
        // Implement your logout logic here
        // For example, navigate to the login screen
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = loginViewController
    }
}
    
    // You can add more UITableViewDelegate methods if necessary

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
