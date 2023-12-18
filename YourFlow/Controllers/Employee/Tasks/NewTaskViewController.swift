import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        title = "New Employee"
    }

    @IBAction func DoneButtonTapped(_ sender: Any) {
        
        guard
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let email = emailTextField.text,
            let phoneNumberText = phoneNumberTextField.text,
            let phoneNumber = Int(phoneNumberText)
        else {
            // Handle invalid input
            return
        }

        // Create a new User instance
        let newUser = User()
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.phoneNumber = phoneNumber

        // Append the new user to the userEmployees array
        if let managerEmployeesVC = navigationController?.viewControllers.first(where: { $0 is ManagerEmployeesViewController }) as? ManagerEmployeesViewController {
            managerEmployeesVC.userEmployees.append(newUser)
        }

        // Dismiss the current view controller
        navigationController?.popViewController(animated: true)
    
    }
   
}
