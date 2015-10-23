## Bard Bot -- Shakespearean Markov [![Build Status](https://travis-ci.org/EvilScott/bard_bot.svg?branch=next)](https://travis-ci.org/EvilScott/bard_bot)

Installation:
```bash
$ gem install bard_bot
```

Usage:
```ruby
require 'bard_bot'
BardBot.config do |config|
  c.character = :lear
  c.prefix = 3
end
BardBot.generate_sentence
```

Available Configuration:
* `:character` (*default `:hamlet`*) - Choose character corpus. Use `BardBot.characters` to see available. `:random` is also a supported option.
* `:prefix` (*default 2*) - Markov prefix to use when generating sentences. Lower prefixes will give more chaotic output and higher prefixes will give output closer to corpus material.
* `:max_length` (*default 100*) - Maximum length in words for a generated sentence. Sentences will terminates on a valid punctuation or the maximum length, whichever is shorter.
* `:character_dir` (*default `:default`*) - Directory for corpus. Another directory besides the default can be specified here to support input.
