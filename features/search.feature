Feature: User search for an app inside the iOS app store
    In order to help a user to buy an app
    The owner of store
    Wants to provide a user with a quick app search

    @javascript
    Scenario Outline: User successfully found an app
        Given the following app tags:
        | Track Name | Track ID  |
        | Yelp       | 284910350 |
        | forkly     | 456191378 |
        | iWant      | 284945674 |
        When user submitted an app name "<Track Name>" for search
        Then he can see the result that contains the app name "<Track Name>"
        And contains the app icon "<Artwork Url 60>"
        And it should not contain other apps except of "<Track Name>"
        
        Scenarios:
        | Track Name | Artwork Url 60                                                                                       |
        | Yelp       | http://a2.mzstatic.com/us/r1000/073/Purple/v4/ec/ba/57/ecba5736-8bf9-2f5f-fced-02d49ec15d41/57.png   |
        | forkly     | http://a2.mzstatic.com/us/r1000/116/Purple/v4/da/75/b8/da75b8b8-e070-e7c0-805f-10f5f37123a7/Icon.png |
        | iWant      | http://a5.mzstatic.com/us/r1000/105/Purple/89/10/55/mzi.rszguyzr.png                                 |