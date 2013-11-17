module Refinery
  module Widgets
    class Widget < Refinery::Core::BaseModel
      self.table_name = 'refinery_widgets'

      attr_accessible :title, :body, :position

      acts_as_indexed :fields => [:title, :body]

      validates :title, :presence => true, :uniqueness => true
      
      scope :active, lambda { |page_id| { :conditions => ['id in (Select widget_id from refinery_pages_widgets where refinery_pages_widgets.page_id = ?)', page_id] }}
      
      scope :inactive, lambda { |page_id| { :conditions => ['id not in (Select widget_id from refinery_pages_widgets where refinery_pages_widgets.page_id = ?)', page_id] }}
            
    end
  end
end
