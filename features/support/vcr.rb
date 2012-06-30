require 'vcr'

VCR.config do |c|
  c.ignore_localhost = true
  c.cassette_library_dir = Rails.root.join("features", "cassettes")
  c.stub_with :fakeweb
end