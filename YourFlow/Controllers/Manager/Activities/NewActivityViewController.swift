import UIKit

class NewActivityViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        title = "New Activity"
    }

    @IBAction func DoneButtonTapped(_ sender: Any) {
        
        guard
            let name = nameTextField.text,
            let type = typeTextField.text
            
        else {
            // Handle invalid input
            return
        }

        // Create a new User instance
        let newActivity = Activity()
        newActivity.name = name
        newActivity.type = type
        

        // Append the new user to the userEmployees array
        if let managerActivitiesVC = navigationController?.viewControllers.first(where: { $0 is ManagerActivitiesViewController }) as? ManagerActivitiesViewController {
            managerActivitiesVC.activities.append(newActivity)
        }

        // Dismiss the current view controller
        navigationController?.popViewController(animated: true)
    
    }
   
}
