require "activeadmin"

module ActiveAdmin
  module SortableTree
    class Engine < ::Rails::Engine
      engine_name "active_admin-sortable_tree"

      config.aa_sortable_tree = ActiveSupport::OrderedOptions.new
      config.aa_sortable_tree.register_assets = true

        initializer "active_admin-sortable_tree.precompile", group: :all do |app|
          if !ActiveAdmin.application.respond_to?(:use_webpacker) || !ActiveAdmin.application.use_webpacker
            app.config.assets.precompile += [
              "active_admin/sortable.css",
              "active_admin/sortable.js"
            ]
          end
        end

        initializer "active_admin-sortable_tree.register_assets" do
          if !ActiveAdmin.application.respond_to?(:use_webpacker) || !ActiveAdmin.application.use_webpacker
            if config.aa_sortable_tree.register_assets
              ActiveAdmin.application.register_stylesheet "active_admin/sortable.css"
              ActiveAdmin.application.register_javascript "active_admin/sortable.js"
            end
          end
        end
    end
  end
end
