## General Application Background

The intention of this application if for users to coordinate which trails they will be using for a day hike. This will test your ability to set up many-to-many relationships and access attributes and methods through those relationships.

### Constraints:

- Visitors will go on many hiking trips
- Each hiking trip is made up of one or more trails
- A trail may be part of more than one hiking trip

## Be sure to read all user stories BEFORE beginning your work

## Setup

- Perform the usual setup steps after cloning a Rails application

## Requirements

- TDD all new work; you may postpone model tests for attribute validations only

## Not Required

- No form input is required
- No visual styling is required


## User Stories

### Hiking Trip Index page

```
User Story 1 of 10

As a visitor,
when I visit the hiking trips index page,
I see a list of all hiking trip names in
the database.
```

```
User Story 2 of 10

As a visitor,
when I visit the hiking trips index page,
and I click on the name of a hiking trip,
I see a unique page for that hiking trip.
```

### Hiking Trip Show page
```
User Story 3 of 10

As a visitor,
when I visit a hiking trip's page,
I see a list of trails included in the trip,
I see the name, address, and length for each trail.
```

```
User Story 4 of 10

As a visitor,
when I visit a hiking trip's page,
I see the total hiking distance
of all trails on that hiking trip
```

```
User Story 5 of 10

As a visitor,
when I visit a hiking trip's page,
I see the average hiking distance
of all trails on that hiking trip
```

```
User Story 6 of 10

As a visitor,
when I visit a hiking trip's page,
I see a heading that says "Longest Trail on Trip"
  and the name and length of the longest trail
  included on that hiking trip
```

```
User Story 7 of 10

As a visitor,
when I visit a hiking trip's page,
I see a heading that says "Shortest Trail on Trip"
  and the name and length of the longest trail
  included on that hiking trip
```

```
User Story 8 of 10

As a visitor,
when I visit a hiking trip's page,
I can click on the name of a trail
to see a show page for that specific trail.
```

### Trail Show page

```
User Story 9 of 10

As a visitor,
when I visit a trail's page,
I see the name and address of this trail.
I also see the name and total length of
every hiking trip that includes this trail
```

```
User Story 10 of 10

As a visitor,
when I visit a trail's page,
I see the total number of hiking trips where this trail
was included
```

User Story 11

As a visitor

When I visit the register path

I see a form with the following fields:

- name
- email
- password
- password confirmation

When I submit my data,

I am returned to the trip index path,

and I see a flash message letting me know I have successfully registered


User Story 12

As a registered user

When I visit the login path

I see a field to enter my email address and password

When I submit valid information

I am redirected to my profile page

User Story 13
As a visitor

At the top of every page I see the following links:

- a link to the trip index
- a link to register

As a registered user I see the same links, but instead of a link to register I see a link to log in if I am logged out or log out if I am logged in

User Story 14

As a registered user

If I am logged in

When I click “Log out” I am returned to the trip index page.

I see a flash message indicating I am logged out.

I see a link to log in.

User Story 15

As a registered user

when I visit my profile page

I see all trips I have taken, including:

- the total distance of the trip
- the start date and the end date

I also see all trails I have taken, including:

- the number of times I have taken this trail (the number of my trips it’s included in)
- the length of the trail (edited)
