//
//  WarehouseKeeperViewController.swift
//  YourFlow
//
//  Created by Merati22 on 9/4/1402 AP.
//

import UIKit

class WarehouseKeeperViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let dataManager = FakeDataManager.shared

    var wares: [Ware] = []
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func logOutTapped(_ sender: Any) {
        
        var destinationTabBarController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        UIApplication.shared.windows.first?.rootViewController = destinationTabBarController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Wares"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WareCell.self, forCellReuseIdentifier: WareCell.reuseIdentifier)
        
        wares = dataManager.wares

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wares.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WareCell.reuseIdentifier, for: indexPath) as! WareCell

        let ware = wares[indexPath.row]
        cell.configure(with: ware)

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWare = wares[indexPath.row]
        print("Selected Ware: \(selectedWare.name)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
