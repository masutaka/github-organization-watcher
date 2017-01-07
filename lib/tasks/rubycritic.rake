# frozen_string_literal: true

require 'rubycritic/rake_task'

RubyCritic::RakeTask.new do |task|
  task.paths = FileList['app']
end
