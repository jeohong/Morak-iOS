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
    }
    
    func transform(input: Input) -> Output {
        return Output(
            showNotification: input.notificationTap,
            showSearch: input.searchTap,
            showFilter: input.filterTap
        )
    }
}
