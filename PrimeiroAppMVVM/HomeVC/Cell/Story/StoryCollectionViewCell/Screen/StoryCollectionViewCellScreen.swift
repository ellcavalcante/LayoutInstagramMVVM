//
//  StoryCollectionViewCellScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class StoryCollectionViewCellScreen: UIView {
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.5
        return button
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(profileImageView)
        addSubview(addButton)
        addSubview(userNameLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            addButton.widthAnchor.constraint(equalToConstant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            addButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        
        ])
    }
}
