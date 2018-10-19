//
//  loadingPresenter.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/19/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation

class loadingPresenter: NSObject {
    var shared: ApiManager
    override init() {
        shared = ApiManager()
    }
}
