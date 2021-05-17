//
//  MVCModel.swift
//  architecture-sample-app
//
//  Created by riku on 2021/05/17.
//
import Foundation

final class MVCModel {
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count" : count])
        }
    }
    func countDown() {count -= 1}
    func countUp() {count += 1}
}
