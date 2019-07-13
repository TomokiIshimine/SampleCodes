//
//  ActiveStackViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/07/07.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class ActiveStackViewController: UIViewController {
	@IBOutlet weak var activeStackView: UIStackView!
	var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func tapAddViewButton(_ sender: Any) {
		Logger.info()
		let newView = StackedView(
		num: count + 1) { (view) in
			//self.activeStackView.removeArrangedSubview(view)
			view.removeFromSuperview()
			Logger.temp("\(self.activeStackView.subviews)")
			Logger.temp("\(self.activeStackView.subviews.count)")
		}
		newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		newView.translatesAutoresizingMaskIntoConstraints = false
		
//		let newView = UIView()
//		newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//		newView.translatesAutoresizingMaskIntoConstraints = false
//		newView.backgroundColor = UIColor.red
//
//		let button = UIButton()
//		button.setTitle("Delete", for: .normal)
//		button.setTitleColor(UIColor.black, for: .normal)
//		button.sizeToFit()
//		button.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
//		newView.addSubview(button)
		
		activeStackView.addArrangedSubview(newView)
		count += 1
		
		Logger.debug("ActiveStackView : \(String(describing: self.activeStackView))")
//		let newView = UIView()
//		newView.backgroundColor = UIColor.yellow
//		newView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//		newView.translatesAutoresizingMaskIntoConstraints = false
//		Logger.debug("newView : \(newView)")
//		activeStackView.addArrangedSubview(newView)
	}
	
	// ボタンが押された時に呼ばれるメソッド
	@objc func buttonEvent(_ sender: UIButton) {
		guard let superView = sender.superview else {
			Logger.error()
			return
		}
		
		self.activeStackView.removeArrangedSubview(superView)
	}
	
	
	
}
