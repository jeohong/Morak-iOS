//
//  PostHeaderView.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit
import Then
import SnapKit

class PostHeaderView: UIView {
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let logoLabel = UILabel().then {
        $0.text = "Morak"
        $0.textColor = .theme.lightYellow
        $0.font = .pretendard.largeTitle
    }
    
    private let notificationButton = UIButton().then {
        if let image = UIImage(named: "ic_bell") {
            let resizedImage = image.resize(to: CGSize(width: 30, height: 30))
            $0.setImage(resizedImage, for: .normal)
        }
    }
    
    private let searchButton = UIButton().then {
        if let image = UIImage(named: "ic_search") {
            let resizedImage = image.resize(to: CGSize(width: 30, height: 30))
            $0.setImage(resizedImage, for: .normal)
        }
    }
    
    private let filterButton = UIButton().then {
        if let image = UIImage(named: "ic_filter") {
            let resizedImage = image.resize(to: CGSize(width: 30, height: 30))
            $0.setImage(resizedImage, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.addSubview(logoImage)
        logoImage.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(20)
        }
        
        self.addSubview(logoLabel)
        logoLabel.snp.makeConstraints {
            $0.leading.equalTo(logoImage.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
        
        self.addSubview(filterButton)
        filterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        
        self.addSubview(searchButton)
        searchButton.snp.makeConstraints {
            $0.trailing.equalTo(filterButton.snp.leading).offset(-10)
            $0.height.width.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        
        self.addSubview(notificationButton)
        notificationButton.snp.makeConstraints {
            $0.trailing.equalTo(searchButton.snp.leading).offset(-10)
            $0.height.width.equalTo(30)
            $0.centerY.equalToSuperview()
        }
    }
}
