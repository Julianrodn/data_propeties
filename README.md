# Dataprop Portal

Dataprop Portal is a web application developed in Ruby on Rails for property management. It allows users to manage properties, authenticate, perform searches, and view property-related information, all with a modern interface using Tailwind CSS.

## Features
* User authentication with Devise.
* Property management, including details such as location, type, photos, etc.
* Integration with the Mindicador API for currency conversion.
* Property pagination with Kaminari.
* User interface designed with Tailwind CSS.
* Views optimized using HAML.
* Testing with RSpec.

## Technologies Used
* Ruby on Rails
* Tailwind CSS
* HAML
* Devise (for authentication)
* Kaminari (for pagination)
* PostgreSQL (for the database)
* Mindicador API (for currency conversion)
* RSpec (for testing)

## Installation

### Clone the repository

Clone this repository to your local machine:
```bash
git clone https://github.com/julianrodn/data_propeties.git

```

Install Ruby dependencies:
```bash
bundle install
```

Install JavaScript dependencies:
```bash
yarn install
```

## Database
Create the database and run migrations:
```bash
rails db:create
rails db:migrate
```

## Running the Project

To run the development server, use the following command:
```bash
rails server
```

Then, open your web browser and go to http://localhost:3000 to see the application in action.
