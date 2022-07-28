# Fetch Rewards Coding Exercise README

This is a how to guide for running the fetch rewards coding exercise. Please read the following steps and review the application at your leasure. The exercise will make multiple calls to different routes allowing for multiple chained results. The application is built from Ruby on Rails(RoR) and I may do a Java or C++ build just because. If there are any questions you may have please reach out!

## Setting up your environment

1. Open terminal/command prompt
2. Install Homebrew (if on a Mac, xcode includes this)
3. Type `brew install ruby` and press return/enter
4. Type `gem install rails` and press return/enter
5. Type `gem install bundler` and press return/enter
6. Confirm ruby version by typing `ruby --version` and press return/enter

## Running the Program

1.  Open terminal/command prompt
2.  Type `git clone git@github.com:jlonetree/fetch_rewards_coding_exercise.git` into your desired folder
3.  Type `bundle install` and press return/enter **Warning** (If bundle install did not work, copy and paste the suggestion to install the proper bundler)
4.  Type `rails s` and press return/enter
5.  Open your preferred web browser (Google Chrome is recommended)
6.  Type in the URL `http://localhost:3000/spend` for the spend route and receive the appropriate JSON response
7.  Type in the URL `http://localhost:3000/points_balance` for the points balance route and receive the appropriate JSON response
8.  _(Optional)_ Type in the URL `http://localhost:3000` for the add transaction route and create a new transaction and receive the appropriate JSON response for the created transaction

## Notes and Future Improvements and Issues

This was a fun exercise and really had me bringing new and old knowledge together to find a solution.

Improvements I would like to make on the program is making it a bit more readable. Though I'm proud of the logic throughout the exercise, I would like to refactor it more in the future with better variable naming, utilizing more efficient helper methods and operands, and using less if else statements when possible. The need for TDD of this program would also bolster it's performance by utilizing tools like Rspec and Capybara could test functionality to discover new, quicker solutions with less time spent trying to understand semi-blindly what to place in the program.

An issue that I faced when completing this exercise derives from the points_balance call. The call initially produces the correct JSON response, but when called again, it add the points from `payer[:points]` to the payer_balances hash. I would like to improve and refactor the program to prevent this from happening as I am utilizing a global class variable `$payers` to make this call produce the result.

# Thank you for you time and consideration!
