//
//  ContentView.swift
//  JobApplicationsApp
//
//  Created by Cody on 11/8/20.
//  Copyright © 2020 Cody. All rights reserved.
//

import SwiftUI

/*
 - To show list of job applications
 - To create new job application entry
 - To show info and edit previously entered job applications
 
 - Company
 - Job title
 - Application status
 - Notes
 */

struct JobApp: Identifiable {
    var id: Int

    let company, title: String
    let applied: Bool
}

struct ContentView: View {
    
    let jobApps: [JobApp] = [
        .init(id: 0, company: "Tesla", title: "Software Engineer, UI Automation - Infotainment", applied: true),
        .init(id: 1, company: "Apple", title: "Software Engineer", applied: false),
        .init(id: 2, company: "Facebook", title: "Software Engineer", applied: true),
        .init(id: 3, company: "Netflix", title: "Software Engineer", applied: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jobApps, id: \.id) { jobApp in
                    // User row
                    UserRow(jobApp: jobApp)
                }
            }.navigationBarTitle(Text("Job Applications"))
        }
    }
}

struct UserRow: View {
    let jobApp: JobApp
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(jobApp.company).font(.headline)
                    //.foregroundColor(jobApp.applied ? .red : .green)
                Text(jobApp.title).font(.subheadline)
                    .lineLimit(nil)
                    .foregroundColor(jobApp.applied ? .red : .green)
            }.padding(.leading, 5)
        }.padding(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
