//
//  CoreTabBarViewController.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

@objc protocol CoreViewController
{
    var title: String {get}
}

final class CoreTabBarViewController: UITabBarController
{
    @objc enum CoreScreen: Int
    {
        case tab1
        case tab2
        case tab3
    }
    
    //MARK: - Properties
    //MARK: -
    //MARK: Public
    static let instance = CoreTabBarViewController()
    
    //MARK: Private
    //Note - add your core custom classes here instead of `UIViewController`
    private lazy var coreViewControllers: [UIViewController] =
    {
        return [MainViewController(), Tab2ViewController(), UIViewController()]
    }()
    
    var currentNavController: UINavigationController?
    {
        guard let index = CoreScreen(rawValue: self.selectedIndex) else { return nil }
        return self.viewController(for: index)
    }
    
    //MARK: - Lifecycle
    //MARK: -
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configure()
    }
    
    //MARK: - Methods
    //MARK: -
    //MARK: Public
    
    func changeTabTo(coreScreen: CoreScreen)
    {
        self.selectedIndex = coreScreen.rawValue
    }
    
    //MARK: Private
    //Creates a new instance, use self.viewControllers to access already existing instances
    private func viewController(for coreScreen: CoreScreen) -> UINavigationController?
    {
        guard let viewControllers = self.viewControllers else { return nil }
        return viewControllers[coreScreen.rawValue] as? UINavigationController
    }
    
    private func configure()
    {
        self.viewControllers = self.coreViewControllers.flatMap
        {
            UINavigationController(rootViewController: $0)
        }
    }

}
