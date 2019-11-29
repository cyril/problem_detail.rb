# frozen_string_literal: false

require 'simplecov'

SimpleCov.command_name 'Brutal Tests'
SimpleCov.start

require_relative File.join('lib', 'problem_detail')

doc = ProblemDetail::Document.new(
  type:      'http://example.com/probs/out-of-credit',
  title:     'You do not have enough credit.',
  detail:    'Your current balance is 30, but that costs 50.',
  instance:  'http://example.net/account/12345/msgs/abc',
  balance:   30,
  accounts:  [
    'http://example.net/account/12345',
    'http://example.net/account/67890'
  ]
)

raise unless doc.to_h == {
  type:     URI('http://example.com/probs/out-of-credit'),
  title:    'You do not have enough credit.',
  detail:   'Your current balance is 30, but that costs 50.',
  instance: URI('http://example.net/account/12345/msgs/abc'),
  balance:  30,
  accounts: [
    'http://example.net/account/12345',
    'http://example.net/account/67890'
  ]
}
