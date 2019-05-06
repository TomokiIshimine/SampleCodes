//
//  TutorialSampleViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/05/02.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class TutorialSampleViewController: UIViewController {

	@IBOutlet weak var nextButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		

	}
	
	override func viewDidLayoutSubviews() {
		let hollowedOutView = HollowedOutView()
		hollowedOutView.frame = self.view.frame
		
		hollowedOutView.hollowRect = nextButton.frame
		
		self.view.addSubview(hollowedOutView)
	}

}
