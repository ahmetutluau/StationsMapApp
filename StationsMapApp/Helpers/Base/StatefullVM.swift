//
//  StatefullVM.swift
//  StationsMapApp
//
//  Created by Ahmet Utlu on 15.02.2023.
//

import Foundation

protocol StateChange { }

class StatefulVM<StateChange>: NSObject {
    var dispatchGroup = DispatchGroup()
    
    typealias StateChangeHandler = ((StateChange) -> Void)
    
    private var stateChangeHandler: StateChangeHandler?
    
    final func subscribe(_ handler: @escaping StateChangeHandler) {
        stateChangeHandler = handler
    }
    
    final func emit(_ change: StateChange) {
        stateChangeHandler?(change)
    }
    
}
