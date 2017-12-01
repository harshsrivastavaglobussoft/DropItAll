//
//  ViewController.swift
//  DropItAll
//
//  Created by Sumit Ghosh on 01/12/17.
//  Copyright © 2017 Sumit Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var TapButton: UIButton!
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TapButton = UIButton.init(frame: CGRect(x:self.view.frame.size.width/2-20,y:self.view.frame.size.height/2-20,width:40,height:40))
        self.TapButton.backgroundColor = UIColor(red: 0.7373, green: 0.1451, blue: 0, alpha: 1.0)
        self.TapButton .setTitle("Tap", for: UIControlState.normal)
        self.TapButton.addTarget(self, action:#selector(TapButtonAction(sender:)) , for: UIControlEvents.touchUpInside)
        self.TapButton.layer.cornerRadius = TapButton.frame.size.height/2
        self.TapButton.layer.masksToBounds = true
        self.view .addSubview(TapButton)
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        self.gravity = UIGravityBehavior.init()
        self.animator .addBehavior(self.gravity)
        
        
        self.collision = UICollisionBehavior.init()
        self.collision.translatesReferenceBoundsIntoBoundary = true
        self.animator .addBehavior(self.collision)
        
        let path:UIBezierPath = UIBezierPath.init(rect: TapButton.frame)
        self.collision .addBoundary(withIdentifier: "tapButton" as NSCopying, for:path)
        
    
    }


    @objc func TapButtonAction(sender: Any) {
        let FrameID:Int = Int(arc4random() % 6 + 0);
        print (FrameID)
        
        let ColorID:Int = Int(arc4random() % 6 + 0);
        print(ColorID)
        
        let square = UIView.init()
        square.frame = Frame(frameID: FrameID)
        square.backgroundColor = Color(colorId: ColorID)
        self.view .addSubview(square);
        
        collision .addItem(square)
        gravity .addItem(square)
        
        let itemBehavior:UIDynamicItemBehavior = UIDynamicItemBehavior.init(items: [square])
        itemBehavior.elasticity = 0.8
        animator .addBehavior(itemBehavior)
   
        
    }
    
    func Color(colorId:Int)->(UIColor){
        switch colorId {
        case 1:
            return UIColor.red
        case 2:
            return UIColor.gray
        case 3:
            return UIColor.green
        case 4:
            return UIColor.blue
        case 5:
            return UIColor.brown
        default:
            return UIColor.cyan
        }
    }
    func Frame(frameID:Int) -> CGRect {
        switch frameID {
        case 1:
            return CGRect(x:0,y:0,width:30,height:30)
        case 2:
            return CGRect(x:60,y:0,width:30,height:30)
        case 3:
            return CGRect(x:140,y:0,width:30,height:30)
        case 4:
            return CGRect(x:self.view.frame.width-120,y:0,width:50,height:50)
        case 5:
            return CGRect(x:self.view.frame.width-60,y:0,width:50,height:50)
        default:
            return CGRect(x:0,y:0,width:40,height:40)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

