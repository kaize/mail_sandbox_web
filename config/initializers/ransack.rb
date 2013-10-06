Ransack.configure do |config|
  config.add_predicate 'date_eq',
  :arel_predicate => 'eq',
  :formatter => proc { |v| v.to_date.to_s(:db) },
  :validator => proc { |v| v.present? },
  :compounds => true,
  :type => :date
end