module Refinery
  module Widgets
    module Admin
      class WidgetsController < ::Refinery::AdminController

        crudify :'refinery/widgets/widget', :xhr_paging => true

      end
    end
  end
end
