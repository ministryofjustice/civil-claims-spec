module Cucumber
  module Formatter
    class TagList
      def initialize(step_mother, io, options)
        @step_mother = step_mother
        @io = io
        @tags = []
      end

      def tag_name(tag_name)
        @tags << tag_name
      end

      def after_features(features)
         counted_tags = Hash[@tags.group_by {|x| x}.map {|k,v| [k,v.count]}]
         sorted_counted_tags = counted_tags.sort_by { |k,v| v }.reverse
         sorted_counted_tags.each do |tag, count|
          puts "#{tag}  - #{count}"
        end
      end
    end
  end
end