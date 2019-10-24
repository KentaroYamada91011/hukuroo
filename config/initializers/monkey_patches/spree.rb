# frozen_string_literal: true

require 'spree/deprecation'

module Spree
  module Core
    module Search
      class Base
        def retrieve_products_custom
          @products = get_base_scope_custom
          curr_page = @properties[:page] || 1

          unless Spree::Config.show_products_without_price
            @products = @products.joins(:prices).merge(Spree::Price.where(pricing_options.search_arguments)).distinct
          end
          @products = @products.page(curr_page).per(@properties[:per_page])
        end
        protected

        def get_base_scope_custom
          base_scope = Spree::Product.display_includes
          base_scope = base_scope.in_taxon(@properties[:taxon]) unless @properties[:taxon].blank?
          base_scope = get_products_conditions_for(base_scope, @properties[:keywords])
          base_scope = add_search_scopes(base_scope)
          base_scope = add_eagerload_scopes(base_scope)
          base_scope
        end
      end
    end
  end
end