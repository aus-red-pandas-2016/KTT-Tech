# Blog 2 Multi Author

## Learning Competencies

* Implement secure authentication in a web application
* Implement a user authorization scheme to limit unauthorized access to specific pages in a web application  
* Use Active Record Associations.

## Summary

Re-using what code you can from the [URL Shortener with users](../../../sinatra-url-shortener-with-users-challenge), now add user authentication to your blog engine.

The authorization rule for now is that any authenticated user has permission to
create a entry, but *only their entries*.  In other words, anyone can sign up and
create a entry, but I'm the only person who has permission to update or destroy
entrys I've created.

Start by copying your [Blog 1](../../../blog-1-anonymous-blog-challenge) directory into the source directory for this challenge and build off of it. 

## Releases

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

* [DBC Shortener with users challenge](../../../sinatra-url-shortener-with-users-challenge)

[shortener-with-users]: ../../../sinatra-url-shortener-with-users-challenge
