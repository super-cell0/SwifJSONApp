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

        self.view.backgroundColor = .systemCyan
        sheetPresent.delegate = self
        sheetPresentSetting()
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func sheetPresentSetting() {
        sheetPresent.selectedDetentIdentifier = .large
        sheetPresent.prefersGrabberVisible = true
        sheetPresent.detents = [.large(), .medium()]
    }
}
