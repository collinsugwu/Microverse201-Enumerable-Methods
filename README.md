
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://www.microverse.org/">
    <img src="doc/microverse.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Custom Ruby Enumerables</h3>

  <p align="center">
    A custom version of Ruby's enumerable methods
    <br />
    <a href="https://github.com/collinsugwu/Microverse201-Enumerable-Methods/blob/master/README.md"><strong>Explore the docs �</strong></a>
    <br />
    <br />
    <a href="https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks.">Assigment</a>
    �
    <a href="https://github.com/collinsugwu/Microverse201-Enumerable-Methods/issues">Report Bug</a>
    �
    <a href="https://github.com/collinsugwu/Microverse201-Enumerable-Methods/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

The Enumerable mixin provides collection classes with several traversal and searching methods, and with the ability to sort. The class must provide a method my_each, which yields successive members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.

### Built With
This progam was made using this technologies
* [Ruby](https://www.ruby-lang.org/en/)
* [Rubocop](https://github.com/rubocop-hq/rubocop)
* [Stickler](https://stickler-ci.com/)


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

* Ruby
You can easily install Ruby on your Linux computer by using [Homebrew](https://docs.brew.sh/) and [Chruby](https://github.com/postmodern/chruby)
```sh
brew install chruby
brew install ruby-install
ruby-install ruby
```

### Installation

<!-- 1. Get a free API Key at [https://example.com](https://example.com) -->
1. Clone the repo
```sh
git clone https://github.com/collinsugwu/Microverse201-Enumerable-Methods.git
```
<!-- 3. Install NPM packages
```sh
npm install
``` -->
<!-- 4. Enter your API in `config.js`
```JS
const API_KEY = 'ENTER YOUR API';
``` -->


<!-- USAGE EXAMPLES -->
## Usage

Every enumerable method uses the custom my_each method to iterate through a Hash or an array.

```
  def my_each
    return to_enum(:my_each) unless block_given?

    new_array = is_a?(Range) ? to_a : self
    i = 0
    while i < new_array.size
      yield new_array[i]
      i += 1
    end
    self
  end

```
Each method can use the custom my_each this way.

```
  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    if block_given?
      my_each { |i| result << i if yield(i) }
    end
    result
  end
```
Run Test
```
rspec
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/collinsugwu/Microverse201-Enumerable-Methods/issues) for a list of proposed features (and known issues).


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact


* Collins Ugwu: [Github](https://github.com/collinsugwu), [Twitter](https://twitter.com/collinsugwu_me
)


Project Link: [https://github.com/collinsugwu/Microverse201-Enumerable-Methods](https://github.com/collinsugwu/Microverse201-Enumerable-Methods)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/collinsugwu/Microverse201-Enumerable-Methods/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/collinsugwu/Microverse201-Enumerable-Methods
[forks-url]: https://github.com/collinsugwu/Microverse201-Enumerable-Methods/network/members
[stars-shield]: https://img.shields.io/github/stars/collinsugwu/Microverse201-Enumerable-Methods
[stars-url]: https://github.com/collinsugwu/Microverse201-Enumerable-Methods/stargazers
[issues-shield]: https://img.shields.io/github/issues/collinsugwu/Microverse201-Enumerable-Methods
[issues-url]: https://github.com/collinsugwu/Microverse201-Enumerable-Methods/issues
[license-shield]: https://img.shields.io/github/license/collinsugwu/Microverse201-Enumerable-Methods
[license-url]: https://github.com/collinsugwu/Microverse201-Enumerable-Methods/blob/master/LICENSE.txt
