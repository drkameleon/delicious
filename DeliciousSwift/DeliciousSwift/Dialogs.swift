/********************************************************
 | DeliciousSwift
 ********************************************************
 | Copyright (c) 2017 InSili.co.
 | All rights reserved.
 |
 | @File   : Dialogs.swift
 | @Author : Dr.Kameleon
 | @Date   : 11/07/17
 --------------------------------------------------------
 | Dialog-related methods
 ********************************************************/

import Foundation

/**
 Displays alert dialog/sheet
 */
func alertDialog(_ message: String, info: String, handler: @escaping ()->Void, style: NSAlert.Style = .informational, sheet: Bool = true) {
    
    printLog()
    
    let alert = NSAlert()
    
    alert.messageText = message
    alert.informativeText = info
    alert.alertStyle = style
    alert.addButton(withTitle: "OK")
    
    if sheet {
        alert.beginSheetModal(for: NSApplication.shared.mainWindow!, completionHandler: {(response) in
            handler()
        })
    } else {
        alert.runModal()
        handler()
    }
}

/**
 Displays confirmation dialog/sheet
 */
func confirmationDialog(_ message: String, info: String, handler: @escaping (Bool)->Void, first: String = "OK", second: String = "Cancel", style: NSAlert.Style = .informational, sheet: Bool = true) {
    
    printLog()
    
    let alert = NSAlert()
    
    alert.messageText = message
    alert.informativeText = info
    alert.alertStyle = style
    alert.addButton(withTitle: first)
    alert.addButton(withTitle: second)
    
    if sheet {
        alert.beginSheetModal(for: NSApplication.shared.mainWindow!, completionHandler: {(response) in
            handler(response == .alertFirstButtonReturn)
        })
    } else {
        handler(alert.runModal() == .alertFirstButtonReturn)
    }
}

/**
 Displays Open dialog/sheet
 */
func openDialog(handler: @escaping ([String])->Void, otherwise: @escaping ()->Void = {}, files: Bool = true, filetypes: [String] = [], directories: Bool = false, multiple: Bool = true, hidden: Bool = true, sheet: Bool = true) {
    
    printLog()
    
    let panel = NSOpenPanel()
    
    panel.showsResizeIndicator = true
    panel.showsHiddenFiles = hidden
    panel.canChooseFiles = files
    panel.canChooseDirectories = directories
    panel.allowsMultipleSelection = multiple
    panel.treatsFilePackagesAsDirectories = true
    
    if filetypes.count > 0 {
        panel.allowedFileTypes = filetypes
    }
    
    if sheet {
        panel.beginSheetModal(for: NSApplication.shared.mainWindow!, completionHandler: {(response) in
            response == .OK ? handler(panel.urls.map { $0.path })
                : otherwise()
        })
    } else {
        panel.runModal() == .OK ? handler(panel.urls.map { $0.path })
            : otherwise()
    }
}

/**
 Displays Save dialog/sheet
*/
func saveDialog(handler: @escaping (String)->Void, otherwise: @escaping ()->Void = {}, filetypes: [String] = [], sheet: Bool = true) {
    
    printLog()
    
    let panel = NSSavePanel()
    
    if filetypes.count > 0 {
        panel.allowedFileTypes = filetypes
    }
    
    if sheet {
        panel.beginSheetModal(for: NSApplication.shared.mainWindow!, completionHandler: {(response) in
            response == .OK ? handler(panel.url!.path)
                : otherwise()
            
        })
    } else {
        panel.runModal() == .OK ? handler(panel.url!.path)
            : otherwise()
    }
}
