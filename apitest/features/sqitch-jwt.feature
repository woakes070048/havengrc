Feature: Basic sqitch API interaction with JWT

    Background: Setup environment with JWT Auth
        Given I send and accept JSON
        And I sign in to keycloak with "user1@havengrc.com" and "password"
        And I add Headers:
            | Prefer | return=representation             |


    Scenario: Add/update a comment without ability to spoof the user_email
        When I set JSON request body to:
        """
        {
        "message": "The system must be tested"
        }
        """
        And  I send a POST request to "http://api:8180/comments"
        Then the response status should be "201"
        Then the JSON response root should be array
        Then the JSON response should have "$[0].user_id" of type string and value "90920d91-3090-4b4a-ae2a-2377cfa06ecd"
        Then the JSON response should have "$[0].user_email" of type string and value "user1@havengrc.com"
        Then the JSON response should have "$[0].message" of type string and value "The system must be tested"

    Scenario: Search for all comments
        When I request a list of comments
        Then the request is successful
        And the response is a list of at least 1 comment

    Scenario: Add a comment and try to spoof the author to see failure
        When I request to create a comment with:
            | attribute  | type    | value                     |
            | message    | string  | The system must be tested |
            | user_email | string  | hacker@world.com          |
        Then the request failed because it was invalid
