import UIKit

class ManagerWaresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    let dataManager = FakeDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Wares"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WareCell.self, forCellReuseIdentifier: WareCell.reuseIdentifier)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.wares.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WareCell.reuseIdentifier, for: indexPath) as! WareCell

        let ware = dataManager.wares[indexPath.row]
        cell.configure(with: ware)

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWare = dataManager.wares[indexPath.row]
        print("Selected Ware: \(selectedWare.name)")
    }

    // You can add more UITableViewDelegate methods if necessary
}
