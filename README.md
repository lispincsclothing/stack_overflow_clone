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
4. Controllers - CRUD for question
    1. Create routes && redirect home page to questions routes √
    2. Rails generate controllers √
    3. Seed file for Question and Answers using Faker √
    4. Rspec create tests √
    5. Write create routes (N.B Use form partials) √
    6. Integrate CI (via Travis CI) # FIXME Stuck on RVM
    7. Rspec Edit tests √
    8. Write Edit routes √
    9. Rspec update tests √
    10. Write update routes √
    11. Write Delete tests √
    12. Write Delete routes √
5. CRUD - for answers 
    1. Rspec create tests √
    2. Write create routes (N.B Use form partials) √
    3. Add simplecov reports for testing covering √
    4. Rspec Edit tests √
    5. Write Edit routes √
    6. Rspec Update tests √
    7. Write Update routes √
    8. Write Delete tests √
    9. Write Delete routes √
6. Add upvote downvotes for Questions and Answers
    1. Modify Question and Answer model to include votes √
    2. Rspec tests √
    3. Q upvote && Q downvote √
    4. A upvote && A downvote √
7. Integrate an API (Zenquote?) √
8. Styling website
    1. Install CSS vendor assets (bootstrap, normalize) √
    2. Include CSS in asset pipeline for app √
    3. Install gem handlebars_assets (https://github.com/leshill/handlebars_assets)
    4. Style question pages
    5. Style answer pages
9. AJAX
    1. Ajaxify create 
        1. Capybara test
    2. Ajaxify edit
        1. Capybara test 
    3. Ajaxify delete
        1. Capybara test
    4. Ajaxify upvote/downvote
        1. Capybara test
10. Add Markdown widget
11. Add responsive web design (CSS)
12. Add Feature tests
    1. Check for difference between update and new for question and answer
