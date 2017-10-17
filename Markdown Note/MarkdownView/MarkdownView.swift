//
//  MarkdownView.swift
//  Markdown Note
//
//  Created by 謝佳瑋 on 2017/8/30.
//  Copyright © 2017年 謝佳瑋. All rights reserved.
//

import UIKit

class MarkdownView: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let file = "file.md" //this is the file. we will write to and read from it
        
        let text = "# This is H1\n```python\n\na=\"Hello world!\"\n\n```\n\n![Hello World](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAAAUCAAAAAAVAxSkAAABrUlEQVQ4y+3TPUvDQBgH8OdDOGa+oUMgk2MpdHIIgpSUiqC0OKirgxYX8QVFRQRpBRF8KShqLbgIYkUEteCgFVuqUEVxEIkvJFhae3m8S2KbSkcFBw9yHP88+eXucgH8kQZ/jSm4VDaIy9RKCpKac9NKgU4uEJNwhHhK3qvPBVO8rxRWmFXPF+NSM1KVMbwriAMwhDgVcrxeMZm85GR0PhvGJAAmyozJsbsxgNEir4iEjIK0SYqGd8sOR3rJAGN2BCEkOxhxMhpd8Mk0CXtZacxi1hr20mI/rzgnxayoidevcGuHXTC/q6QuYSMt1jC+gBIiMg12v2vb5NlklChiWnhmFZpwvxDGzuUzV8kOg+N8UUvNBp64vy9q3UN7gDXhwWLY2nMC3zRDibfsY7wjEkY79CdMZhrxSqqzxf4ZRPXwzWJirMicDa5KwiPeARygHXKNMQHEy3rMopDR20XNZGbJzUtrwDC/KshlLDWyqdmhxZzCsdYmf2fWZPoxCEDyfIvdtNQH0PRkH6Q51g8rFO3Qzxh2LbItcDCOpmuOsV7ntNaERe3v/lP/zO8yn4N+yNPrekmPAAAAAElFTkSuQmCC)" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            let pathStr = path.description.replacingOccurrences(of: "file://", with: "")
            print(pathStr)
            showMD(mdFile: pathStr)
            //writing
            do {
                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let md = try String(contentsOf: path, encoding: String.Encoding.utf8)
                print(md)
            }
            catch {/* error handling here */}
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func showMD(mdFile:String){
        let md = KituraMarkdown()
        var html = ""
        var options:MarkdownOptions?

        do {
            let path = Bundle.main.url(forResource: "index", withExtension: "html")
            html = try String(contentsOf: path!, encoding: String.Encoding.utf8)
            options = MarkdownOptions(pageTemplate: html)
        }
        catch {
            /* error handling here */
            options = nil
        }
        
        do {
            let mdStr = try md.render(filePath: mdFile, context: [String:Any](), options: options!)
            print(mdStr)
            webView.loadHTMLString(mdStr, baseURL: Bundle.main.bundleURL)
            webView.reload()
        } catch{
            
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
