# NlApi

CBS data on Dutch municipalities packaged as simple gem

Sources:
* [Historic municipality data](http://publicaties.rvig.nl/Landelijke_tabellen/Landelijke_tabellen_32_t_m_60_excl_tabel_35/Landelijke_Tabellen_32_t_m_60_in_csv_formaat)
* [Current data](https://www.cbs.nl/nl-nl/onze-diensten/methoden/classificaties/overig/gemeentelijke-indelingen-per-jaar/indeling%20per%20jaar/gemeentelijke-indeling-op-1-januari-2017)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nl_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nl_api

## Usage

Find municipalities by name:

```ruby
# Find municipality
municipality = NlApi::Municipality.find_by(name: 'Rotterdam')

# Get province of municipality
province = municipality.province

# Get municipalities in the province
province.municipalities
# [#<NlApi::Municipality:0x007fa8fc2247a8 @code=482, @name="Alblasserdam", @province_name="Zuid-Holland", @province_code=28>, ...]

# Get the municipalities this one is the result of
municipality.merged_municipalities
# Result: [#<NlApi::HistoricMunicipality:0x007fa8fbc37ed0 @code=1037, @name="Charlois", @code_after_merge=599>, ...]

# Find history municipality
historic_municipality = NlApi::HistoricMunicipality.find_by(name: 'Overschie')
historic_municipality.municipality_after_merge
# Result: #<NlApi::Municipality:0x007fa8fc1cf5a0 @code=599, @name="Rotterdam", @province_name="Zuid-Holland", @province_code=28>

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Changelog

  - v1.1 Add class to deal with no longer existing municipalities
  - v1.0 first release

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maartenvanvliet/nl_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

