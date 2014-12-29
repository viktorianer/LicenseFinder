module LicenseFinder
  module CLI
    class IgnoredDependencies < Base
      extend Subcommand

      desc "list", "List all the ignored dependencies"
      def list
        say "Ignored Dependencies:", :blue
        say_each(decisions.ignored)
      end

      desc "add DEPENDENCY", "Add a dependency to be ignored"
      def add(dep)
        modifying { decisions.ignore(dep, txn) }

        say "Added #{dep} to the ignored dependencies"
      end

      desc "remove DEPENDENCY", "Remove a dependency from the ignored dependencies"
      def remove(dep)
        modifying { decisions.heed(dep, txn) }

        say "Removed #{dep} from the ignored dependencies"
      end
    end
  end
end
