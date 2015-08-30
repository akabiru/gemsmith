module Gemsmith
  module Skeletons
    # Configures Git support.
    class GitSkeleton < BaseSkeleton
      def create_ignore_file
        cli.template "%gem_name%/.gitignore.tt", cli.template_options
      end

      def create_repository
        Dir.chdir(File.join(cli.destination_root, cli.gem_name)) do
          `git init`
          `git add .`
          `git commit --all --no-verify --message "Added Gemsmith skeleton."`
        end
      end

      def create
        create_ignore_file
        create_repository
      end
    end
  end
end
