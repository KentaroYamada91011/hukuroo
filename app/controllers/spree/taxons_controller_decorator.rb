Spree::TaxonsController.class_eval do
  def show
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    @products = @searcher.retrieve_products_custom
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end