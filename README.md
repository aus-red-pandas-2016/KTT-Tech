# Blog 2: Authentication and Authorization

## Summary
In this challenge, we're going to add a feature to a blog application similar to the one that we built in the [*blog-1-anonymous-blog-challenge*][blog-1-challenge].  In that challenge, anyone could visit our site and write, edit, or delete a blog entry.  In this challenge, we're going to restrict what users can do on our site, depending on whether they're registered users and, if so, which users they are.

### Authentication and Authorization
The focus of this challenge is on who has permission to do what in our application.  Think about sites like Facebook and Twitter.  We need to register with each site before we can post status updates or tweet.  What happens after we post some content?  Can just anyone edit it or delete it, or is that behavior restricted to us as the content's author?


## Releases
### Pre-release: Setup
Before we begin implementing authentication and authorization, we need to set up the site.  The provided codebase is for a functioning one-model CRUD application:  a blog site.  Let's browse through the code, taking a look at the models, controllers, helpers, views, migrations, etc.  Then, after creating, migrating, and seeding the database, let's open the application in the browser.


### Release 0: Integrate User Signup

Create the appropriate controllers for user authentication.  You'll want routes
that correspond to:

1. A user being prompted to log in
2. A user submitting their email + password
3. A user logging out
4. A user being prompted to sign up
5. A user submitting their information to create an account

The ability to create a `Entry` is restricted to users who have signed up.  For now anyone can see any `Entry`.

### Release 1: Authorization

The application has the following authorization rules:

1. A user who is not logged in can only see entries
2. A user who is logged in can create entries
3. A user who is logged in can only update or destroy entries that they themselves have created

If a user tries to do any of the above and isn't permitted, redirect them away from the page to somewhere sensible, e.g., the homepage.

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
