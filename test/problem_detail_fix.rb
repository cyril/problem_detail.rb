require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'problem_detail'
require 'fix'

Fix.describe ProblemDetail::Document do
  # Let's consider a HTTP response carrying JSON problem details
  #
  # HTTP/1.1 403 Forbidden
  # Content-Type: application/problem+json
  # Content-Language: en
  #
  # {
  #   "type": "http://example.com/probs/out-of-credit",
  #   "title": "You do not have enough credit.",
  #   "detail": "Your current balance is 30, but that costs 50.",
  #   "instance": "http://example.net/account/12345/msgs/abc",
  #   "balance": 30,
  #   "accounts": ["http://example.net/account/12345",
  #                "http://example.net/account/67890"]
  # }
  on :new, type:      'http://example.com/probs/out-of-credit',
           title:     'You do not have enough credit.',
           detail:    'Your current balance is 30, but that costs 50.',
           instance:  'http://example.net/account/12345/msgs/abc',
           balance:   30,
           accounts:  ['http://example.net/account/12345',
                       'http://example.net/account/67890'] do
    on :to_h do
      it do
        MUST eql(
          type: URI('http://example.com/probs/out-of-credit'),
          title: 'You do not have enough credit.',
          detail: 'Your current balance is 30, but that costs 50.',
          instance: URI('http://example.net/account/12345/msgs/abc'),
          balance: 30,
          accounts: [
            'http://example.net/account/12345',
            'http://example.net/account/67890'
          ]
        )
      end
    end
  end
end
