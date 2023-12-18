import UIKit

class NewTaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet var durationTextField: UITextField!

    @IBOutlet var pickerView: UIPickerView!
    
    let dataManager = FakeDataManager.shared

    var selectedActivity: Activity?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        initView()
        selectedActivity = dataManager.activities.first
    }

    func initView() {
        title = "New Task"
    }

    @IBAction func DoneButtonTapped(_ sender: Any) {
        
        guard

            let durationText = durationTextField.text,
            let duration = Int(durationText)
        else {
            // Handle invalid input
            return
        }

        // Create a new User instance
        let newTask = Task()
       
        newTask.duration = duration
        newTask.activity = selectedActivity

        // Append the new user to the userEmployees array
        if let taskVC = navigationController?.viewControllers.first(where: { $0 is EmployeeTasksViewController }) as? EmployeeTasksViewController {
            taskVC.tasks.append(newTask)
        }

        // Dismiss the current view controller
        navigationController?.popViewController(animated: true)
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dataManager.activities.count
        }

        // MARK: - UIPickerViewDelegate

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return dataManager.activities[row].name
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedActivity = dataManager.activities[row]
            // You can do something with the selected activity, if needed
        }
   
}
