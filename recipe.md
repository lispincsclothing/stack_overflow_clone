1. rails new -h
2. rails new stack_overflow_clone -T -d=postgresql
3. rails g rspec:install
4. rails g model Question title:string content:text
5. rails g model Answer title:string content:text question:references
6. bin/rails g controller answers && bin/rails g controller questions
7. rake routes
8. 
