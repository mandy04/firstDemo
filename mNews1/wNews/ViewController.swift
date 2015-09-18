//
//  ViewController.swift
//  wNews
//
//  Created by llbt on 15/6/12.
//  Copyright (c) 2015年 llbt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var _dataArray : NSMutableArray!
    var _adArray = Array<adModel>()
    var _bookArray = Array<bookModel>()
    //全局的表单控件
    var _tableView : UITableView!
    
    func createAdData(){
        //初始化数组
        _adArray = Array()
        for i in 0...3{
            //model模型层
            var aModel = adModel()
            aModel.adimage = "image\(i).png"
            aModel.adTitle = "图片\(i)的标题"
            _adArray.append(aModel)
        }
    }
    
    func createBookData(){
        //初始化书数据源
        _bookArray = Array()
        var path = NSBundle.mainBundle().pathForResource("bookData.plist", ofType: nil)
        //创建一个临时数组
        var tempArray = NSArray(contentsOfFile: path!)!
        
        //数组中保存字典
        for item in tempArray {
            let dict = item as Dictionary<String,String>
            var bModel = bookModel()
            bModel.bookImage = dict["icon"]!
            bModel.booktitle = dict["title"]!
            bModel.bookPrice = dict["price"]!
            bModel.bookInfo = dict["detail"]!
            _bookArray.append(bModel)
        }
        
    }
    
    func createUI() {
        self.createAdData()
        self.createBookData()
        
        _tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), style: UITableViewStyle.Plain)
        _tableView.delegate = self
        _tableView.dataSource = self
//        _tableView.separatorColor = UIColor.grayColor()
        _tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(_tableView)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if (indexPath.row == 0) {
            return 180;
        }
        return 70;
    }

     func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return _bookArray.count + 1
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let identifier = "adCelId"
            var cell: adTableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? adTableViewCell
            if (cell == nil) {
                cell = adTableViewCell(style: .Default, reuseIdentifier: identifier)
            }
            cell?.createAdCellWithArray(_adArray)
            return cell!
        }else
        {
            let identifier = "CellIdentifier"
            var cell: bookTableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? bookTableViewCell
            if cell == nil
            {
                cell = bookTableViewCell(style: .Default, reuseIdentifier: identifier)
                
            }
            cell?.bModel = _bookArray[indexPath.row - 1]
            cell?.loadData()
            return cell!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

