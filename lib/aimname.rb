require 'active_support/core_ext/hash/indifferent_access'
require 'yaml'

class AimName
  attr_accessor :gender

# Params: gender
  def initialize(options={})
    options = options.with_indifferent_access
    @gender = options.has_key?(:gender) ? options[:gender] : :female
  end

  def generate
    config_file = File.join(File.dirname(__FILE__), '..', 'config/words.yaml')
    source = YAML.load(File.read config_file).with_indifferent_access
    adjectives = source[@gender]['adjectives'] || nil
    nouns = source[@gender]['nouns'] || nil
    spacers = source[@gender]['spacers'] || nil

    spacer = spacers.inject("") do |memo, s|
      spacers.sample == s ? memo + s : memo
    end

    name = [adjectives.sample, nouns.sample].join spacers.nil? ? "" : spacer
    name + source['numbers'].sample
  end
end
