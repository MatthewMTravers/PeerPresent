#Project 6 - Presentation Class Catalog

Project Description:
>This project is a presentation manager for both Students and Administrators that contains many features that would improve classroom experience. There is authentication logins and account creation for both Students and Administrators that give different permisisons as you navigate through our pages. The Student landing page offers a view for students to see what presentations are assigned to them, create evaluations for other students, edit their profile, etc. The Administrator view offers the class roster, the ability to assign students presentations, view evaluations, assign grades based on evaluations, etc. Overall, this presentation manager makes for simple use by Admin to provide an educational learning experience to all students to focus on the content and not the organization.

Technologies Utilized:
>The backbone of this project is Ruby on Rails and does a lot of heavy lifting for you. From internal db, to MVC architecture, it handles everything smoothly and efficiently. Additionally there is HTML and CSS for the look and styling of the views so that it can be not only a functioning website but a visually attractive one too.

Challenges Faced:
>Not only were there a plethora of technical challenges we ran into with learning Rails and the whole MVC architecture, but we often had problems at times with git. While we should have all been working in our own branches, we initially had created a branch 'Matthew' that had many commits. We typically would work at different times on the project so it wouldn't have been a big deal if we just pulled before pushing, but there were times where we would work at the same time, edit similar files, and then push and it get messed up. There was one point where it got so messy and we couldn't figure out the correct solution so we just made a new branch 'fix issues' where the remainder of the project was completed before merging back into main. On a different note, we also had troubles with actually assigning presentations to students and evaluations to those presentations so that took a great deal of work and thought to hash that all out and finally get the working product. 

General Overview:
>This project is build using Ruby on Rails following an MVC architecture. The Model, View, and Controller make up the majority of the code and allow the application to be interactive, resposive, and persist your data. The Model has the data and rules of how the objects interact with eacher other. The View is the visuals of the website and has different views for each page that the user will see on the site. The Controller is the middleman between the two and controls the actions from the view to the model. We use the internal database provided by Ruby on Rails to store the data entered and allow the users to effectively traverse the website.

Important Note:
>In order to submit grades for the presentation, the admin must click on the presentation they want to assign a grade for on their home page which will take them to the view for the presentation, then they choose the grade they wish for the student to have and submit.

Running the Program:
>To run the program, use the command 'rails server' to start a local server on your device. Then, navigate to your default browser on the system and navigate to 'localhost:3000' where you rails appliaction will be running. If you don't want to create users, admin, or presentations there is a Faker implementation to populate the DB with some generic values. Running 'rails db:seed' will pull that code and seed the DB with the specified values.
