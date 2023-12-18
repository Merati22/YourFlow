import Foundation

class FakeDataManager {
    static let shared = FakeDataManager()

    var activities: [Activity] = []
    var roles: [Role] = []
    var userEmployees: [User] = []
    var userManagers: [User] = []
    var userWarehouseKeepers: [User] = []
    var wares: [Ware] = []
    var tasks: [Task] = []

    private init() {
        generateFakeData()
    }

    private func generateFakeData() {
        // Generate fake data for activities
        let meetingActivity = Activity()
        meetingActivity.name = "Meeting"
        meetingActivity.type = "Work"

        let exerciseActivity = Activity()
        exerciseActivity.name = "Exercise"
        exerciseActivity.type = "Health"

        let codingActivity = Activity()
        codingActivity.name = "Codingggggggg"
        codingActivity.type = "Work"

        // Add activities to the array
        activities = [meetingActivity, exerciseActivity, codingActivity]

        // Generate fake data for roles
        let roleManager = Role.manager
        let roleEmployee = Role.employee
        let roleWarehouseKeeper = Role.warehouseKeeper

        // Add roles to the array
        roles = [roleManager, roleEmployee, roleWarehouseKeeper]

        // Generate fake data for employees
        let managerUser = User()
        managerUser.id = 1
        managerUser.role = roleManager
        managerUser.firstName = "John"
        managerUser.lastName = "Doe"
        managerUser.email = "john.doe@example.com"
        managerUser.phoneNumber = 1234567890

        let employeeUser = User()
        employeeUser.id = 2
        employeeUser.role = roleEmployee
        employeeUser.firstName = "Alice"
        employeeUser.lastName = "Smith"
        employeeUser.email = "alice.smith@example.com"
        employeeUser.phoneNumber = 9876543210

        // Add manager and employee to their respective arrays
        userManagers = [managerUser]
        userEmployees = [employeeUser]

        // Generate more fake data for employees
        let employee2 = User()
        employee2.id = 3
        employee2.role = roleEmployee
        employee2.firstName = "Bob"
        employee2.lastName = "Johnson"
        employee2.email = "bob.johnson@example.com"
        employee2.phoneNumber = 5555555555

        let employee3 = User()
        employee3.id = 4
        employee3.role = roleEmployee
        employee3.firstName = "Carol"
        employee3.lastName = "Williams"
        employee3.email = "carol.williams@example.com"
        employee3.phoneNumber = 4444444444

        let employee4 = User()
        employee4.id = 5
        employee4.role = roleEmployee
        employee4.firstName = "David"
        employee4.lastName = "Brown"
        employee4.email = "david.brown@example.com"
        employee4.phoneNumber = 3333333333

        let employee5 = User()
        employee5.id = 6
        employee5.role = roleEmployee
        employee5.firstName = "Eva"
        employee5.lastName = "Taylor"
        employee5.email = "eva.taylor@example.com"
        employee5.phoneNumber = 2222222222

        // Add more employees to the userEmployees array
        userEmployees += [employee2, employee3, employee4, employee5]

        // Generate fake data for warehouse keepers
        let warehouseKeeperUser = User()
        warehouseKeeperUser.id = 7
        warehouseKeeperUser.role = roleWarehouseKeeper
       
        warehouseKeeperUser.firstName = "Frank"
        warehouseKeeperUser.lastName = "Miller"
        warehouseKeeperUser.email = "frank.miller@example.com"
        warehouseKeeperUser.phoneNumber = 1111111111

        let warehouseKeeper2 = User()
        warehouseKeeper2.id = 8
        warehouseKeeper2.role = roleWarehouseKeeper
        warehouseKeeper2.firstName = "Grace"
        warehouseKeeper2.lastName = "Clark"
        warehouseKeeper2.email = "grace.clark@example.com"
        warehouseKeeper2.phoneNumber = 9999999999

        // Add warehouse keepers to the userWarehouseKeepers array
        userWarehouseKeepers = [warehouseKeeperUser, warehouseKeeper2]

        // Generate fake data for wares
        let officeSuppliesWare = Ware()
        officeSuppliesWare.name = "Office Supplies"
        officeSuppliesWare.stock = 100

        let electronicsWare = Ware()
        electronicsWare.name = "Electronics"
        electronicsWare.stock = 50

        let furnitureWare = Ware()
        furnitureWare.name = "Furniture"
        furnitureWare.stock = 30

        // Add wares to the array
        wares = [officeSuppliesWare, electronicsWare, furnitureWare]

        // Generate fake data for tasks
        let task1 = Task()
        task1.id = 101
        task1.duration = 60
        task1.activity = meetingActivity

        let task2 = Task()
        task2.id = 102
        task2.duration = 30
        task2.activity = exerciseActivity

        let task3 = Task()
        task3.id = 103
        task3.duration = 45
        task3.activity = meetingActivity

        let task4 = Task()
        task4.id = 104
        task4.duration = 40
        task4.activity = exerciseActivity

        let task5 = Task()
        task5.id = 105
        task5.duration = 55
        task5.activity = codingActivity

        let task6 = Task()
        task6.id = 106
        task6.duration = 35
        task6.activity = exerciseActivity

        let task7 = Task()
        task7.id = 107
        task7.duration = 50
        task7.activity = meetingActivity

        let task8 = Task()
        task8.id = 108
        task8.duration = 25
        task8.activity = codingActivity

        // Add tasks to the array
        tasks = [task1, task2, task3, task4, task5, task6, task7, task8]

        // Assign tasks to users
        
        userEmployees.forEach { employee in
            employee.tasks = tasks
        }

       

    }
}
