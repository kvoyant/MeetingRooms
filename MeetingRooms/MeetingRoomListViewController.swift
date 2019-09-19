//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by APPLE on 19/09/2019.
//  Copyright © 2019 yhkim. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {

    //data object
    var meetingRooms:[String:[String:Int]] = ["Meeting":["Banksy":4,"Rivera":8,"kahlo":8,"Picasso":10],"Seminar":["Cezanne":20,"Matisse":30,"Renoir":40]]
    
    //공통함수로 정리 , 리턴타입:딕셔너리
    func meetingRoomsAtIndex(index:Int) -> (key:String, value:[String:Int]) {
        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        return orderedMeetingRooms[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let categoryValues = Array(meetingRooms.values)[section]
//        return categoryValues.count
        
        //$0.1.first!.1 => $0(첫번째 섹션), 1(value:값), first(첫번째), 1(value:값)
        // < 작은게 앞쪽으로 ASC
//        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
//        let rowCount = orderedMeetingRooms[section].1.count
        let rowCount = meetingRoomsAtIndex(index: section).value.count
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
//        let categoryValue = Array(meetingRooms.values)[indexPath.section]
//        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})

//        let categoryValue = orderedMeetingRooms[indexPath.section].1
//        let roomName = Array(categoryValue.keys)[indexPath.row]
//        let capacity = Array(categoryValue.values)[indexPath.row]

        //cell 을 작은숫자 순으로 정렬한다.
//        let categoryValue = orderedMeetingRooms[indexPath.section].1//섹션의 밸류값
        let categoryValue = meetingRoomsAtIndex(index: indexPath.section).value

        let orderedCategoryValue = categoryValue.sorted(by: {$0.1 < $1.1})// < 작은게 앞쪽으로 ASC
        let roomName = orderedCategoryValue[indexPath.row].0
        let capacity = orderedCategoryValue[indexPath.row].1

        cell.textLabel!.text = roomName
        cell.detailTextLabel!.text = "\(capacity)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})

//        return Array(meetingRooms.keys)[section]
//        return orderedMeetingRooms[section].0
        return meetingRoomsAtIndex(index: section).key
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        let rowCount = Array(meetingRooms.values)[section].count
        
//        let orderedMeetingRooms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
//        let rowCount = orderedMeetingRooms[section].1.count
        let rowCount = meetingRoomsAtIndex(index: section).value.count
        return "\(rowCount) rooms"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
