guard 'cucumber', :cli => '--profile guard' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^support/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
