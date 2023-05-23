//
//  PostCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 05/05/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: PostCollectionViewCell.self)
    private var screen: PostCollectionViewCellScreen = PostCollectionViewCellScreen()
    
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
    
    public func setUpCell(data: Posts) {
        screen.profileImageView.image = UIImage(named: data.profileImage)
        screen.userName.text = data.userName
        screen.postImageView.image = UIImage(named: data.postImage)
    }
}
