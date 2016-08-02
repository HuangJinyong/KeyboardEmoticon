//
//  ViewController.swift
//  表情键盘
//
//  Created by Jinyong on 16/7/25.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "dfas[哈哈]fd[好爱哦]af[嘻嘻]d"
        
        textView.attributedText = JYKeyboardPackage.createAttributedString(str, font: textView.font!)
        textView.inputView = keyboardEmoticonVC.view
    }

    private lazy var keyboardEmoticonVC: JYKeyboardEmoticonViewController = JYKeyboardEmoticonViewController { [weak self](emoticon) in
        self!.textView.insertEmoticon(emoticon)
    }
 
    
    // 获取文本的
    @IBAction func buttonClick(sender: UIButton) {
   
        print(textView.replaceEmoticonAttributedString())
        
    }

}

