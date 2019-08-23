//
//  ViewController.swift
//  HBPayPassWordDemo
//
//  Created by hivebox_tianjun on 2019/8/23.
//  Copyright © 2019 com.fxbox.www. All rights reserved.
//

import UIKit
import PinLayout
class ViewController: UIViewController {
    private let payPwdView = HBInputPayPassWordView()
    private lazy var cliperBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("密文", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(testPayPwdAction(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var clearBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("明文", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(testPayPwdAction(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(payPwdView)
        view.addSubview(cliperBtn)
        view.addSubview(clearBtn)
        payPwdView.pin.left(16).right(16).vCenter().height(44)
        payPwdView.inputPwdNumber = 6
        payPwdView.payPassWordHandler = { [weak self] passwd in
            print("passWord = \(passwd)")
            if passwd.count == 6 {
                self?.view.endEditing(true)
            }
        }
        
        clearBtn.pin.left(16).height(24).width(80).above(of: payPwdView).margin(20)
        cliperBtn.pin.right(16).height(24).width(80).above(of: payPwdView).margin(20)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc private func testPayPwdAction(_ sender: UIButton) {
        ///密文
        if sender.tag == 1 {
            payPwdView.inputPwdIsClipherText = true
        } else {
            payPwdView.inputPwdIsClipherText = false
        }
    }
}

