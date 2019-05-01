//
//  SampleCodeCell.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/04/30.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class SampleCodeCell: UICollectionViewCell {
	static let SampleCodeCellIdentifer = "SampleCodeCell"
	private var sampleCodeNameLabel:UILabel  = UILabel()
	private var sampleCodeId:Int = -1
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		sampleCodeNameLabel.textColor = UIColor.black
		sampleCodeNameLabel.backgroundColor = UIColor.white
		sampleCodeNameLabel.font = UIFont.systemFont(ofSize: frame.height/5)
		
		sampleCodeNameLabel.text = "testtest"
		
		self.addSubview(sampleCodeNameLabel)
		
		self.backgroundColor = UIColor.black
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		sampleCodeNameLabel.sizeToFit()
		sampleCodeNameLabel.frame.origin.x = (self.frame.width - sampleCodeNameLabel.frame.width)/2
		sampleCodeNameLabel.frame.origin.y = self.frame.height * 4 / 5 - sampleCodeNameLabel.frame.height
	}
}
