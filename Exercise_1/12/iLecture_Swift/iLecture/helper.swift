//
//  helper.swift
//  iLecture
//
//  Created by Ioannis Loudaros on 4/11/22.
//

import Foundation
import Table
import SwiftyXMLParser

func validChoice(choice : String) -> Int{
    
    switch choice{
    case "monday", "tuesday", "wednesday", "thursday", "friday":
        return 1
    case "saturday", "sunday":
        print("Please enter a working day.\n")
        return 2
    case "add", "exit":
        return 3
    default:
        print("Please make a valid choice.")
        return 0
        
    }
}





struct Lesson{
    var title=String();
    var prof=String();
    var day=String();
}


class schedule{
    
    var lessons : [Lesson]=[];
    
    
    init() {
        var str = String()
        do{
            str = try String(contentsOfFile: "./Schedule.xml")
            
        }catch{
            print("File not found")
        }
        
        let xml = try! XML.parse(str)
        
        for lesson in xml.Schedule.Lesson{
            let title = lesson.Title.text ?? "Unknown"
            let prof = lesson.Professor.text ?? "Unknown"
            for lecture in lesson.Lecture{
                self.lessons.append(Lesson(title: title, prof: prof, day: lecture.Day.text ?? "Unknown"))
            }
        }
    }
        
    
    func showSchedule( day:String ){
        var selectedLessons: [Lesson]=[]
        for lesson in self.lessons {
            if lesson.day==day.capitalized{
                selectedLessons.append(lesson)
            }
        }
        
        var tableform : [[String]]=[];
        
        for lesson in selectedLessons{
            tableform.append([lesson.title,lesson.prof,lesson.day])
        }
        
        print(table:tableform,
              
              header:["Title", "Professor", "Day"]
        )
        
    }
    
    func addLecture(){
        
        var newLesson = Lesson();
        print("Title of the Lecture:")
        newLesson.title = readLine() ?? "Unknown";
        print ("Professor of the Lecture:");
        newLesson.prof = readLine() ?? "Unknown";
        print("Day of the Lecture:");
        repeat{
            newLesson.day = readLine()?.capitalized ?? "Unknown";
        }while ([0,2,3].contains(validChoice(choice: newLesson.day.lowercased())))
        
        self.lessons.append(newLesson)
    }
    
}
