//
//  HollowView.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/05/05.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class HollowedOutView: UIView {
	var hollowRect: CGRect?{
		didSet{
			guard let hollowRect = hollowRect else {
				return
			}
			
			hollowLayer.bounds = self.bounds
		}
	}
	private let hollowLayer:CALayer = CALayer()
	
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		let path = UIBezierPath(ovalIn: hollowRect ?? CGRect())
		
		if path.contains(point){
			return nil
		}
		
		return self
	}
}
