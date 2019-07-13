//
//  UISumplesList.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/07/06.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

struct UISampleModel{
	var name:String?
	var viewController:()->UIViewController?
}

class UISamplesList: NSObject {
	static let shared = UISamplesList()
	
	private override init(){}
	
	private var uiSamplesList:[UISampleModel] = [
		UISampleModel(
			name: "ActiveStackView",
			viewController: {
				return UIStoryboard(name: "ActiveStackView", bundle: nil).instantiateInitialViewController()
				
		})
	]
	
	var count:Int{
		get{
			return uiSamplesList.count
		}
	}
	
	subscript(idx:Int)->UISampleModel?{
		get {
			return uiSamplesList[idx]
		}
	}
}
