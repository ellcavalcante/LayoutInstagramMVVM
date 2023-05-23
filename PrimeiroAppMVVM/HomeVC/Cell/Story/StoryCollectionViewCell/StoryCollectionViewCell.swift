//
//  StoryCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: StoryCollectionViewCell.self)
    private var screen: StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addScreen() {
        contentView.addSubview(screen)
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.pin(to: contentView)
    }
    
    public func setUpCell(data: Stories, indexPath: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.userName
        screen.addButton.isHidden = indexPath.row == 0 ? false : true
    }
    
}
