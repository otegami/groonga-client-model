# Copyright (C) 2016-2021  Sutou Kouhei <kou@clear-code.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require "pathname"
require "socket"
require "stringio"
require "uri"

require "groonga/client/test/groonga-server-runner"

require "groonga_client_model/migrator"

module GroongaClientModel
  module Test
    class GroongaServerRunner < Groonga::Client::Test::GroongaServerRunner
      def initialize(parallel_test: false)
        super()
        if parallel_test
          host = "127.0.0.1"
          port = TCPServer.open(host, 0) do |server|
            server.addr[1]
          end
          Client.url = "http://#{host}:#{port}"
        end
        @client = Client.new
      end

      def run
        super
        return if using_running_server?

        if defined?(Rails)
          base_dir = Rails.root
        else
          base_dir = Pathname.pwd
        end

        schema_path = base_dir + SchemaLoader.default_path
        migrate_path = base_dir + Migrator.default_search_path
        if schema_path.exist?
          schema_path.open do |schema_file|
            schema_loader = SchemaLoader.new(schema_file)
            schema_loader.load
          end
        elsif migrate_path.exist?
          output = StringIO.new
          migrator = Migrator.new(migrate_path)
          migrator.output = output
          migrator.migrate
        end
      end

      def url
        URI.parse(@client.url)
      end

      private
      def open_client(&block)
        @client.open(&block)
      end
    end
  end
end
