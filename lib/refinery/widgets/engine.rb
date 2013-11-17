module Refinery
  module Widgets
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Widgets

      engine_name :refinery_widgets

      initializer "register refinerycms_widgets plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "widgets"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.widgets_admin_widgets_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/widgets/widget'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Widgets)
      end
    end
  end
end
