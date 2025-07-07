//
//  PostCell.swift
//  Morak
//
//  Created by Hong jeongmin on 7/7/25.
//

import UIKit
import SnapKit

class PostCell: UICollectionViewCell {
    var titleText: String? {
        return titleLabel.text
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
        $0.numberOfLines = 3
    }
    
    private let likeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .red
    }
    
    private let commentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .theme.main
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        
        [titleLabel, contentLabel, likeLabel, commentLabel].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        commentLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeLabel)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(16)
        }
    }
    
    func configure(with post: Post) {
        titleLabel.text = post.title
        contentLabel.text = post.content
        likeLabel.text = "❤️ \(post.likeCount)"
        commentLabel.text = "💬 \(post.commentCount)"
    }
}
