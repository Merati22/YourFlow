// AuthenticationManager.swift

import Foundation

class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    private var authToken: String?
    private var currentUserRole: UserRole?
    
    // Simulate user roles
    enum UserRole: String {
        case manager
        case employee
        case warehouseKeeper
    }
    
    func authenticate(username: String, password: String, completion: @escaping (Bool, String?, UserRole?) -> Void) {
        // Simulate API request to obtain the token and role
        let apiUrl = "http://yourflow.meetam.ir:8000/api/users/auth/login"
        guard let url = URL(string: apiUrl) else {
            completion(false, nil, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Add any necessary headers or body parameters
        let requestBody: [String: Any] = [
            "username": username,
            "password": password,
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        } catch {
            completion(false, nil, nil)
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Hide loading indicator here

            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(false, nil, nil)
                }
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let authToken = json["key"] as? String,
                   let roleString = json["role"] as? String,
                   let role = UserRole(rawValue: roleString) {
                    
                    self.authToken = authToken
                    self.currentUserRole = role
                    
                    DispatchQueue.main.async {
                        completion(true, authToken, role)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false, nil, nil)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(false, nil, nil)
                }
            }
        }
        
        
        task.resume()
    }
    
    func getAuthToken() -> String? {
        return authToken
    }
    
    func getUserRole() -> UserRole? {
        return currentUserRole
    }
}
