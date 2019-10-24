Spree::TaxonsController.class_eval do
  def show
    @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
    p "山田"
    p @searcher
    p "山田b"
    p @searcher.retrieve_products_custom
    @products = @searcher.retrieve_products_custom
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end