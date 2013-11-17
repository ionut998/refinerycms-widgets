module Refinery
  module PagesWidgets
    class PagesWidget < Refinery::Core::BaseModel
        
      self.table_name = 'refinery_pages_widgets'
      
      default_scope order(:position)
      
      #belongs_to :page
      belongs_to :widget, :class_name => 'Refinery::Widgets::Widget'

      validates :page_id, :presence => true
      validates :widget_id, :presence => true
            
    end
  end
end