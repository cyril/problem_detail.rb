# Problem Detail

[![Build Status](https://api.travis-ci.org/cyril/problem_detail.rb.svg?branch=master)][travis]
[![Code Climate](https://api.codeclimate.com/v1/badges/760884492bbfa493ef97/maintainability.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/problem_detail.svg)][gem]
[![Inline docs](https://inch-ci.org/github/cyril/problem_detail.rb.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Problem Details for HTTP APIs.

A structure to define a *problem detail* as a way to carry machine-readable details of errors in a HTTP response, to avoid the need to define new error response formats for HTTP APIs.

To read more: [Indicating Problems in HTTP APIs](http://www.mnot.net/blog/2013/05/15/http_problem).

Supported version: [Problem Details for HTTP APIs](https://tools.ietf.org/html/rfc7807).

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'problem_detail'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install problem_detail

## Usage

```ruby
http_pb = ProblemDetail::Document.new(
  type:     'http://example.com/probs/out-of-credit',
  title:    'You do not have enough credit.',
  detail:   'Your current balance is 30, but that costs 50.',
  instance: 'http://example.net/account/12345/msgs/abc',
  balance:  30,
  accounts: [
    'http://example.net/account/12345',
    'http://example.net/account/67890'
  ]
)

http_pb.type # => #<URI::HTTP http://example.com/probs/out-of-credit>
http_pb.to_h # => {:balance=>30, :accounts=>["http://example.net/account/12345", "http://example.net/account/67890"], :detail=>"Your current balance is 30, but that costs 50.", :instance=>#<URI::HTTP http://example.net/account/12345/msgs/abc>, :title=>"You do not have enough credit.", :type=>#<URI::HTTP http://example.com/probs/out-of-credit>}
```

## Security

As a basic form of security __ProblemDetail__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/problem_detail-0.0.1.gem
    d12d7d9c2a4fdfe075cbb7a141fa5f2195175891e4098c7e1a28c8bca655ab44fb9d67b6a2e3991d0f852026c5e4537fdf7e314575c68d1c80b3a4b1eb1c041f  pkg/problem_detail-0.0.1.gem

## Versioning

__ProblemDetail__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/cyril/problem_detail.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/problem_detail
[travis]: https://travis-ci.org/cyril/problem_detail.rb
[codeclimate]: https://codeclimate.com/github/cyril/problem_detail.rb
[inchpages]: https://inch-ci.org/github/cyril/problem_detail.rb
[rubydoc]: https://rubydoc.info/gems/problem_detail/frames
