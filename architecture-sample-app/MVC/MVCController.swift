//
//  MVCController.swift
//  architecture-sample-app
//
//  Created by riku on 2021/05/17.
//

import Foundation

class MVCController {
    weak var myModel: MVCModel?
    required init() {}
    @objc func onMinusTapped() {myModel?.countDown()}
    @objc func onPlusTapped() {myModel?.countUp()}
}
