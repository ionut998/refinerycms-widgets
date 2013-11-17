module Refinery
  module PagesWidgets
    module Admin
      class PagesWidgetsController < ActionController::Base
                  
        def update_positions
          params[:ul].each do |_, list|
            list.each do |index, hash|
              @moved_item_id = hash['id'].split(/pages_widgets\_?/)
              @current_page_widget = PagesSnippet.find_by_id(@moved_item_id)
              @current_page_widget.update_attribute(:position, index)
            end
          end
          render :nothing => true
      
        end
        
        def assign
        
          page_snippet = Refinery::PagesSnippets::PagesSnippet.new
          page_snippet.snippet_id = params[:id]
          page_snippet.page_id = params[:page]
          page_snippet.location = ((params[:location]=='left') ? 'left' : 'right')
        
          page = ::Refinery::Page.find(params[:page])
        
          if page_snippet.save
            flash[:notice] = 'Snippet added succesfully.'
            redirect_to "/refinery/pages/#{page.nested_path}/edit#page_snippet_picker"
          else
            flash[:notice] = 'Something went wrong. Please try again!'
            redirect_to "/refinery/pages/#{page.nested_path}/edit#page_snippet_picker"
          end
        
        end
      
        def unassign
        
          page_snippet = Refinery::PagesSnippets::PagesSnippet.find(params[:id])
                
          page = ::Refinery::Page.find(params[:page])
        
          if page_snippet.destroy 
            flash[:notice] = 'Snippet deleted succesfully.'
            redirect_to "/refinery/pages/#{page.nested_path}/edit#page_snippet_picker"
          else
            flash[:notice] = 'Something went wrong. Please try again!'
            redirect_to "/refinery/pages/#{page.nested_path}/edit#page_snippet_picker"
          end
        
        end
        
        
      end
    end
  end
end