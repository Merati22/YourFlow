import UIKit

class ManagerActivitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let dataManager = FakeDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Activity"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: ActivityCell.reuseIdentifier)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of activities
        return dataManager.activities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCell.reuseIdentifier, for: indexPath) as! ActivityCell

        let activity = dataManager.activities[indexPath.row]
        cell.configure(with: activity)

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle activity selection if needed
        let selectedActivity = dataManager.activities[indexPath.row]
        print("Selected Activity: \(selectedActivity.name)")
    }

    // You can add more UITableViewDelegate methods if necessary
}
