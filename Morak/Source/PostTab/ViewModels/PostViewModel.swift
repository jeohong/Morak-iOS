//
//  PostViewModel.swift
//  Morak
//
//  Created by jeongmin hong on 7/1/25.
//

import RxSwift
import RxCocoa

class PostViewModel {
    struct Input {
        let notificationTap: Observable<Void>
        let searchTap: Observable<Void>
        let filterTap: Observable<Void>
    }
    
    struct Output {
        let showNotification: Observable<Void>
        let showSearch: Observable<Void>
        let showFilter: Observable<Void>
        let posts: Observable<[Post]>
    }
    
    private let postsRelay = BehaviorRelay<[Post]>(value: [])
    
    init() {
        // 초기 더미 데이터
        let dummy = (0..<10).map {
            Post(id: $0, title: "치콩 \($0)", content: "내용입니다 \($0)", likeCount: $0, commentCount: $0 * 2)
        }
        postsRelay.accept(dummy)
    }
    
    func transform(input: Input) -> Output {
        return Output(
            showNotification: input.notificationTap,
            showSearch: input.searchTap,
            showFilter: input.filterTap,
            posts: postsRelay.asObservable()
        )
    }
}
