Thread.new do
  runner = MailSandbox::Runner.new
  runner.config.config_file = "#{Rails.root}/config/mail_sandbox.yml"
  runner.start
end