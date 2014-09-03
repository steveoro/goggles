Feature: Swimmers Radio

    So that anybody can display detailed info about a Swimmer
    As any user
    I want to see detailed info about a Swimmer

    @wip
    Scenario: Show detailed info for a chosen Swimmer when not logged-in
        Given a "swimmer"
        Given I am not signed-in
        When I browse to the radio page
        Then I expect to see the detailed info about the swimmer
        Then I expect not to be able to click on the avatar image to customize it

    @wip
    Scenario: Show detailed info and customize avatar link for a chosen Swimmer corresponding to me
        Given a "swimmer"
        Given I am an authenticated user
        Given my user is associated to the swimmer
        When I browse to the radio page
        Then I expect to see the detailed info about the swimmer
        Then I expect to be able to click on the avatar image to customize it
