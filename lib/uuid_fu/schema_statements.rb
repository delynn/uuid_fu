module UuidFu
  module SchemaStatements
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.alias_method_chain(:type_to_sql, :uuid)
    end

    module InstanceMethods
      def type_to_sql_with_uuid(type, limit = nil, precision = nil, scale = nil)
        case type.to_s
          when "uuid" then
            type  = :uuid
            limit = 32
          when "uuid_key" then
            type  = 'varchar(32) primary key'
            limit = 32
        end
        type_to_sql_without_uuid(type, limit, precision, scale)
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.send(:include, UuidFu::SchemaStatements)