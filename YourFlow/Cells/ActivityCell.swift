import UIKit

class ActivityCell: UITableViewCell {
    static let reuseIdentifier = "ActivityCell"

    // Add any UI elements you need in your cell
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left // Align the name to the left
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85).isActive = true // Set width to 85% of screen width
        return label
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right // Align the stock to the center
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85).isActive = true // Set width to 85% of screen width
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Customize the cell's appearance
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)

        // Set up constraints (center vertically)
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        typeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Helper method to configure the cell with data
    func configure(with activity: Activity) {
        nameLabel.text = activity.name
        typeLabel.text = activity.type
    }
}
