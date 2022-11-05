//
//  main.swift
//  iLecture
//
//  Created by Ioannis Loudaros on 4/11/22.
//

import Foundation

var menuChoice="";
print("Welcome to the Schedule tool.\n Please choose one of the following:\n")
var lecSchedule = schedule();

repeat{

    print("1. Type a day so you can see its Schedule.\n")
    print("2. Type 'add', so you can add a lecture to the schedule.\n")
    print("3. Type 'exit', to exit the tool.")
    
    repeat{
        menuChoice = readLine() ?? "";
    }while (validChoice(choice: menuChoice.lowercased())==0)
    
    
    
    switch menuChoice.lowercased(){
    case "monday", "tuesday", "wednesday", "thursday", "friday":
        
        print("Here is the Schedule for \(menuChoice.capitalized)")
        lecSchedule.showSchedule(day:menuChoice);
    case "add":
        lecSchedule.addLecture();
    case "exit":
        print("Thank you for using the tool.")
    default:
        print("Unexpected Error...");
    }
    
}while(!(menuChoice=="exit"))
