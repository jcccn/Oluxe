//
//  BaseViewController.swift
//  Oluxe
//
//  Created by Jiang Chuncheng on 2/20/15.
//  Copyright (c) 2015 MorganStark. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        MobClick.beginLogPageView(NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String)
    }
    
    override func viewDidDisappear(animated: Bool) {
        MobClick.endLogPageView(NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String)
        super.viewDidDisappear(animated)
    }

    /**
    修改导航栏的返回按钮为自定义的按钮
    */
    func setNavigationBarBackButton() {
        let button = UIButton(frame: CGRectMake(0, 0, 36, 36))
        button.setImage(UIImage(named: "btn_icon_navi_back"), forState: UIControlState.Normal)
        button.addTarget(self, action: "onBackButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    /**
    根据是否模态弹出视图控制器来自动添加导航上的返回按钮
    */
    func setNavigationBarBackButtonAutomatically() {
        if (self === self.navigationController?.viewControllers.first) {
            setNavigationBarBackButton()
        }
    }
    
    /**
    返回按钮点击事件
    
    :param: sender 按钮
    */
    @IBAction func onBackButtonClicked(sender: UIButton) {
        goBack()
    }
    
    /**
    回退到上一个页面
    */
    func goBack() {
        let popedViewController = self.navigationController?.popToRootViewControllerAnimated(true)
        if ( popedViewController == nil) {
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
