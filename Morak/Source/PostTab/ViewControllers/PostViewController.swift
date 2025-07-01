//
//  PostViewController.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit
import Then
import SnapKit
import RxSwift

class PostViewController: UIViewController {
    // MARK: - Components
    private let disposeBag = DisposeBag()
    private let viewModel = PostViewModel()
    private let headerView = PostHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .theme.point
        setupUI()
        bindViewModel()
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
    
    private func bindViewModel() {
        let input = PostViewModel.Input(
            notificationTap: headerView.notificationButton.rx.tap.asObservable(),
            searchTap: headerView.searchButton.rx.tap.asObservable(),
            filterTap: headerView.filterButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(input: input)
        
        output.showNotification
            .bind { [weak self] in
                print("🔔 알림 보여주기")
            }
            .disposed(by: disposeBag)
        
        output.showSearch
            .bind { [weak self] in
                print("🔍 검색 보여주기")
            }
            .disposed(by: disposeBag)
        
        output.showFilter
            .bind { [weak self] in
                print("🎛️ 필터 보여주기")
            }
            .disposed(by: disposeBag)
    }
}
