module ArticlesHelper
  def main_article
    Article.includes(:votes).all.max { |a, b| a.votes.count <=> b.votes.count }
  end

  def count_votes
    main_article.votes.count
  end

  def sports_article
    Article.where(category_id: '1').last
  end

  def shooters_article
    Article.where(category_id: '3').last
  end

  def rpg_article
    Article.where(category_id: '3').last
  end

  def adventure_article
    Article.where(category_id: '4').last
  end

  def classics_article
    Article.where(category_id: '5').last
  end

end
