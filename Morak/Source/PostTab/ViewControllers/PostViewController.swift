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
    // MARK: - Properties
    private var posts: [Post] = []
    
    // MARK: - Components
    private let disposeBag = DisposeBag()
    private let viewModel = PostViewModel()
    private let headerView = PostHeaderView()
    private let postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        if let layout = $0.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical // 수직 스크롤
            layout.minimumLineSpacing = 20
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        }
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
    }
    
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
        
        self.view.addSubview(postCollectionView)
        postCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        postCollectionView.dataSource = self
        postCollectionView.delegate = self
        postCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
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
        
        output.posts
            .observe(on: MainScheduler.instance)
            .bind { [weak self] items in
                self?.posts = items
                self?.postCollectionView.reloadData()
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - CollectionView DataSource, Delegate
extension PostViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UICollectionViewCell()
        }
        let post = posts[indexPath.item]
        cell.configure(with: post) // 셀에 데이터 전달
        return cell
    }
    
    // 셀 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalHorizontalPadding: CGFloat = 25 * 2
        let width = collectionView.frame.width - totalHorizontalPadding
        return CGSize(width: width, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = posts[indexPath.item]
        print(post.title)
    }
}
