module UuidFu
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # Identify which columns should use a Universally Unique Identifier, along with the UUID format. Available
    # formats are <tt>:default</tt>, <tt>:compressed</tt>, and <tt>:urn</tt>. The plug-in actually defaults
    # to using the <tt>:compressed</tt> format as the default since it doesn't include dashes.
    #
    # === Examples
    #
    #   # A new User instance will have the <tt>id</tt> attribute set to a UUID with the <tt>:compressed</tt>
    #   # format.
    #   class User < ActiveRecord::Base
    #     uniquely_identified_by(:id)
    #   end
    #
    #   # A new User instance will have all the attributes set to a UUID with the <tt>:default</tt>
    #   # format.
    #   class User < ActiveRecord::Base
    #     uniquely_identified_by(:id, :other, :uuid_format => :default)
    #   end
    #
    #   # A new User instance will have the <tt>:id</tt> attribute set to a UUID with the <tt>:default</tt>
    #   # format, the <tt>:other</tt> attribute will be set to a UUID with the <tt>:urn</tt> format, and
    #   # the <tt>:last</tt> attribute will be set to a UUID with the <tt>:compressed</tt> format.
    #   class User < ActiveRecord::Base
    #     uniquely_identified_by(:id => :default, :other => :urn, :last => :compressed)
    #   end
    def uniquely_identified_by(*args)
      cattr_accessor :uniquely_identified_columns
      cattr_accessor :format_for_uniquely_identified_columns

      columns_and_formats = args.extract_options!
      if columns_and_formats.empty?
        self.format_for_uniquely_identified_columns = :compact
        self.uniquely_identified_columns            = [args].flatten
      elsif columns_and_formats.include?(:uuid_format)
        self.format_for_uniquely_identified_columns = columns_and_formats.delete(:uuid_format)
        self.uniquely_identified_columns            = [args].flatten
      else
        self.uniquely_identified_columns            = columns_and_formats
      end

      self.class_eval do
        def before_create_with_uuid
          before_create_without_uuid
          self.uniquely_identified_columns.each do |column, format|
            format ||= self.format_for_uniquely_identified_columns
            uuid     = UUID.generate(format)
            self.send("#{column}=".to_sym, uuid)
          end
        end

        alias_method_chain :before_create, :uuid
      end
    end
  end
end

ActiveRecord::Base.send(:include, UuidFu)
