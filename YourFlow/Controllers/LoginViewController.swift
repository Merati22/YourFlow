// LoginViewController.swift

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var imageHeader: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet var loginView: UIView!
    
    @IBOutlet var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        keyboardHandle()
                
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil)

        
        updateImageForCurrentTheme()
        
        // Check if the user is already logged in
        if let authToken = AuthenticationManager.shared.getAuthToken(), let role = AuthenticationManager.shared.getUserRole() {
            navigateToHomeScreen(for: role)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tapGesture)

               // Set the delegate for text fields
               usernameTextField.delegate = self
               passwordTextField.delegate = self
    }
    
    @objc override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // Handle trait collection changes, e.g., when the device switches between light and dark mode
        updateImageForCurrentTheme()
    }
    
    func updateImageForCurrentTheme() {
        if self.traitCollection.userInterfaceStyle == .dark {
            // Set the image for dark mode
            imageHeader.image = UIImage(named: "Login-Dark")
        } else {
            // Set the image for light mode
            imageHeader.image = UIImage(named: "Login-Light")
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            // Handle invalid input
            return
        }
        
        var myRole : AuthenticationManager.UserRole
        switch username {
        case "manager":
            myRole = .manager
            
        case "employee":
            myRole = .employee
            
        case "ware":
            myRole = .warehouseKeeper
        
        default:
            myRole = .manager
        }
        
        navigateToHomeScreen(for: myRole)
        
//        AuthenticationManager.shared.authenticate(username: username, password: password) { success, authToken, role in
//            if success, let role = role {
//                // Authentication successful
//                self.navigateToHomeScreen(for: role)
//            } else {
//                // Authentication failed
//                self.showAuthenticationError()
//            }
//        }
    }
    
    func navigateToHomeScreen(for role: AuthenticationManager.UserRole) {
        
        // Navigate to the appropriate home screen based on the user's role
        var destinationTabBarController: UITabBarController?
        
        switch role {
        case .manager:
            destinationTabBarController = storyboard?.instantiateViewController(withIdentifier: "ManagerTabBarController") as? ManagerTabBarController
        case .employee:
            destinationTabBarController = storyboard?.instantiateViewController(withIdentifier: "EmployeeTabBarViewController") as? EmployeeTabBarViewController
        case .warehouseKeeper:
            destinationTabBarController = storyboard?.instantiateViewController(withIdentifier: "WareHouseKeeperTabBarController") as? WareHouseKeeperTabBarController
        }
        
        UIApplication.shared.windows.first?.rootViewController = destinationTabBarController
    }

    func showAuthenticationError() {
        // Handle authentication error (e.g., show an alert)
        let alert = UIAlertController(title: "Authentication Failed", message: "Invalid username or password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func initView() {
        loginView.layer.cornerRadius = 50
        loginBtn.layer.cornerRadius = 10
        usernameTextField.layer.cornerRadius = 50
        passwordTextField.layer.cornerRadius = 50
        
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let convertedKeyboardFrame = view.convert(keyboardFrame, from: nil)
        let overlap = view.frame.maxY - convertedKeyboardFrame.minY - 100
        let offset = max(0, overlap)
        
        // Adjust the constraint constant or frame of your view
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -offset
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        // Reset the frame of your view
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    func keyboardHandle() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == usernameTextField {
                // If Return is pressed in the username text field, move focus to the password text field
                passwordTextField.becomeFirstResponder()
            } else if textField == passwordTextField {
                // If Return is pressed in the password text field, perform login
                loginButtonTapped(loginBtn)
            }
            return true
        }

        @objc func dismissKeyboard() {
            // Dismiss the keyboard when the view is tapped
            view.endEditing(true)
        }
    
}
