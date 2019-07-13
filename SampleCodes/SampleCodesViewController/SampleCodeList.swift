//
//  SampleCodeList.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/05/01.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

struct SampleCodeModel {
	var name:String?
	var viewController:()->UIViewController?
}

class SampleCodeList: NSObject {
	static let shared = SampleCodeList()
	
	private override init(){}
	
	private var sampleCodeList:[SampleCodeModel] = [
		SampleCodeModel(
			name:"TestSampleCode",
			viewController: {
				let vc = UIViewController()
				vc.title = "TestSampleCode"
				vc.view.backgroundColor = UIColor.white
				return vc
		}),
		SampleCodeModel(
			name:"TutorialSample",
			viewController: {
				let vc = UIStoryboard(name: "TutorialSample", bundle: nil).instantiateInitialViewController()
				
				return vc
		}),
		SampleCodeModel(
			name: "UISamples",
			viewController: {
				let vc = UIStoryboard(name: "UISamples", bundle: nil).instantiateInitialViewController()
				
				return vc
		})
		
		
	]
	
	var count:Int{
		get{
			return sampleCodeList.count
		}
	}
	
	subscript(idx:Int)->SampleCodeModel?{
		get {
			return sampleCodeList[idx]
		}
	}
}
