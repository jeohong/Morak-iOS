//
//  PostViewController.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit
import Then
import SnapKit

class PostViewController: UIViewController {
    // MARK: - Components
    private let headerView = PostHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .theme.point
        setupUI()
    }
}

// MARK: - Custom Functions
extension PostViewController {
    private func setupUI() {
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }
}
