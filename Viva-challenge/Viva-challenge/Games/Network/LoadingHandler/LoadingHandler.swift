//
//  LoadingHandler.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit

struct LoadingHandler {
    
    static var controller: LoadingViewController?
    
    static func show(on viewController: UIViewController, completion: (() -> Void)? = nil) {
        controller?.dismiss(animated: true, completion: nil)
        controller = LoadingViewController()
        viewController.present(controller!, animated: true, completion: completion)
    }
    
    static func hide(completion: (() -> Void)? = nil) {
        guard let controller = controller else {
            completion?()
            return
        }
        controller.dismiss(animated: true, completion: completion)
        self.controller = nil
    }
    
}

