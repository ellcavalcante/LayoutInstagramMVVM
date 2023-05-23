//
//  StoryCardCollectionViewCell.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = String(describing: StoryCardCollectionViewCell.self)
    private var screen: StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
    private var viewModel: StoryCardViewModel?
    
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
    
    public func setUpCell(listStory: [Stories]) {
        viewModel = StoryCardViewModel(listStory: listStory)
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemsInSection ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        cell?.setUpCell(data: viewModel.loudCurrentStory(indexPath: indexPath), indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}
