//
//  ExerciseViewModel.swift
//  swift4-json-sample
//
//  Created by Ranjith Karuvadiyil on 30/01/19.
//  Copyright © 2019 mistybits. All rights reserved.
//

import Foundation

protocol ExerciseProtocol {
    func loadDatas()
}
class ExerciseViewModel {
    
    var rowsItem = [Rows]()
    var apiManagerObj = APIManager()
    var delegate: ExerciseProtocol
    init?() {
        self.rowsItem = [Rows]()
        return nil
    }
    init(viewDelegate:ExerciseProtocol) {
        delegate = viewDelegate
    }
    func bootstrap() {
        loadData()
    }
    private func loadData() {
        self.apiManagerObj.getDaraFromUrl() { (apidetails, error) in
            if error != nil {
                return
            }
            guard let apiValues = apidetails  else { return }
            self.rowsItem = apiValues.rows
            self.delegate.loadDatas()
        }
    }
}
