# Blog 2: Authentication and Authorization

## Summary
In this challenge, we're going to add a feature to a blog application similar to the one that we built in the [*blog-1-anonymous-blog-challenge*][blog-1-challenge].  In that challenge, anyone could visit our site and write, edit, or delete a blog entry.  In this challenge, we're going to restrict what users can do on our site, depending on whether they're registered users and, if so, which users they are.

### Authentication and Authorization
The focus of this challenge is on who has permission to do what in our application.  Think about sites like Facebook and Twitter.  We need to register with each site before we can post status updates or tweet.  What happens after we post some content?  Can just anyone edit it or delete it, or is that behavior restricted to us as the content's author?


## Releases
### Pre-release: Setup
Before we begin implementing authentication and authorization, we need to set up the site.  The provided codebase is for a functioning one-model CRUD application:  a blog site.  Let's browse through the code, taking a look at the models, controllers, helpers, views, migrations, etc.  Then, after creating, migrating, and seeding the database, let's open the application in the browser.


### Release 0: User Signup
Let's begin by adding a user authentication feature.  All we want to do for this particular release is to allow users to register for our site, login, and logout.

When users signup, they will provide a username, e-mail address, and a password; they will login with their e-mail address and password.

We'll need to add a table in our database to hold user data.  Think about what constraints we should place on our database.  Do we need to add any indexes for quick lookup?  Should any fields be required and/or unique?  We'll also need a model to represent users in our applications.  Does our model need an validations?

**User Interface Changes**  
- When no user is logged in, links to register and login should appear in the navigation options (see [mockup](readme-assets/auth-nav-no-user.png)).
- When a user is logged in, the user's username and a link to logout should appear in the navigation options (see [mockup](readme-assets/auth-nav-user.png)).
- When a user clicks the link to register, they should be taken to a page with a form for submitting their username, e-mail address, and password (see [mockup](readme-assets/registration-form.png)).  We'll need a similar page for login.
- If something goes wrong during registration, the user should be alerted to the problem (see [mockup](readme-assets/registration-form-show-errors.png)).  Similar feedback should be provided if logging in fails.


### Release 1: Restrict Writing Entries to Registered Users
In this release, we're going to begin to introduce authorization into our application.  Users can already register, login, and logout.  We now want to modify our application so that only users who are registered and logged are able to create new entries.

We'll modify our user interface to hide links to the new entry form from guest users.  Just updating our user interface isn't enough.  What happens, if a user navigates to the new entry form not by clicking a link, but by entering the URL directly?  What if someone makes a request to create a new post from the command line?  Can we catch these in our route handlers?  

**User Interface Changes**  
- When no user is logged in, any links to the new entry form should be removed (see [user logged in mockup](readme-assets/auth-nav-user.png) and [no user mockup](readme-assets/no-user-no-link-to-form.png)).
- If a request is made to get the new entry form page or to create a new entry but there is no user logged in, then the response should alert users that something went wrong (see [mockup](readme-assets/something-went-wrong.png)); this is already the behavior if any user tries to access an entry that does not exist.


### Release 3: Add New Information to Views

Now that entries have authors, display author-related information on the entry,
e.g., a byline.

Also add a route so that when someone visits

```text
/users/123/entries
```

we see a list of all entries created by user #123.  The author's name in the
byline should link to this page.

## Resources

[blog-1-challenge]: ../../../blog-1-anonymous-blog-challenge
