Spree::HomeController.class_eval do
  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = Spree::Product.all
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end