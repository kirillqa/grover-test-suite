## Test suite overview

##Dependecies

The main dependencies in the current test suite are the following:

* Cucumber - is using as tool to present tests in BDD style
* Capybara - is using to interact with web page elements
* Rspec - matchers from rspec are using to check different conditions
* SitePrism - is using to add [Page Object pattern](https://github.com/SeleniumHQ/selenium/wiki/PageObjects) support
* ChromeDriver Helper - is using for easy installation, run and maintain chrome driver
* Faker - is using for generating random data

##Structure

Test suite contains 3 layers of abstraction:

1. Feature level - entire test written in plain English 
2. Step level - mapping cucumber step to specific capybara code
3. Page level - elements and actions definition for some specific page

## To Run tests please use the following steps

### 1.Install dependencies for the test suite
   
To install gems required for the test suite locally please use the following command in terminal ```bundle install```

### 2.Run test suite
 
To run test suite locally please use the following command in terminal - ```cucumber``` or ```rake```

### 3. Get test results

To see results for the test suite in html format please open ```./report/report.html```
