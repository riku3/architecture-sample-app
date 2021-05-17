//
//  MVCView.swift
//  architecture-sample-app
//
//  Created by riku on 2021/05/17.
//

import Foundation
import UIKit

final class MVCView: UIView {
    private let label: UILabel
    private let minusButton: UIButton
    private let plusButton: UIButton
    
    var defaultControllerClass: MVCController.Type = MVCController.self
    private var myController: MVCController?
    
    var myModel: MVCModel? {
        didSet {
            registerModel()
        }
    }
    
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    
    override init(frame: CGRect) {
        self.label = UILabel()
        self.minusButton = UIButton()
        self.plusButton = UIButton()
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.label = UILabel()
        self.minusButton = UIButton()
        self.plusButton = UIButton()
        
        super.init(coder: aDecoder)
    }

    private func registerModel() {
        guard let model = myModel else {
            return
        }
        
        let controller = defaultControllerClass.init()
        controller.myModel = model
        myController = controller
        
        label.text = model.count.description
        minusButton.addTarget(controller, action: #selector(MVCController.onMinusTapped), for: .touchUpInside)
        plusButton.addTarget(controller, action: #selector(MVCController.onPlusTapped), for: .touchUpInside)
        
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil,
                                             using: { [unowned self] notification in
                                                if let count = notification.userInfo?["count"] as? Int {
                                                    self.label.text = count.description
                                                }
            
        })
    }
}
