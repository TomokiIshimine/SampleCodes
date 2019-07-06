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
			setHollowLayer()
		}
	}

	private let hollowLayer:CALayer = CALayer()
	
	private func setHollowLayer(){
		guard let hollowRect = hollowRect else {
			return
		}
		
		//hollowLayerを初期化(くり抜かれていない状態にする)
		hollowLayer.mask = nil
		hollowLayer.frame = self.bounds
		hollowLayer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
		
		//hollowLayerをくり抜くためのマスクを作成(ハイライトする場所が黒く、そのほかの場所が白いmaskを作成する)
		let mask:CAShapeLayer = CAShapeLayer()
		mask.frame = hollowLayer.bounds
		
		//ハイライトする場所の矩形を設定
		let path = UIBezierPath(rect: hollowRect)
		//mask外周の矩形を設定
		path.append(UIBezierPath(rect: mask.bounds))
		
		//マスクを黒色で塗りつぶす
		mask.fillColor = UIColor.white.cgColor
		mask.path = path.cgPath
		
		//fillRuleをevenOddに設定(pathとpashで囲まれた箇所を塗りつぶす)
		mask.fillRule = CAShapeLayerFillRule.evenOdd
		
		//hollowLayerのmaskに指定
		hollowLayer.mask = mask
		
		if self.layer.sublayers == nil{
			Logger.debug("sublayers == 0")
			layer.addSublayer(self.hollowLayer)
		}
	}
	
	override func layoutSublayers(of layer: CALayer) {
		Logger.info()
		setHollowLayer()
	}
	
	override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		let path = UIBezierPath(ovalIn: hollowRect ?? CGRect())
		
		if path.contains(point){
			return nil
		}
		
		return self
	}
}
