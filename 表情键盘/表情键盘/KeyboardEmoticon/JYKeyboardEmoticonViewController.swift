//
//  JYKeyboardEmoticonViewController.swift
//  表情键盘
//
//  Created by Jinyong on 16/7/27.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class JYKeyboardEmoticonViewController: UIViewController {
    // MARK: - 属性
    
    // MARK: - 系统调用方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.配置子控件
        setupUI()
        
        // 2.添加约束
        setupConstraints()
    }
    
    // MARK: - 监听方法
    @objc func barButtonItemClick(sender: UIBarButtonItem) {
        print(sender)
    }
    
    // MARK: - 内部控制方法
    private func setupUI() {
        self.view.addSubview(emoticonCollectionView)
        self.view.addSubview(emoticonReplaceToolbar)
    }
    
    private func setupConstraints() {
        emoticonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        emoticonReplaceToolbar.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["emoticonCollectionView": emoticonCollectionView, "emoticonReplaceToolbar": emoticonReplaceToolbar]
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[emoticonReplaceToolbar]-0-|", options: .DirectionMask, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[emoticonCollectionView]-0-|", options: .DirectionMask, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[emoticonCollectionView]-0-[emoticonReplaceToolbar(44)]-0-|", options: .DirectionMask, metrics: nil, views: views)
        
        self.view.addConstraints(constraints)
        
        
    }
    
    // MARK: - 懒加载
    /// 表情切换工具栏
    private lazy var emoticonReplaceToolbar: UIToolbar = {
        let tb = UIToolbar()
        let titles = ["最近", "默认", "Emoji", "浪小花"]
        var index = 0
        var items = [UIBarButtonItem]()
        
        items.append(UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil))
        
        for i in 0..<titles.count {
            let item = UIBarButtonItem(title: titles[i], style: .Plain, target: self, action: #selector(self.barButtonItemClick(_:)))
            let flexibleItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            item.tag = index
            index += 1
            items.append(item)
            items.append(flexibleItem)
        }
        
        items.removeLast()
        items.append(UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil))
        tb.tintColor = UIColor.lightGrayColor()
        tb.items = items
        
        return tb
    }()
    
    /// 表情键盘
    private lazy var emoticonCollectionView: UICollectionView = {
        let clv = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
        clv.backgroundColor = UIColor.clearColor()
        return clv
    }()
    
    
    

}
