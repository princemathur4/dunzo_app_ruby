<p align="center"><h1 align="center">Dunzo Backend (Ruby on rails) </h1></p>
<p align="center">
	<img src="https://img.shields.io/github/last-commit/princemathur4/dunzo_app_ruby?style=default&logo=git&logoColor=white&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/princemathur4/dunzo_app_ruby?style=default&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/princemathur4/dunzo_app_ruby?style=default&color=0080ff" alt="repo-language-count">
</p>
<p align="center"><!-- default option, no dependency badges. -->
</p>
<p align="center">
	<!-- default option, no dependency badges. -->
</p>
<br>

##  Table of Contents

- [ Overview](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#overview)
- [ Features](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#features)
- [ Project Structure](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#project-structure)
- [ Getting Started](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#getting-started)
  - [ Prerequisites](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#prerequisites)
  - [ Installation](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#installation)
  - [ Usage](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#usage)
  - [ Testing](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#testing)
- [ Project Roadmap](https://github.com/princemathur4/dunzo_app_ruby/blob/main/README.md#project-roadmap)

---

##  Overview

This App aims to create some of the backend APIs of a Dunzo like grocery delivery app using Ruby on rails  
---

##  Features
1. API to return list of nearby available shops with their s (assume all shops are of the
same kind)
2. API to return the menu and items availability of a particular shop
3. Add to cart option for a user, from a single shop
4. Allow users to place orders.
5. Delivery person assignment(based on distance)
---

##  Project Structure

```sh
└── dunzo_app_ruby/
    ├── Gemfile
    ├── Gemfile.lock
    ├── README.md
    ├── Rakefile
    ├── app
    │   ├── channels
    │   ├── controllers
    │   ├── errors
    │   ├── jobs
    │   ├── mailers
    │   ├── models
    │   └── views
    ├── bin
    │   ├── bundle
    │   ├── rails
    │   ├── rake
    │   ├── setup
    │   └── update
    ├── config
    │   ├── application.rb
    │   ├── boot.rb
    │   ├── cable.yml
    │   ├── environment.rb
    │   ├── environments
    │   ├── initializers
    │   ├── locales
    │   ├── puma.rb
    │   ├── routes.rb
    │   ├── secrets.yml
    │   └── spring.rb
    ├── config.ru
    ├── lib
    │   └── tasks
    ├── log
    │   └── .keep
    ├── test
    │   ├── controllers
    │   ├── fixtures
    │   ├── integration
    │   ├── mailers
    │   ├── models
    │   └── test_helper.rb
    ├── tmp
    │   └── .keep
    └── vendor
        └── .keep
```

---
##  Getting Started

###  Prerequisites

Before getting started with dunzo_app_ruby, ensure your runtime environment meets the following requirements:

- **Programming Language:** Ruby
- **Package Manager:** Bundler, Rake


###  Installation

Install dunzo_app_ruby using one of the following methods:

**Build from source:**

1. Clone the dunzo_app_ruby repository:
```sh
❯ git clone https://github.com/princemathur4/dunzo_app_ruby
```

2. Navigate to the project directory:
```sh
❯ cd dunzo_app_ruby
```

3. Install the project dependencies:


**Using `bundler`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Ruby-CC342D.svg?style={badge_style}&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/)

```sh
❯ bundle install
```

###  Usage
Run dunzo_app_ruby using the following command:
**Using `bundler`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Ruby-CC342D.svg?style={badge_style}&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/)

```sh
❯ bundle exec rails s
```



###  Testing
Run the test suite using the following command:
**Using `bundler`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Ruby-CC342D.svg?style={badge_style}&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/)

```sh
❯ bundle exec rspec <relative_file_path>
```


---
##  Project Roadmap
- [x] API to return list of nearby available shops with their s (assume all shops are of the same kind)
- [ ] API to return the menu and items availability of a particular shop
- [ ] Add to cart option for a user, from a single shop
- [ ] Allow users to place orders.
- [ ] Delivery person assignment(based on distance)

---
