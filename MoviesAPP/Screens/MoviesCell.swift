//
//  MoviesCell.swift
//  MoviesAPP
//
//  Created by Elisa Kalil on 01/04/22.
//

import UIKit
import Kingfisher

class MoviesCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 20
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blur = UIVisualEffectView(effect: blurEffect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        return blur
    }()
    
    private lazy var posterView: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFill
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    private lazy var starView: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(systemName: "star")
        star.contentMode = .scaleAspectFill
        star.tintColor = .yellow
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 20)
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var genrerLabel: UILabel = {
        let title = UILabel()
        title.textColor = .lightGray
        title.font = UIFont.systemFont(ofSize: 14)
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var ratingLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 18)
        title.numberOfLines = 1
        return title
    }()
    
    private lazy var majorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, genrerLabel, ratingStack])
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var ratingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ratingLabel, starView])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable) // depreciando o método
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Movie) {
        ratingLabel.text = model.rating?.average?.toString()
        titleLabel.text = model.name
        genrerLabel.text = model.genres?.joined(separator: ", ")
        guard let image = model.image?.medium,
              let imageURL = URL(string: image) else { return }
        
        posterView.kf.setImage(with: imageURL)
    }
    
}

extension MoviesCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(blur)
        containerView.addSubview(majorStack)
        containerView.addSubview(posterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
            posterView.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            posterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterView.widthAnchor.constraint(equalToConstant: 150),
            
            majorStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            majorStack.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 16),
            majorStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            blur.topAnchor.constraint(equalTo: containerView.topAnchor),
            blur.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            blur.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            blur.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            starView.widthAnchor.constraint(equalToConstant: 20),
            starView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = . clear
        contentView.backgroundColor = .clear
    }
}
