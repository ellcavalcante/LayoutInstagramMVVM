//
//  ViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 01/05/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen? = HomeScreen()
    private var viewModel: HomeViewModel = HomeViewModel()
    override func loadView() {
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.indentifier, for: indexPath) as? StoryCardCollectionViewCell
            cell?.setUpCell(listStory: viewModel.getListStory)
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setUpCell(listPosts: viewModel.getListPosts)
            return cell ?? UICollectionViewCell()
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt(indexPath: indexPath, frame: collectionView.frame)
    }
}

