import UIKit

class ManagerHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var dateAndTime: UILabel!
    @IBOutlet var taskTableView: UITableView!

    private var timer: Timer?
    private var tasks: [Task] = []

    @IBAction func logOutTapped(_ sender: Any) {
        // Handle logout
        
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = loginViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        fetchTasks()
        setupTableView()
    }

    func initView() {
        startTimer()
    }

    func fetchTasks() {
        // Assuming you have a data manager to fetch tasks
        tasks = FakeDataManager.shared.tasks
        taskTableView.reloadData()
    }

    func setupTableView() {
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseIdentifier)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseIdentifier, for: indexPath) as! TaskCell

        let task = tasks[indexPath.row]
        cell.configure(with: task)

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle task selection if needed
        let selectedTask = tasks[indexPath.row]
        print("Selected Task: \(selectedTask.id)")
    }

    func startTimer() {
        // Set up a timer to update the date and time label every second
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateDateAndTime()
        }

        // Manually update the date and time label for the first time
        updateDateAndTime()
    }

    func updateDateAndTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateTime = Date()
        let formattedDate = dateFormatter.string(from: currentDateTime)

        dateAndTime.text = formattedDate
    }

    deinit {
        // Invalidate the timer to prevent memory leaks
        timer?.invalidate()
        timer = nil
    }
    
  
}
