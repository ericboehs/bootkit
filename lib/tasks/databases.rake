require 'active_record/connection_adapters/postgresql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter < AbstractAdapter
      def drop_database name
        raise 'Cowardly refusing to drop the production database' if Rails.env.production?
        disallow_connections name
        terminate_backends name
        execute "DROP DATABASE IF EXISTS #{quote_table_name(name)}"
      end

      private

      def disallow_connections name
        execute <<-SQL
          SELECT pg_terminate_backend(pg_stat_activity.pid)
          FROM pg_stat_activity
          WHERE pg_stat_activity.datname = '#{name}';
        SQL
      end

      def terminate_backends name
        execute <<-SQL
          SELECT pg_terminate_backend(pg_stat_activity.pid)
          FROM pg_stat_activity
          WHERE pg_stat_activity.datname = '#{name}';
        SQL
      end
    end
  end
end
