//
//  CocoaMVCView.swift
//  architecture-sample-app
//
//  Created by riku on 2021/05/18.
//

import Foundation
import UIKit

final class CocoaMVCView: UIView {
    let label: UILabel
    let minusButton: UIButton
    let plusButton: UIButton
    
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
}
