//
//  EmployeeViewController.swift
//  YourFlow
//
//  Created by Merati22 on 9/4/1402 AP.
//

import UIKit

class EmployeeTasksViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func logOutTapped(_ sender: Any) {
        
        var destinationTabBarController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        UIApplication.shared.windows.first?.rootViewController = destinationTabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
