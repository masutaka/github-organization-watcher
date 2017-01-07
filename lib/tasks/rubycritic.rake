# frozen_string_literal: true

begin
  require 'rubycritic/rake_task'

  RubyCritic::RakeTask.new do |task|
    task.paths = FileList['app']
  end
rescue LoadError
  nil
end
