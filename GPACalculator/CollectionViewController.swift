//
//  CollectionViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 7/5/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//



import UIKit


class CollectionViewController: UICollectionViewController  {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }

}
  