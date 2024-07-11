//
//  ContentView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/11/24.
//

import SwiftUI

//MARK: GIT NOTES
/*
 Clone = Copying the repo locally
 Commit = Save a checkpoint on our current branch
 Staging = Prepare changes for a commit
 Stash = Save changes for later
 Push = Send lcoal commits to remote repo
 Pull = Fetch remote commits to local repo
 
 Commit Messages
 
Feature: Adding a new feature or functionality to the application.
   - UI Feature: Adding significant new UI elements, screens, or views.
   - Backend Feature: Implementing new backend services, APIs, or database integrations.
   - Logic Feature: Introducing new application or business logic.

Enhancement: Improving or optimizing existing functionality.
   - UI Enhancement: Enhancing, refactoring, or tweaking existing UI components for better user experience.
   - Backend Enhancement: Optimizing or improving existing backend code for performance or scalability.
   - Logic Enhancement: Refining or optimizing existing application or business logic.

 Fix: Resolving issues or bugs in the application.
   - UI Fix: Fixing bugs or issues related to the user interface.
   - Backend Fix: Fixing bugs or errors in the backend code or services.
   - Logic Fix: Resolving logical bugs or inconsistencies in the application.
 
 Dependency: Updating, adding, or removing dependencies or third-party libraries.
 
 Refactor: Restructuring or rewriting code for better readability, maintainability, or performance without changing its external behavior.

 Clean: Performing code cleanup, formatting, or removing unused code for improved code quality.

 Docs: Adding, updating, or improving documentation, including code comments, READMEs, or API documentation.
 
 Note: Must push to remote repo afte creating a new branch.
 
 Stashing changes will put the changes not ready to commit to a temporary container, After successfully stashing a change, you'll revert back to the previous change , but the stashed changes will be kept
 */

//MESPACE
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
