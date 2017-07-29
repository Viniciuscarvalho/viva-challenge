//
//  LoadingViewController.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import SnapKit

class LoadingViewController: UIViewController {
    
    private let alphaView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 0.5)
        view.isOpaque = true
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.startAnimating()
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        
        activityIndicator.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }
        return activityIndicator
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        view.addSubview(alphaView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        alphaView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
}

