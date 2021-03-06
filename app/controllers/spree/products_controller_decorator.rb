Spree::ProductsController.class_eval do
  def index
    @searcher = build_searcher(params.merge(include_images: true))
    # @products = @searcher.retrieve_products_custom
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  def show
    @searcher = build_searcher(params.merge(include_images: true))
    @variants = @product.
      variants_including_master.
      display_includes.
      with_prices(current_pricing_options).
      includes([:option_values, :images])

    @product_properties = @product.product_properties.includes(:property)
    @related_products = @searcher.retrieve_products_custom.limit(5)
    @related_products_sp = @searcher.retrieve_products_custom.limit(6)
    @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
  end
end