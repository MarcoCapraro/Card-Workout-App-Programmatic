//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Marco Capraro on 2/1/24.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(config: UIButton.Configuration, color: UIColor, title: String, systemImageName: String? = nil) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false

        let textColor: UIColor = config != .plain() ? .systemBackground : color
        configuration = config
        configuration?.title = title
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = textColor
        configuration?.cornerStyle = .medium
                
        guard let systemImage = systemImageName else { return }
        configuration?.image = UIImage(systemName: systemImage)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading
        
        
        
    }


}
