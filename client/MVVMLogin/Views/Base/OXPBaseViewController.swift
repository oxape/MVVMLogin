//
//  OXPBaseViewController.swift
//  Easemob
//
//  Created by oxape on 2017/1/10.
//  Copyright © 2017年 oxape. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class OXPBaseViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initData()
        createViews()
        createEvents()
        loadData()
    }
    
    func initData() {
        
    }
    
    func createViews() {
        
    }
    
    func createEvents() {
        
    }
    
    func loadData() {
        
    }
    
}
