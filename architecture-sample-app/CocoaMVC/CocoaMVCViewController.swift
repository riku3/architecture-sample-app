//
//  CocoaMVCViewController.swift
//  architecture-sample-app
//
//  Created by riku on 2021/05/18.
//

import Foundation
import UIKit

final class CocoaMVCViewController: UIViewController {
    var myModel: CocoaMVCModel? {
        didSet {
            registerModel()
        }
    }
    private(set) lazy var myView = CocoaMVCView()
    
    override func loadView() {
        view = myView
    }
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    private func registerModel() {
        guard let model = myModel else {
            return
        }
        myView.label.text = model.count.description
        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil,
                                             using: { [unowned self] notification in
                                                if let count = notification.userInfo?["count"] as? Int {
                                                    self.myView.label.text = "\(count)"
                                                }
                                             })
    }
    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }
}
