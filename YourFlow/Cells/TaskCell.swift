import UIKit

class TaskCell: UITableViewCell {
    static let reuseIdentifier = "TaskCell"

    // Add any UI elements you need in your cell
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left // Align the name to the left
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85).isActive = true // Set width to 85% of screen width
        return label
    }()

    let durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right // Align the duration to the right
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85).isActive = true // Set width to 85% of screen width
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Customize the cell's appearance
        contentView.addSubview(nameLabel)
        contentView.addSubview(durationLabel)

        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        durationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        durationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Helper method to configure the cell with data
    func configure(with task: Task) {
        let name = task.activity?.name ?? ""
        let duration = task.duration ?? 0

        nameLabel.text = name
        durationLabel.text = "\(duration) minutes"
    }
}
