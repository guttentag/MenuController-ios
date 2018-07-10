//
//  MenuItemTableViewCell.swift
//  MenuController
//
//  Created by Eran Guttentag on 04/07/2018.
//  Copyright © 2018 Gutte. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    static let identifier = "MenuItemTableViewCell"
    
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    private var itemImageView: UIImageView!
    private var selectedIndicator: UIView!
    private var gradientLanyer: CAGradientLayer!
    
    init() {
        super.init(style: .default, reuseIdentifier: MenuItemTableViewCell.identifier)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not ipmlemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            print("SELECTED \(String(describing: self.titleLabel.text))")
        }
        // Configure the view for the selected state
        self.selectedIndicator.isHidden = !selected
        self.gradientLanyer.frame = self.contentView.bounds
        self.gradientLanyer.isHidden = !selected
    }
    
    func set(_ item: MenuItem) {
        self.titleLabel.text = item.itemTitle
        self.subtitleLabel.text = item.itemSubtitle
        self.itemImageView.image = item.itemImage
    }
}

private extension MenuItemTableViewCell {
    func setupViews() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        // Gradient Layer:
        
        self.gradientLanyer = CAGradientLayer()
        self.gradientLanyer.startPoint = CGPoint(x: 0, y: 0.5)
        self.gradientLanyer.endPoint = CGPoint(x: 1, y: 0.5)
        self.gradientLanyer.colors = [UIColor.white.withAlphaComponent(0.4).cgColor, UIColor.white.withAlphaComponent(0.2).cgColor, UIColor.white.withAlphaComponent(0.1).cgColor, UIColor.white.withAlphaComponent(0).cgColor]
        self.contentView.layer.addSublayer(self.gradientLanyer)
        self.gradientLanyer.isHidden = true
        
        // selection indicator:
        
        self.selectedIndicator = UIView()
        self.selectedIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.selectedIndicator.setContentHuggingPriority(UILayoutPriority(300), for: .horizontal)
        self.selectedIndicator.backgroundColor = UIColor.red

        self.contentView.addSubview(self.selectedIndicator)
        self.selectedIndicator.widthAnchor.constraint(equalToConstant: 5).isActive = true
        self.selectedIndicator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.selectedIndicator.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.selectedIndicator.bottomAnchor).isActive = true
        
        // Image View:
        
        self.itemImageView = UIImageView()
        self.itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.itemImageView.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(self.itemImageView)
        self.itemImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.itemImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.itemImageView.leadingAnchor.constraint(equalTo: self.selectedIndicator.trailingAnchor, constant: 15).isActive = true
        
        // Title Label:
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont(name: Fonts.avenirMedium.rawValue, size: 15)
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.setContentHuggingPriority(UILayoutPriority(260), for: .vertical)
        self.titleLabel.setContentHuggingPriority(UILayoutPriority(260), for: .horizontal)
        self.titleLabel.textAlignment = .left
        self.titleLabel.numberOfLines = 1
        self.titleLabel.lineBreakMode = .byTruncatingTail
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.itemImageView.trailingAnchor, constant: 15).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 10).isActive = true
        self.itemImageView.topAnchor.constraint(equalTo: self.titleLabel.topAnchor).isActive = true
        
        // Subitle Label:
        self.subtitleLabel = UILabel()
        self.subtitleLabel.font = UIFont(name: Fonts.avenirRoman.rawValue, size: 12)
        self.subtitleLabel.textColor = UIColor.white
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.setContentHuggingPriority(UILayoutPriority(260), for: .vertical)
        self.subtitleLabel.setContentHuggingPriority(UILayoutPriority(260), for: .horizontal)
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.numberOfLines = 1
        self.subtitleLabel.lineBreakMode = .byTruncatingTail
        
        self.contentView.addSubview(self.subtitleLabel)
        self.subtitleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        self.subtitleLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 15).isActive = true
        self.itemImageView.bottomAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor).isActive = true
    }
}
