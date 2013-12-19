$ ->
  delay = (ms, func) -> setTimeout func, ms
  delay 2000, -> $('.alert').fadeOut('slow')
