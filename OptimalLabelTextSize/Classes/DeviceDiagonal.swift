//
//  DeviceDiagonal.swift
//  OptimalLabelTextSize
//
//  Created by Sergey Nazarov on 23/04/2019.
//

import Foundation
import UIKit

public class DeviceDiagonal{
    public static func getDiagonal() -> CGFloat{
        let scale = UIScreen.main.scale
        
        let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163);
        
        let width = UIScreen.main.bounds.size.width * scale
        let height = UIScreen.main.bounds.size.height * scale
        
        let horizontal = width / ppi, vertical = height / ppi;
        
        let diagonal = CGFloat(sqrt(pow(horizontal, 2) + pow(vertical, 2)))
        return diagonal
    }
}

