//
//  PostCollectionViewCellScreen.swift
//  PrimeiroAppMVVM
//
//  Created by Ellington Cavalcante on 05/05/23.
//

import UIKit

class PostCollectionViewCellScreen: UIView {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setCardShadow()
        view.layer.cornerRadius =  15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var likeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "like-selected")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImageView))
        tap.numberOfTapsRequired = 1
        image.addGestureRecognizer(tap)
        image.isUserInteractionEnabled = true
      image.isHidden = true
        return image
    }()
    
    @objc func tappedLikeImageView() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.likeImageView.center.y += 50
        } , completion: { finished in
            self.likeImageView.center.y -= 50
            self.likeImageView.isHidden = true
        })
    }
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "demo")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default"
        label.font = UIFont.systemFont(ofSize: 14, weight:  .semibold)
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImageView))
        tap.numberOfTapsRequired = 2
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func tappedPostImageView() {
        heartImageView.isHidden = false
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.heartImageView.transform = .init(scaleX: 1.8, y: 1.8)
            self.postImageView.transform = .init(scaleX: 1.05, y: 1.05)
            self.likeImageView.center.y += 50
        } , completion: { finished in
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.postImageView.transform = .identity
                self.likeImageView.center.y -= 50
                self.likeImageView.isHidden = false
            })
            self.heartImageView.transform = .identity
            self.heartImageView.isHidden = true
        })
    }
    
    lazy var heartImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "white-heart")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.isHidden = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(cardView)
        cardView.addSubview(likeImageView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userName)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            cardView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            cardView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
        
            likeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 17),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            
            userName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userName.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            userName.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 17),
            postImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 7),
            postImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -7),
            postImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -7),
            
            heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 70),
            heartImageView.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
}
