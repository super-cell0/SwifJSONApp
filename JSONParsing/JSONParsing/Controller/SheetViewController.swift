//
//  SheetViewController.swift
//  JSONParsing
//
//  Created by xiaoxiong beidi on 2022/8/7.
//

import UIKit

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {

    var sheetPresent: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        sheetPresent.delegate = self
        sheetPresentSetting()
    }
    
    private func sheetPresentSetting() {
        sheetPresent.selectedDetentIdentifier = .large
        sheetPresent.prefersGrabberVisible = true
        sheetPresent.detents = [.large(), .medium()]
    }
}
