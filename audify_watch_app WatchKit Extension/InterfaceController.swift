//
//  InterfaceController.swift
//  audify_watch_app WatchKit Extension
//
//  Created by manikandan bangaru on 26/07/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var songs : [String] = ["song 1","song 2","song 3","song 4" , "song 5"]
    
    
    func refreshTableView(){
        self.tableView.setNumberOfRows(songs.count, withRowType: SongsRow.identifier)
        
        for i in 0..<self.tableView.numberOfRows{
            
            let row = self.tableView.rowController(at: i) as! SongsRow
                
            row.songNameLabel.setText(songs[i])
                
            
        }
        self.tableView.scrollToRow(at: songs.count)
    
    
    }
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        print("\(songs[rowIndex]) is selected")
        
        
        self.pushController(withName: "MusicController", context: self.songs[rowIndex])
    }
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.refreshTableView()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
