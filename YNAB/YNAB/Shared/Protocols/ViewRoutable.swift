//
//  ViewRoutable.swift
//  YNAB
//
//  Created by Mohamed Kelany on 30/01/2021.
//

import UIKit

public protocol ViewRoutable: class {
    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func push(view: ViewRoutable, animated flag: Bool)
    func pushFromTabbar(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

extension ViewRoutable {
    
    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        
    }
    func push(view: ViewRoutable, animated flag: Bool) {
        
    }
    func pushFromTabbar(view: ViewRoutable, animated flag: Bool) {
        
    }
    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        
    }
}

extension ViewRoutable where Self: UIViewController {
    
    public func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        if  let view = view as? UIViewController {
            present(view, animated: flag, completion: completion)
        }
    }
    
    public func push(view: ViewRoutable, animated flag: Bool) {
        if  let view = view as? UIViewController {
            navigationController?.pushViewController(view, animated: true)
        }
    }
    
    public func pushFromTabbar(view: ViewRoutable, animated flag: Bool) {
        if  let view = view as? UIViewController {
            navigationController?.tabBarController?.push(view: view, animated: true)
        }
    }
    
}
extension UIViewController: ViewRoutable {
    
}

