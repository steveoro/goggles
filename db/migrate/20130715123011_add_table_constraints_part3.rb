class AddTableConstraintsPart3 < ActiveRecord::Migration
  def up
    # ----------------- SWIMMING POOL REVIEWS ---------------------------------
    execute <<-SQL
      ALTER TABLE swimming_pool_reviews
        ADD CONSTRAINT fk_swimming_pool_reviews_swimming_pools
        FOREIGN KEY (swimming_pool_id)
        REFERENCES swimming_pools(id)
    SQL

    # ----------------- COMMENTS ----------------------------------------------
    execute <<-SQL
      ALTER TABLE comments
        ADD CONSTRAINT fk_comments_swimming_pool_reviews
        FOREIGN KEY (swimming_pool_review_id)
        REFERENCES swimming_pool_reviews(id)
    SQL
    execute <<-SQL
      ALTER TABLE comments
        ADD CONSTRAINT fk_comments_comments
        FOREIGN KEY (comment_id)
        REFERENCES comments(id)
    SQL

    # ----------------- TAG 4 ENTITIES ----------------------------------------
    execute <<-SQL
      ALTER TABLE tag4_entities
        ADD CONSTRAINT fk_tag4_entities_tags
        FOREIGN KEY (tag_id)
        REFERENCES tags(id)
    SQL
  end
  # ---------------------------------------------------------------------------



  def down
    # ----------------- SWIMMING POOL REVIEWS ---------------------------------
    execute <<-SQL
      ALTER TABLE swimming_pool_reviews
        DROP FOREIGN KEY fk_swimming_pool_reviews_swimming_pools
    SQL

    # ----------------- COMMENTS ----------------------------------------------
    execute <<-SQL
      ALTER TABLE comments
        DROP FOREIGN KEY fk_comments_swimming_pool_reviews
    SQL
    execute <<-SQL
      ALTER TABLE comments
        DROP FOREIGN KEY fk_comments_comments
    SQL

    # ----------------- TAG 4 ENTITIES ----------------------------------------
    execute <<-SQL
      ALTER TABLE tag4_entities
        DROP FOREIGN KEY fk_tag4_entities_tags
    SQL
  end
  # ---------------------------------------------------------------------------
end
