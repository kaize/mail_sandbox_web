Ransack.configure do |config|
  config.add_predicate 'date_eq',
  :arel_predicate => 'eq',
  :formatter => proc { |v| v },
  :validator => proc { |v| v.present? },
  :compounds => true,
  :type => :date
end