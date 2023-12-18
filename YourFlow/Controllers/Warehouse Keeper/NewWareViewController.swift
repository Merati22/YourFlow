import UIKit

class NewWareViewController: UIViewController {
    

    @IBOutlet var nameTextField: UITextField!

    @IBOutlet var stockTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }

    func initView() {
        title = "New Ware"
    }

    @IBAction func DoneButtonTapped(_ sender: Any) {
        
        guard

            let stockText = stockTextField.text,
            let nameText = nameTextField.text,
            let stock = Int(stockText)
        else {
            // Handle invalid input
            return
        }

        // Create a new User instance
        let newWare = Ware()
       
        newWare.name = nameText
        newWare.stock = stock

        // Append the new user to the userEmployees array
        if let waresVC = navigationController?.viewControllers.first(where: { $0 is WarehouseKeeperViewController }) as? WarehouseKeeperViewController {
            waresVC.wares.append(newWare)
        }

        // Dismiss the current view controller
        navigationController?.popViewController(animated: true)
    
    }
    
   
}
