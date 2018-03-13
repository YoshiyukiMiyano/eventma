Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day',
    arel_predicate: 'lteq',
    formatter: -> (v) { v.end_of_day },
    compounds: false
end