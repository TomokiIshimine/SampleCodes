//
//  StackedView.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/07/07.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class StackedView: UIView {
	
	var didTapDeleteButton:((UIView) -> Void)?
	
	@IBOutlet weak var numberLabel: UILabel!
	
	init(num:Int,didTapDeleteButton:((UIView)->Void)?){
		super.init(frame: CGRect())
		loadNib()
		self.numberLabel.text = String("\(num)")
		self.didTapDeleteButton = didTapDeleteButton
	}
	
	override init(frame:CGRect){
		super.init(frame: frame)
		loadNib()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadNib()
	}
	
	private func loadNib() {
		guard let view = Bundle.main.loadNibNamed("StackedView", owner: self, options: nil)?.first as? UIView else{
			Logger.error("Can't load nib.")
			return
		}
		view.frame = self.bounds
		self.addSubview(view)
	}
	
	@IBAction private func tapDeleteButton(_ sender: Any) {
		Logger.info()
		didTapDeleteButton?(self)
	}
}
