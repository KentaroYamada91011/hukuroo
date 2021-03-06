Spree::HomeController.class_eval do
  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products.limit(5)
    @products_sp = @searcher.retrieve_products.limit(6)
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @top_page = true
  end
end