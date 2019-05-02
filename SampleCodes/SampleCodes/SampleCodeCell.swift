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
		
		//sampleCodeNameLabel.sizeToFit()
		sampleCodeNameLabel.frame.size = CGSize(width: self.frame.width - 10, height: self.frame.height/6)
		sampleCodeNameLabel.frame.origin.x = (self.frame.width - sampleCodeNameLabel.frame.width)/2
		sampleCodeNameLabel.frame.origin.y = self.frame.height - sampleCodeNameLabel.frame.height - 10
		sampleCodeNameLabel.adjustsFontSizeToFitWidth = true
		sampleCodeNameLabel.minimumScaleFactor = 0.3
	}
	
	var sampleCodeModel:SampleCodeModel?{
		didSet{
			guard let sampleCodeModel = sampleCodeModel else {
				return
			}
			sampleCodeNameLabel.text = sampleCodeModel.name
		}
	}
}
