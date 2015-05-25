Purpose:  Create a sample app with with to test multiple web technologies (e.g. Rails, Node) using TDD development. The sample app is based on creating a clone of stack overflow, and to simply testing of technologies, does not have user authentication or tags.

Process: Base app created as a full rails app, other technologies will be added as different branches.

#Releases for Rails app
1. Create wireframe. √ (Done offline)
2. Basic setup
    1. Rails √
    2. Readme.md (this file) √
    3. Rspec + config Capybara √
3. Models
    1. Rails generate models √
    2. Rspec association tests √
    3. Validation tests √
    4. Add validations √
4. Controllers - CRUD 
    1. Create routes && redirect home page to questions routes √
    2. Rails generate controllers √
    3. Seed file for Question and Answers using Faker √
    3. Rspec create tests 
    4. Write create routes (N.B Use form partials)
    5. Rspec Edit tests
    6. Write Edit routes
    7. Write Delete tests
    8. Write Delete routes
5. Add upvote downvotes for Questions and Answers
    1. Rspec tests
    2. Q upvote && Q downvote
    3. A upvote && A downvote
6. Integrate an API (Zenquote?)
7. AJAX
    1. Ajaxify create 
        1. Capybara test
    2. Ajaxify edit
        1. Capybara test 
    3. Ajaxify delete
        1. Capybara test
    4. Ajaxify upvote/downvote
        1. Capybara test
8. Add Markdown widget
9. Add responsive web design (CSS)
