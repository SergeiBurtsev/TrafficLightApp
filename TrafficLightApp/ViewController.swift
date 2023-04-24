//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Serj on 23.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    //    private enum State {
    //        case red
    //        case yellow
    //        case green
    //        case initial
    //
    //        func next() -> State {
    //            switch self {
    //            case .red:
    //                return .yellow
    //            case .yellow:
    //                return .green
    //            case .green:
    //                return .red
    //            case .initial:
    //                return .red
    //            }
    //        }
    //    }

    
    private let lightSide: CGFloat = 165
    private var currentLight:UIView?
    //    private var state: State = .initial
    

    
    @IBOutlet var buttonNext: UIButton!
    @IBOutlet var greenViewLight: UIView!
    @IBOutlet var yellowViewLight: UIView!
    @IBOutlet var redViewLight: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNext.setTitle("Start", for: .normal)
        buttonNext.layer.cornerRadius = 15
        buttonNext.layer.masksToBounds = true
        roundViews([greenViewLight, yellowViewLight, redViewLight])
        
    }
    

    
    private func  roundViews(_ views: [UIView]) {
        views.forEach { $0.layer.cornerRadius = lightSide / 2 }
    }
    
    private func setCurrent(_ view: UIView, oldView: UIView?) {
        currentLight = view
        view.alpha = 1
        oldView?.alpha = 0.3
        //        state = state.next()
    }
    

    
    @IBAction func buttonTaped()  {
        
        //        switch state {
        //        case .red:
        //            setCurrent(yellowViewLight, oldView: redViewLight)
        //        case .yellow:
        //            setCurrent(greenViewLight, oldView: yellowViewLight)
        //        case .green:
        //            setCurrent(redViewLight, oldView: greenViewLight)
        //        case .initial:
        //            setCurrent(redViewLight, oldView: nil)
        //        }
        
        
        
        
        if let currentLight = self.currentLight {
            switch currentLight {
            case redViewLight:
                setCurrent(yellowViewLight, oldView: redViewLight)
            case yellowViewLight:
                setCurrent(greenViewLight, oldView: yellowViewLight)
            case greenViewLight:
                setCurrent(redViewLight, oldView: greenViewLight)
            default: break
            }
        } else {
            buttonNext.setTitle("Next", for: .normal)
            setCurrent(redViewLight, oldView: nil)
        }
        
        
        //
        //            if currentLight == redViewLight{
        //                setCurrent(yellowViewLight, oldView: redViewLight)
        //            } else if currentLight == yellowViewLight {
        //                setCurrent(greenViewLight, oldView: yellowViewLight)
        //            } else if currentLight == greenViewLight {
        //                setCurrent(redViewLight, oldView: greenViewLight)
        //            }
        //        } else {
        //            setCurrent(redViewLight, oldView: nil)
        //        }
        
        
    }
}

