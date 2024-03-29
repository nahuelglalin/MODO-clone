//
//  BottomSheetViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 12/01/2024.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var bottomSheetContainer: UIView!
    @IBOutlet weak var dragIndicator: UIView!
    
    override func viewDidLoad() {
        dragIndicator.layer.cornerRadius = 4
        bottomSheetContainer.layer.cornerRadius = 15
    }
}
