<div id="header" align="center">

  <img src="https://images.pexels.com/photos/114296/pexels-photo-114296.jpeg" width="800" height="512">

</div>

# Create your own dream teams :soccer:

## Deployment

As this is the backend part of my dream team app, the backend can be found [here](https://pure-plains-57513.herokuapp.com/)

The frontend of the app is available [here](https://radiant-kataifi-c4ad61.netlify.app). 

Sign up using an email address and a 6 digit+ password is required.

## Description

With over 3000 football players available from 90 football clubs around Europe, pick your own custom dream teams and show them to your friends and fellow football fans!

## Getting Started/Code Installation

All code is available in the main branch. To install the code, follow the steps below:
1. Fork and clone the repo
2. `cd` into the repo on the CLI
3. Ensure you're using ruby version 3.2.1 `ruby -v` to check
4. Run `bundle install` and `yarn install`
5. Run `rails db:setup db:migrate`

## Timeframe

This was a solo project. The full project took 5 days to complete, however I probably spent 2.5 days planning and writing out the backend.

**Day 1** Planning - more on that below. This time was spent wireframing, making an erd diagram, working out what technologies to use and understanding where to get the seed data from.

**Day 2** Because I wanted to use a React frontend, I decided to use an api only version for my Rails app. 

My first goal was to correctly implement the [devise api](https://github.com/nejdetkadir/devise-api). Initially I tried to use simple token authentication, however after some more research, I decided the devise api was a gem that was easier to integrate and more secure than the simple token authentication. 

Once I had a good handle on authentication, I then implemented my tables according to my ERD diagram.

**Day 3** I spent writing out controllers and routes for the front end. Firstly I worked on a controller that would get the player's information and the club the player plays for. I knew this would be the first piece I'd write for the frontend after the authentication, so I wrote these routes first. At this point, I was switching between the frontend and the backend more. Once the players were loaded into the frontend, I could make a custom team in the front end and I could start building the routes needed to create and read the user created custom teams. Once the create and read functionalities were created, I added the update and delete functionality afterwards. I think the main challenge here was switching between the frontend and backend.

## Technologies Used
- Ruby on Rails
- Postgres
- Devise
- Heroku

## Planning
- I had 2 different plans: An [MVP](./public/MVP%20Project.pdf) plan and an [ambitious](./public/Ambitious%20Project%204.pdf) plan. The main difference between the 2 is that in the MVP, I descoped the ability to comment on other users' teams. This a feature that would be developed in the future.

- The ERD diagram had 5 entities. For the MVP, I felt like I wanted each user to be able to create multiple custom teams and I didn't want the players to be exclusive to any particular custom team. I needed a one to many relationship between a user and custom teams and a many to many relationship between custom teams and players. 

I have over 3000 players from 90 different clubs in my seed file, so that meant that multiple players could come from one club, this meant a one to many relationship between a club and players. 

For the MVP, I didn't include a relationship between the users and the clubs and I didn't include the comments table because I felt like I could reach an MVP without these features.

## Build/Code Process

Some of the pieces of code I would highlight:

1. The use of Devise API

    No specific screenshot for this one, but as explained above, this was my first experience using devise authentication, so after testing a different idea, I came to this idea and it ended up being a very nice solution to manage authentication - it was easy to implement, easy to block routes unless devise authentication was confirmed and it was easy to manage in the React frontend.

2. The update_team_players route

    [](./public/update_team_players.png)

    For this route, I passed an array of length anywhere between 1 - 11 in the params and I needed to save each item into the `CustomTeamPlayer` database. Using the each method on the array allowed me to get each element individually and create a record based on the information in the object for each element.

## Challenges

The main challenge was with the devise authentication. Having researched a different concept and making progress with that concept before realising there was a much simpler method using the devise api - I think this took up more time than I would have liked, but a good learning for future projects.

## Wins
I think I planned the tables and the relationships between them well and this saved me a good amount of time when implementing the tables.

## Key Learnings
- Devise API authentication was the main learning
- First project with Ruby - in future I think I could use the scaffold technique better.