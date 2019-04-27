//
//  TextSizeDevice.swift
//  Device
//
//  Created by Sergey Nazarov on 23/04/2019.
//

import UIKit

@IBDesignable
public class TextSizeDevice: UILabel {
    
    var isNeed = true
    
    @IBInspectable var maxTextSize : Int = 17{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    @IBInspectable var minTextSize : Int = 17{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    @IBInspectable var masterDiagonal : CGFloat = 6.1{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    @IBInspectable var autoMinHeight : Bool = false{
        didSet{
            isNeed = true
            if autoMinHeight{
                minTextSize = Int(9.0)
                maxTextSize = Int(currentSize + 3)
            }
            self.applyTextSize()
        }
    }
    
    @IBInspectable var isShowTextSize : Bool = false{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    
    @IBInspectable var currentSize : CGFloat = 17.0{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    @IBInspectable var strengthenK : CGFloat = 1.0{
        didSet{
            isNeed = true
            self.applyTextSize()
        }
    }
    
    var masterSize: DeviceSize!
    
    func convertMasterToDeviceSize(){
        switch masterDiagonal {
        case DeviceSize.XR_6_1.inch:
            masterSize = DeviceSize.XR_6_1
        case DeviceSize.XS_5_8.inch:
            masterSize = DeviceSize.XS_5_8
        case DeviceSize.XS_Max_6_5.inch:
            masterSize = DeviceSize.XS_Max_6_5
        case DeviceSize.SE_4_0.inch:
            masterSize = DeviceSize.SE_4_0
        case DeviceSize.Eight_4_7.inch:
            masterSize = DeviceSize.Eight_4_7
        case DeviceSize.Eight_Plus_5_5.inch:
            masterSize = DeviceSize.Eight_Plus_5_5
        case DeviceSize.iPad_9_7.inch:
            masterSize = DeviceSize.iPad_9_7
        case DeviceSize.iPadPro_10_5.inch:
            masterSize = DeviceSize.iPadPro_10_5
        case DeviceSize.iPadPro_12_9.inch:
            masterSize = DeviceSize.iPadPro_12_9
        case DeviceSize.iPad_9_7.inch:
            masterSize = DeviceSize.iPad_9_7
        case DeviceSize.Four_3_5.inch:
            masterSize = DeviceSize.Four_3_5
        default:
            masterSize = DeviceSize.uknown
        }
    }
    
    
    func setTextSize(with k: CGFloat){
        isNeed = false
        let size = Int(k*currentSize*strengthenK)
        if size <= maxTextSize{
            if size >= minTextSize{
                self.font = self.font.withSize(CGFloat(size))
            }else{
                self.font = self.font.withSize(CGFloat(minTextSize))
            }
        }else{
            self.font = self.font.withSize(CGFloat(maxTextSize))
        }
        
        if isShowTextSize{
            self.text = "\(self.font.fontName) : \(font.pointSize)"
        }
    }
    
    
    public static func setTextSize(with k: CGFloat, currentSize: CGFloat, strengthenK: CGFloat, maxTextSize: Int, minTextSize: Int, label: UILabel){
        let size = Int(k*currentSize*strengthenK)
        if size <= maxTextSize{
            if size >= minTextSize{
                label.font = label.font.withSize(CGFloat(size))
            }else{
                label.font = label.font.withSize(CGFloat(minTextSize))
            }
        }else{
            label.font = label.font.withSize(CGFloat(maxTextSize))
        }
        
    }
    
    
    func applyTextSize(){
        var k: CGFloat!
        convertMasterToDeviceSize()
        
        
        k = DeviceDiagonal.getDiagonal().inch / masterSize.inch
        setTextSize(with: k)
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if isNeed{
            self.applyTextSize()
        }
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        if isNeed{
            self.applyTextSize()
        }
    }
    
}

public enum DeviceSize {
    case XR_6_1
    case XS_5_8
    case XS_Max_6_5
    case SE_4_0
    case Four_3_5
    case Eight_4_7
    case Eight_Plus_5_5
    case iPad_9_7
    case iPadPro_10_5
    case iPadPro_12_9
    case iPadMini_7_9
    case uknown
}

public extension DeviceSize{
    var inch : CGFloat{
        switch self {
        case .XR_6_1:
            return 6.1
        case .XS_5_8:
            return 5.8
        case .XS_Max_6_5:
            return 6.5
        case .SE_4_0:
            return 4.0
        case .Eight_4_7:
            return 4.7
        case .Eight_Plus_5_5:
            return 5.5
        case .iPad_9_7:
            return 9.7
        case .iPadPro_10_5:
            return 10.5
        case .iPadPro_12_9:
            return 12.9
        case .iPadMini_7_9:
            return 7.9
        case .Four_3_5:
            return 3.5
        case .uknown:
            return 4.7
        }
    }
}
