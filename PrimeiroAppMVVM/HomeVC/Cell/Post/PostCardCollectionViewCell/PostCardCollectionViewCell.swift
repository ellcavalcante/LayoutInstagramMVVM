//
//  PostCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class PostCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: PostCardCollectionViewCell.self)
    private var screen: PostCardCollectionViewCellScreen = PostCardCollectionViewCellScreen()
    private var viewModel: PostCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addScreen()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addScreen() {
        contentView.addSubview(screen)
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.pin(to: contentView)
    }
    
    public func setUpCell(listPosts: [Posts]) {
        viewModel = PostCardViewModel(listPosts: listPosts)
    }
    
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell()}
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        cell?.setUpCell(data: viewModel.loudCurrentPosts(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
}
