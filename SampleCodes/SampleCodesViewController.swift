//
//  ViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/04/28.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class SampleCodesViewController: BaseViewController ,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
		Logger.info()
		self.title = "Sample Codes"
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellSize = CGSize(width: collectionView.frame.size.width/3,height: collectionView.frame.size.width/3)
		Logger.info("collectionViewCellSize : ¥(collectionViewCellSize)")
        return collectionViewCellSize
    }
}

