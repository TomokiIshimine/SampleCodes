//
//  UISampleCell.swift
//  uiSamples
//
//  Created by 伊志嶺朝輝 on 2019/07/06.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class UISampleCell: UICollectionViewCell {
	static let UISampleCellIdentifer = "UISampleCell"
	private var uiSampleNameLabel:UILabel  = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		uiSampleNameLabel.textColor = UIColor.black
		uiSampleNameLabel.backgroundColor = UIColor.white
		uiSampleNameLabel.font = UIFont.systemFont(ofSize: frame.height/5)
		
		uiSampleNameLabel.text = "testtest"
		
		self.addSubview(uiSampleNameLabel)
		
		self.backgroundColor = UIColor.black
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		//uiSampleNameLabel.sizeToFit()
		uiSampleNameLabel.frame.size = CGSize(width: self.frame.width - 10, height: self.frame.height/6)
		uiSampleNameLabel.frame.origin.x = (self.frame.width - uiSampleNameLabel.frame.width)/2
		uiSampleNameLabel.frame.origin.y = self.frame.height - uiSampleNameLabel.frame.height - 10
		uiSampleNameLabel.adjustsFontSizeToFitWidth = true
		uiSampleNameLabel.minimumScaleFactor = 0.3
	}
	
	var uiSampleModel:UISampleModel?{
		didSet{
			guard let uiSampleModel = uiSampleModel else {
				return
			}
			uiSampleNameLabel.text = uiSampleModel.name
		}
	}
}
