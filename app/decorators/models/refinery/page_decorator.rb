Refinery::Page.class_eval do
  
    has_many :pages_widgets, :class_name => 'Refinery::PagesWidgets::PagesWidget', :order => 'refinery_pages_widgets.position desc'
  
end
