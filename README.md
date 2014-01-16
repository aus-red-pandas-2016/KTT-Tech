# Blog 2 Multi Author 
 
##Learning Competencies 

##Summary 

 Re-using what code you can from the [URL Shortener with users](http://socrates.devbootcamp.com/challenges/278), now add user authentication to your blog engine.

The authorization rule for now is that any authenticated user has permission to create a post, but *only their posts*.  In other words, anyone can sign up and create a post, but I'm the only person who has permission to update or destroy posts I've created.

## Learning Goals

- Revisit authentication and authorization for web applications.
- ActiveRecord associations.

## Objectives

### Integrate User Signup

Create the appropriate controllers for user authentication.  You'll want routes that correspond to:

1. A user being prompted to log in
2. A user submitting their email + password
3. A user logging out
4. A user being prompted to sign up
5. A user submitting their information to create an account

The ability to create a `Post` is restricted to users who have signed up.  For now anyone can see any `Post`.

### Authorization

The application has the following authorization rules:

1. A user who is not logged in can only see posts
2. A user who is logged in can create posts
3. A user who is logged in can only update or destroy posts that they themselves have created

If a user tries to do any of the above and isn't permitted, redirect them away from the page to somewhere sensible, e.g., the homepage.

### Add New Information to Views

Now that posts have authors, display author-related information on the post, e.g., a byline.

Also add a route so that when someone visits

```text
/users/123/posts
```

we see a list of all posts created by user #123.  The author's name in the byline should link to this page. 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources