# CarDealer

### Prerequisites
- [Microsoft Visual Studio 2017](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=15)
- [Microsoft SQL Server 2017](https://go.microsoft.com/fwlink/?linkid=853017)
- [Microsoft SQL Server Management Studio 17](https://go.microsoft.com/fwlink/?linkid=2043154)
- [Git](https://git-scm.com/download/win)
- [SourceTree](https://product-downloads.atlassian.com/software/sourcetree/windows/ga/SourceTreeSetup-3.0.17.exe)

 ### SourceTree Installation
 - Click "BitBucket"
 - Browser should open and then you should be logged (create an account if you don't already have one)
 - At this point, Git should already be installed
 - Uncheck "Mercurial"
 - Click "Next"
 - Click "Next"
 - At "Load SSH Key" select "No"
 - Click "Clone"
 - In the "Source Path / URL" paste this link: https://github.com/alintintesan/CarDealer.git
 - Choose your "Destination Path" where you want the project to be saved on your PC and the "Name" of the project folder
 - Click "Clone"
 - The cloned project should apper in a new tab at the top of the page
 
 ### Importing the database 
- Open Microsoft SQL Server Management Studio 17
- Click "Connect"
- Click "File" > "Open" > "File"
- Navigate to "CLONED_PROJECT_FOLDER\DB"
- Select "createAndPopulateDB.sql" and click "Open"
- After the script opened in SQL Server Management Studio, click "Execute" or press F5
- After the execution, the database should be found inside "Databases" tab

### Task management
- Before working on a new task, a new branch should be created, having the task's name
- All the changes need to pe commited and pushed to this new branch
- When the task is ready, a new pull request has to be opened 
- All changes must be approved in a code review by the team lead and optionally another team member
- Comments and requested changes must be addressed
- After approval, the branch can be merged into master!

### Database Diagram
![](https://github.com/alintintesan/CarDealer/blob/master/DB/CarDealerDB.png)
